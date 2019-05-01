# Tutorial C

Hello World in C programming language.

### Requirements

* `gcc`, the `C Compiler` included in the GNU Project (included in many UNIX-based systems)

### Running

1. Create a file named `tutorial.c` and put this content inside it:
```
#include <stdio.h>

int main () {
    printf("hello world, engineer!");
}
```
2. Run `gcc -o tutorial tutorial.c` (it will compile it and create the executable file `tutorial`)
3. Run the executable `./tutorial` (it should print "hello world, engineer!" on the screen)
