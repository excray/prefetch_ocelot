#include "llvm/Pass.h"
#include "llvm/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Analysis/ProfileInfo.h"
#include <algorithm>
#include <iostream>
#include <fstream>
#include <map>
#include <utility>
using namespace std;
using namespace llvm;

#define MAX(a, b) { return a > b? a : (b); } 
namespace {
    struct BranchPass: public FunctionPass {
        static char ID;

        typedef struct _BranchFreq
        {
            string FuncName;
            double maxFreq;
            double totalFreq;
            double DynBranchCount;

            _BranchFreq()
            {
                FuncName = "";
                maxFreq = 0.0;
                totalFreq = 0.0;
                DynBranchCount = 0.0;
            }
        }BranchFreq;

        typedef map<BasicBlock*, BranchFreq> BranchInfo;
        BranchInfo branchInfo;

        typedef BranchInfo::iterator BranchInfoItr;
        BranchInfoItr bItr;

        ProfileInfo* PI;

        BranchPass() : FunctionPass(ID) {
            //d = {0};
        }
        virtual bool runOnFunction(Function &F) {
            PI = &getAnalysis<ProfileInfo>();

            BranchFreq d;

            d.FuncName = F.getName();

            for(Function::iterator src = F.begin(), srcEnd = F.end(); src != srcEnd ; src++){
                for(Function::iterator dest = src ;  dest != srcEnd ; dest++){

                    ProfileInfo::Edge e = ProfileInfo::getEdge(&*src, &*dest);


                    double v = PI->getEdgeWeight( e );


                    if ( v != ProfileInfo::MissingValue )
                    { 
                        bItr = branchInfo.find(&*src);

                        if( bItr != branchInfo.end())
                        {
                            BranchFreq& d = bItr->second;

                            d.maxFreq =  d.maxFreq> v? d.maxFreq : v;
                            d.totalFreq += v;

                        }
                        else
                        {

                            d.maxFreq = v;
                            d.totalFreq = v;

                            branchInfo.insert(pair<BasicBlock*, BranchFreq>(&*src, d)); 
                        }
                    }

                    //for ( BasicBlock::iterator j = i + 1; j != ie; j++ )
                    //{
                    //} 


                }
            }
            WriteToFile( d );
            return false; //return true if you modified the code
        }

        void WriteToFile( const BranchFreq& d )
        {

            printf("Opening File");

            ofstream fName("benchmark.brstats");

            static bool firstTimeWrite = true;


            if ( fName.is_open())
            {
                if ( firstTimeWrite )
                {
                    firstTimeWrite = false;
                    //Wirte Header
                    fName << "FuncName\tDynBrCount\t%50-59\t%60-69\t%70-79\t%80-89\t%90-100" <<endl; 
                }
                else
                {  
                    double biasPercent = d.maxFreq *100 / d.totalFreq;

                }
            }
            else
            {
                cout<<"Failure: Unable to open file benchmark.opcstats"<<endl;
            }
        }
    };

    char BranchPass::ID = 0;

    static RegisterPass<BranchPass> X("BranchPass", "Dynamic Branch Computation Pass", false, false);
}
