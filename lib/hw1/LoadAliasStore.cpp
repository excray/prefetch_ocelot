#include "llvm/Pass.h"
#include "llvm/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Analysis/ProfileInfo.h"
#include "LAMP/LAMPLoadProfile.h"
#include "LAMP/LAMPProfiling.h"
#include <algorithm>
#include <iostream>
#include <fstream>
#include <map>
#include <utility>
using namespace std;
using namespace llvm;

#define MAX(a, b) { return a > b? a : (b); } 
namespace {

    struct LoadAliasPass: public FunctionPass {
        static char ID; 
        ofstream fName;
        ProfileInfo* PI;
        LAMPLoadProfile *LI;

        LoadAliasPass() : FunctionPass(ID), fName("benchmark.ldstats") {
            //d = {0};
        }
        virtual bool runOnFunction(Function &F) {

            PI = &getAnalysis<ProfileInfo>();
            LI = &getAnalysis<LAMPLoadProfile>();

            typedef std::pair<Instruction*, Instruction*>* PtrPair; 
            typedef std::map< PtrPair, unsigned int> NumeratorMap;
            typedef NumeratorMap::iterator NumItr;
            typedef map<unsigned int, unsigned int> IDtoAliasCount;
            typedef map<unsigned int, double> IDtoTotalLoad;

            typedef IDtoAliasCount::iterator IDtoAliasItr;
            typedef IDtoTotalLoad::iterator IDtoTotalItr;

            IDtoAliasCount idToAliasCount;
            

            NumItr nItr = LI->DepToTimesMap.begin();
            PtrPair pp;



            while ( nItr != LI->DepToTimesMap.end())
            {
                pp = nItr->first;
                Instruction* inst = pp->first;
                unsigned int loadId = LI->InstToIdMap[inst];

                errs()<<"LoadId "<<loadId<<" Alias "<<nItr->second<<"\n";
                
                idToAliasCount[loadId] += nItr->second;

                nItr++;
            }
            errs()<<"End of Numerator \n";            

            IDtoAliasItr idToAliasItr = idToAliasCount.begin();

            IDtoTotalLoad idTotalMap;
            while( idToAliasItr != idToAliasCount.end())
            {
                Instruction* inst =LI->IdToInstMap[idToAliasItr->first];
                BasicBlock* bb = inst->getParent();

                double execCount =  PI->getExecutionCount( bb );
                unsigned int loadId = idToAliasItr->first;

                errs()<<"LoadId "<<loadId<<" Alias "<<execCount<<"\n";
                
  
                idTotalMap[ loadId ] = execCount;
                idToAliasItr++;
            }

            if (fName.is_open())
            {
                idToAliasItr = idToAliasCount.begin();
                while( idToAliasItr != idToAliasCount.end())
                {
                    unsigned int loadId = idToAliasItr->first;
                    WriteToFile( loadId , (double)(idToAliasItr->second / idTotalMap[loadId]));
                    idToAliasItr++;
                }
            }
            else
            {
                errs()<<"Error creating file benchmark.ldstats\n";
            }
              

            return false;
        }

        void WriteToFile(unsigned int loadId, double dependenceFraction)
        {
            static bool firstTime = true;

            if ( firstTime )
            {
                firstTime = false;
                fName <<"LoadId\tDependenceFraction\n";
            }

            fName<<loadId<<"\t"<<dependenceFraction<<"\n";
        }

        virtual void getAnalysisUsage(AnalysisUsage &AU) const {
            AU.addRequired<ProfileInfo>();
            AU.addRequired<LAMPLoadProfile>();
//            AU.add
            AU.setPreservesAll();
        }

    };

    char LoadAliasPass::ID = 0;

    static RegisterPass<LoadAliasPass> X("ld", "Dependence Fraction Computation", false, false); 
}



