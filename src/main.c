/*TODO:
#include hex from troff file (parsed or unparsed)
*/
#include <stdio.h>
#include <stdlib.h> //remove if alt to `malloc` + clone found

unsigned long int hash(){
    //implement a hashing function
    return 123456;
}

// define hashes of legal cli flags
/*TODO:
#define OUTPUT hash("-o");
#define ERROR hash("-e");
#define NOOUT hash("-t");
#definte NOERR hash("-r");
*/

// default values
char *output = "This is output", *error = "This is an error message";
// "boolean" true values
int printOut = 1, printErr = 1;

// to make the cli args globally available
char **argv;

// ! use minimal # of functions to reduce stacks ! //

void print_usage(){
    printf("HELP MENU PRINTED");
    /*TODO:
    //print hex array included at ln1
    // `stdouterr_1` is the *likely* name of the variable holding the hex
    printf("%s", stdouterr_1);
    */
}


int parse(const int index){

    int _return_value = 1;
    char* param = argv[index];

    if(param[0] == '-') {
	switch(param [1]){
	    case 'h':
		print_usage();
		exit(0);
	    case 'o':
		output = argv[index+1];
		++_return_value;
		break;
	    case 'e':
		error = argv[index+1];
		++_return_value;
		break;
	    case 't':
		printOut = 0;
		break;
	    case 'r':
		printErr = 0;
		break;
	    default:
		fprintf(stderr, "ERROR: unrecognised flags\n");
		print_usage();
		exit(1);
	}
    } else {
	fprintf(stderr, "ERROR: unrecognised flags\n");
	print_usage();
	exit(1);
    }

    // hash `param`
    /*
       hash(param)
     * */
    // run switch-case matching on hash
    /*
       switch (hashed_param) {
       case OUTPUT:
       output = argv[index+1];
       ++_return_value;
       case ERROR:
       error = argv[index+1];
       ++_return_value;
       case NOOUT:
       printOut = 0;
       case NOERR:
       printErr = 0;
       default:
       fprintf(stderr, "ERROR: unrecognised flags\n");
       print_usage();
       exit(1);
       }
       */

    return _return_value;
}

int main(const int argc, char **_argv){

    //TODO: alt method to make _argv globally accessible
    argv = malloc( sizeof *argv * argc);
    for(int i=0; i<argc; i++){
	argv[i] = _argv[i];
    }

    if(argc > 1){
	for(int counter = 1; counter < argc;){
	    counter += parse(counter);
	}
    }

    if(printOut)
	fprintf(stdout, "%s\n", output);
    if(printErr)
	fprintf(stderr, "%s\n", error);

    return 0;
}
