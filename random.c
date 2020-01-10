#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <argp.h>
#include <stdbool.h>

/* Arguments */
const char *argp_program_version = "random 1.3";
static char doc[] = "Random number generator.";
static char args_doc[] = "";
static struct argp_option options[] = {
    { "min", 'm', "int", 0, "Set minimum value [Default = 1]."},
    { "max", 'x', "int", 0, "Set maximum value [Default = 100]."},
    { "float", 'f', 0, 0, "Returns float numbers instead of integers."},
    { "dec", 'd', "int", 0, "Sets N decimal digits to show with float parameter [Default = 2]."},
    { "gen", 'g', "int", 0, "Generates N numbers [Default = 1]."},
    { "line", 'l', 0, 0, "Disable line jumping, i.e. '\\n'."},
    { 0 }
};

struct arguments {
    int min, max;
    bool useFloat;
    int dec;
    int gen;
    bool noLine;
};

static error_t parse_opt(int key, char *arg, struct argp_state *state) {
    struct arguments *arguments = state->input;
    switch (key) {
        case 'm':
            arguments->min = arg ? atoi (arg) : 1;
            break;
        case 'x':
            arguments->max = arg ? atoi (arg) : 100;
            break;
        case 'd':
            arguments->dec = arg ? atoi (arg) : 2;
            break;
        case 'g':
            arguments->gen = arg ? atoi (arg) : 1;
            break;
        case 'f':
            arguments->useFloat = true;
            break;
        case 'l':
            arguments->noLine = true;
            break;
        case ARGP_KEY_ARG:
            return 0;
        default:
            return ARGP_ERR_UNKNOWN;
    }   
    return 0;
}

static struct argp argp = { options, parse_opt, args_doc, doc, 0, 0, 0 };

/* Functions */
void showHelp();
int isNumber(const char* s);

/* Code */
int main(int argc, char *argv[]) {
    struct arguments arguments;

    arguments.min = 1;
    arguments.max = 100;
    arguments.dec = 2;
    arguments.gen = 1;
    arguments.useFloat = false;
    arguments.noLine = false;

    argp_parse(&argp, argc, argv, 0, 0, &arguments);

    if(arguments.min > arguments.max){
        int tmp = arguments.min;
        arguments.min = arguments.max;
        arguments.max = tmp;
    }

    /*
     *  Generator
     */
    srand(time(NULL));
    if(!arguments.useFloat){ // Generate integers
        for(int i = 0; i < arguments.gen; i++){
            int r = (rand() % (arguments.max + 1));
            if(r < arguments.min) r += arguments.min;
            if(arguments.noLine) printf("%d ", r);
            else printf("%d\n", r);
        }
    }else{ // Generate floats
        for(int i = 0; i < arguments.gen; i++){
            float r = ((float)rand()/(float)(RAND_MAX)) * arguments.max;
            if(r < arguments.min) r += arguments.min;
            if(arguments.noLine) printf("%.*f ", arguments.dec,(float)r);
            else printf("%.*f\n", arguments.dec,(float)r);
        }
    }
    return 0;
}

int isNumber(const char* s){
    if(s == NULL || *s == '\0' || isspace(*s))
        return 0;
    char* p;
    strtod(s, &p);
    return *p == '\0';
}