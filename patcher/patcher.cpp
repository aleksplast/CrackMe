#include <stdio.h>
#include <string.h>
#include <string.h>
#include <ctype.h>
#include <assert.h>
#include <sys\stat.h>
#include "patcher.h"

#define TRYSPEAK(line)  "<speak version='1.0' xmlns='http://www.w3.org/2001/10/synthesis' xml:lang='en-US'>\n"   \
                        "\t<voice name='my-custom-voice'>\n\t\t"                                                  \
                        #line                                               \
                        "\n\t</voice>\n"                                                                          \
                        "</speak>"

#define SUBTITLES(dc, text)     txBitBlt(txDC(), 0, 0, 0, 0, dc);           \
                                txTextOut(512, 700, text);                  \
                                txSpeak(TRYSPEAK(text));


int PatcherMain(char* name)
{
    HDC& window = InitialPrep();
    BinPatch(name);

    return NOERR;
}

int BinPatch(char* name)
{
    struct poem text = {};

    TextReader(name, &text, "r");

    text.ptr[0] = 0xEB;
    text.ptr[1] = 0x34;

    FILE* fp = fopen(name, "wb+");
    fwrite(text.ptr, sizeof(char), text.size, fp);
    fclose(fp);

    return NOERR;
}

HDC& InitialPrep()
{
    HWND window = txCreateWindow(1024, 768);

    HDC emperor = LoadImg("W:\\CrackMe\\patcher\\Emperor.bmp");
    HDC mechanicus = LoadImg("W:\\CrackMe\\patcher\\Mechanicus.bmp");
    HDC backgrd = LoadImg("W:\\CrackMe\\patcher\\MechanicusBack.bmp");

    txBitBlt(txDC(), 0, 0, 0, 0, emperor);

    txSetTextAlign();
    txSelectFont("Times New Roman", 60, 18, 300, true);
    txSetColor(TX_YELLOW);

    SUBTITLES(emperor, "HELLO");
    SUBTITLES(emperor, "I AM THE MOTHERFUCKING EMPEROR");
    SUBTITLES(emperor, "AND NOW");
    SUBTITLES(emperor, "MY LOYAL MECHANICUS");
    SUBTITLES(emperor, "SHALL CRACK THIS CODE FOR YOU");

    txSetColor(TX_LIGHTRED);
    txBitBlt(txDC(), 0, 0, 0, 0, mechanicus);
    txTextOut(512, 700, "WHERE ARE THE TOASTERS YOU PROMISED US");
    txPlaySound("Toasters.wav", SND_SYNC);

    txSetColor(TX_YELLOW);
    SUBTITLES(emperor, "SHUT UP AND GET TO WORK");

    txBitBlt(txDC(), 0, 0, 0, 0, backgrd);
    txSetColor(TX_WHITE);
    txTextOut(512, 650, "CRACKING THE CODE");

    DrawProgressBar();

    txSetColor(TX_YELLOW);
    SUBTITLES(emperor, "OKAY, THIS SHOULD BE DONE FOR NOW");
    SUBTITLES(emperor, "NOW GO AND KILL SOME HERETICS");
    SUBTITLES(emperor, "GOODBYE");

    txDeleteDC(emperor);
    txDeleteDC(mechanicus);
    txDeleteDC(backgrd);

    return txDC();
}

int DrawProgressBar()
{
    txSetFillColor(TX_WHITE);
    txPlaySound("music.wav", SND_LOOP);
    for (int i = 0; i < 1024; i++)
    {
        txRectangle(0, 675, i, 700);
        txSleep(20);
    }
    txPlaySound(NULL);

    return NOERR;
}

HDC LoadImg(char name[])
{
    HDC dc = txLoadImage(name, 1024, 768);

    if (dc == NULL)
    {
        printf("Cannot opend image %s", name);
        return NULL;
    }

    return dc;
}


