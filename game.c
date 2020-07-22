#include <stdlib.h>
#include <conio.h>

static const char Text [] = "this is my message";

int main (void) {
    clrscr ();
    cprintf ("%s", Text);
    return EXIT_SUCCESS;
}