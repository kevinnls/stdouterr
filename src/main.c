#include <stdio.h>

char *output = "This is output", *error = "This is an error message";
int printOut = 0, printErr = 0;

void write_stdout(){
    fprintf(stdout, "%s\n", output);
}

void write_stderr(){
    fprintf(stderr, "%s\n", error);
}

int main(int argc, char const *argv[]) {

    if(argc > 1){
	//parse the arguments
    }

    write_stdout();
    write_stderr();

    return 0;
}
