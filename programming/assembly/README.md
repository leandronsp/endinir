# Tutorial Assembly

Hello World in Assembly in different platforms.

### Requirements

* `nasm`, the Netwide Assembler (`apt-get install nasm` or `brew install nasm`)
* `ld`, the GNU Linker that creates an executable file for UNIX systems (Linux/Ubuntu already has it installed)

## Ubuntu LTS 16.04
* Go to the `assembly/ubuntu-lts` directory
* Run `nasm -f elf64 tutorial.asm`
* Run `ld -s -o tutorial tutorial.o`
* Run `./tutorial` (it should print on the screen)
	
## OSX Mojave 10.14.2
* Go to the `assembly/osx-mojave` directory
* Run `nasm -f macho tutorial.asm`
* Run `ld -lSystem -e _start -o tutorial tutorial.o`
* Run `./tutorial` (it should print on the screen)
