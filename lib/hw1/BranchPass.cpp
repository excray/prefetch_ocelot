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

        ofstream fName;

        typedef struct _BranchFreq
        {
            string FuncName;
            double DynBranchCount;
            double bias[5];


            _BranchFreq()
            {
                FuncName = "";
                DynBranchCount = 0.0;
                bias[0]=0.0;
                bias[1]=0.0;
                bias[2]=0.0;
                bias[3]=0.0;
                bias[4]=0.0;
            }

        }BranchFreq;

        typedef map<BasicBlock*, BranchFreq> BranchInfo;
        BranchInfo branchInfo;

        typedef BranchInfo::iterator BranchInfoItr;
        BranchInfoItr bItr;

        ProfileInfo* PI;

        BranchPass() : FunctionPass(ID), fName("benchmark.brstats") {
            //d = {0};
        }
        virtual bool runOnFunction(Function &F) {
            PI = &getAnalysis<ProfileInfo>();

            BranchFreq d;

            d.FuncName = F.getName();

            // errs()<<d.FuncName<<"\n";
            int block1 = 0;
            int block2 = 0;
            int blockCount=0;
        
            int biasCount = 0;
            double totalCount = 0;

            for(Function::iterator src = F.begin(), srcEnd = F.end(); src != srcEnd ; src++, block1++){

                block2 = block1;
                double maxFreq = 0.0;
                double branchCnt = 0.0;

                for(Function::iterator dest = src ;  dest != srcEnd ; dest++, block2++){


                    ProfileInfo::Edge e = ProfileInfo::getEdge(&*src, &*dest);


                    double v = PI->getEdgeWeight( e );


                    if ( v != ProfileInfo::MissingValue  )
                    {
                        errs()<<d.FuncName
                            <<" Edge From "<<block1<<" to "<<block2<<" "<<v<<"\n"; 

                        maxFreq =  maxFreq > v? maxFreq : v;
                        branchCnt += v;
                        totalCount += v;

                    }
                }

                if( branchCnt != 0 ) 
                { 
                    double percentRange = maxFreq * 100.0 / branchCnt;

                    if ( percentRange >= 50.0 )
                    {
                     unsigned int bucket = static_cast<unsigned int>(( percentRange - 50.0) / 10.0);
                     if ( bucket == 5 ) bucket--;
                     d.bias[bucket] += maxFreq;
                     d.DynBranchCount += branchCnt;
                    }
                }
            }

            errs()<<"The block cnt "<<totalCount<<"\n";
            WriteToFile( d );
            return false; //return true if you modified the code
        }

        void WriteToFile( const BranchFreq& d )
        {

            printf("Opening File");


            static bool firstTimeWrite = true;


            if ( fName.is_open())
            {
                if ( firstTimeWrite )
                {
                    firstTimeWrite = false;
                    //Wirte Header
                    fName << "FuncName\tDynBrCount\t%50-59\t%60-69\t%70-79\t%80-89\t%90-100" <<endl; 
                }

                fName << d.FuncName <<"\t"<<d.DynBranchCount<<"\t"<<d.bias[0]<<"\t"<<d.bias[1]<<"\t"<<d.bias[2]
                    <<"\t"<<d.bias[3]<<"\t"<<d.bias[4]<<endl;


                //double biasPercent = d.maxFreq *100 / d.totalFreq;
                //errs()<<"Bias Percent "<<biasPercent<<"\n";

            }
            else
            {
                cout<<"Failure: Unable to open file benchmark.opcstats"<<endl;
            }
        }
        // We don't modify the program, so we preserve all analyses
        virtual void getAnalysisUsage(AnalysisUsage &AU) const {
            AU.addRequired<ProfileInfo>();
            AU.setPreservesAll();
        }

    };

    char BranchPass::ID = 0;

    static RegisterPass<BranchPass> X("BranchPass", "Dynamic Branch Computation Pass", false, false);
}
