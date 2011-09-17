#include "llvm/Pass.h"
#include "llvm/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Analysis/ProfileInfo.h"
using namespace llvm;
namespace {
    struct statComp: public FunctionPass {
        static char ID;
        ProfileInfo* PI;
        statComp() : FunctionPass(ID) {}
        virtual bool runOnFunction(Function &F) {
            PI = &getAnalysis<ProfileInfo>();
            double intAddCount = 0;
            for(Function::iterator b = F.begin(), be = F.end(); b != be; ++b) {
                for(BasicBlock::iterator i = b->begin(), ie = b->end(); i != ie; i++){
                    if(i->getOpcode() == 8){
                        intAddCount += PI->getExecutionCount(b);
                    }
                }
            }
            errs() <<"The total number of ADD: "<<intAddCount<<"\n";
            return false; //return true if you modified the code
        }
    };
}

