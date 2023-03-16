#include <stdio.h>
#include "patcher.h"
#pragma "-Wpointer-arith"

int main()
{
    char name[80] = "W:\\CrackMe\\sanyahard\\sanya2.com";

    PatcherMain(name);

//    EndPatch();

    return 0;
}
