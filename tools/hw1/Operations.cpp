#include <stdio.h>

int A();

int main()
{
    
    printf("In Main\n");
    int a, b, c;

    b = 10;

    c = 10;

    a= b + c;

    b = c + a;

    c = a+ b + c; 

    c = A();

    if( c > 0 )
    {
        printf("hey");
    }
    else if (a > 0)
    {
        printf("hoo");
    }
    else
    {
        printf("gheer");
    }

    switch(b)
    {
        case 1:
            printf("case 1\n");
            break;
        case 2:
            printf("case 2\n");
            break;
        default:
            printf("case d\n");
            break;
    }

    return 0;
}

int A()
{
    return 1 + 2;
}

//#include <iostream>
//#include <fstream>
//using namespace std;
//
//int main () {
//      ofstream myfile ("example.txt");
//        if (myfile.is_open())
//              {
//                      myfile << "This is a line.\n";
//                          myfile << "This is another line.\n";
//                              myfile.close();
//                                }
//          else cout << "Unable to open file";
//            return 0;
//}
