#include "llvm/Pass.h"
#include "llvm/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Analysis/ProfileInfo.h"
#include <algorithm>
#include <iostream>
#include <fstream>

using namespace std;
using namespace llvm;
namespace {
    struct statComp: public FunctionPass {
        static char ID;
        static const int branchOps[7];
        static const int FALU[10];
        static const int IALU[22];
        static const int MEM[4];

        typedef struct DynOp
        {
            string funcName;
            double intAddCount;
            double floatAddCount;
            double branchCount;
            double memCount;
            double otherInstCount;
            double totalDynOpsCount;

        }DynOps; 

        DynOps d;
        ProfileInfo* PI;

        ofstream fName;

        statComp() : FunctionPass(ID), fName("benchmark.opcstats") {
            //d = {0};
        }
        virtual bool runOnFunction(Function &F) {

            //errs()<<F.getName()<<"\n";
            PI = &getAnalysis<ProfileInfo>();

            int *p, arrSize;

            d = {"",0.0,0.0,0.0,0.0,0.0,0.0};

            d.funcName = F.getName();

            //errs() << d.funcName;

            for(Function::iterator b = F.begin(), be = F.end(); b != be; ++b) {
                for(BasicBlock::iterator i = b->begin(), ie = b->end(); i != ie; i++){

                    bool otherInst = true;
                    arrSize = sizeof(branchOps)/sizeof(branchOps[0]);

                    p = const_cast<int*>(find( branchOps, branchOps + arrSize, i->getOpcode()));

                    if( p != branchOps+arrSize){
                        d.branchCount  += PI->getExecutionCount(b);
                        otherInst = false;
                    }

                    arrSize = sizeof(IALU)/sizeof(IALU[0]);

                    p = const_cast<int*>(find( IALU, IALU + arrSize, i->getOpcode()));

                    if( p != IALU+arrSize){
                        d.intAddCount += PI->getExecutionCount(b);

                        otherInst = false;
                    }

                    arrSize = sizeof(FALU)/sizeof(FALU[0]);

                    p = const_cast<int*>(find( FALU, FALU + arrSize, i->getOpcode()));

                    if( p != FALU+arrSize){
                        d.floatAddCount += PI->getExecutionCount(b);
                        otherInst = false;
                    }

                    arrSize = sizeof(MEM)/sizeof(MEM[0]);

                    p = const_cast<int*>(find( MEM, MEM + arrSize, i->getOpcode()));

                    if( p != MEM+arrSize){
                        d.memCount += PI->getExecutionCount(b);
                        otherInst = false;
                    }


                    if ( otherInst)
                    {
                        d.otherInstCount += PI->getExecutionCount(b);
                    }

                    d.totalDynOpsCount += PI->getExecutionCount(b);

                }
            }

            if ( d.totalDynOpsCount <= 0 )
            {
                //set everything to zero
                d.totalDynOpsCount = 0;
                d.intAddCount = 0;
                d.floatAddCount = 0;
                d.memCount = 0;
                d.branchCount = 0;
                d.otherInstCount = 0;
            }

            WriteToFile( d );

            return false; //return true if you modified the code
        }

        // We don't modify the program, so we preserve all analyses
        virtual void getAnalysisUsage(AnalysisUsage &AU) const {
            AU.addRequired<ProfileInfo>();
            AU.setPreservesAll();
        }


        void WriteToFile( const DynOps& d )
        {

            //errs()<<"Opening File";


            static bool firstTimeWrite = true;

            double percent = 1.0;

            if ( d.totalDynOpsCount > 0)
            { 
                percent =  100 / d.totalDynOpsCount;
            }
            if ( fName.is_open())
            {
                if ( firstTimeWrite )
                {
                    firstTimeWrite = false;
                    //Wirte Header
                    fName << "FuncName\tDynOpCount\t%IALU\t%FALU\t%MEM\t%BRANCH\t%OTHER" <<endl; 
                }
                fName << d.funcName << "\t" << d.totalDynOpsCount << "\t" << d.intAddCount * percent << "\t"
                    << d.floatAddCount * percent <<"\t" << d.memCount * percent <<"\t"
                    << d.branchCount * percent << "\t" << d.otherInstCount * percent << endl; 
            }
            else
            {
                errs()<<"Failure: Unable to open file benchmark.opcstats\n";
            }
        }
    };

    char statComp::ID = 0;
    const int statComp::branchOps[7]={1,2,3,4,5,6,7};
    const int statComp::FALU[10]={9, 11, 13, 16, 19, 33, 34, 37, 38, 43};
    const int statComp::IALU[22]={8, 10, 12, 14, 15, 17, 18, 20,21 ,22, 23, 24, 25, 30, 31, 32, 35, 36, 39, 40, 41, 42};
    const int statComp::MEM[4]={26, 27, 28, 29};
    static RegisterPass<statComp> X("Scp", "Static Computation Pass", false, false);
}
