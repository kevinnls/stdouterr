/* a temporary help prompt function
 * that i do not like
 * at all
 */
#define BOLD "\33[1m"
#define RESET "\33[0m"
#define embolden(str) BOLD str RESET

void tmp_help(){
    printf("\n%s\n", embolden("stdouterr"));
    printf("%s\n", embolden("Usage"));
    printf("    %s\n", "stdouterr [ -o output_string | -t ] [ -e error_string | -r ]");
    printf("\n%s\n", embolden("Options"));
    printf("\
	-o output_string\n\
	    Print output_string to stdout\n\
	-e error_string\n\
	    Print error_string to stderr\n\
	-t\n\
	    Don\'t print output\n\
	-r\n\
	    Don\'t print error");
}
