#include <stdio.h>
#include <time.h>
#include <stdlib.h>
typedef enum { false, true } bool;

void showHelp();
int isNumber(const char* s);

int main(int argc, char const *argv[]) {
    if(argc > 1 && (strcmp(argv[1],"-h") == 0 || strcmp(argv[1],"-help") == 0 || strcmp(argv[1],"--h") == 0 || strcmp(argv[1],"--help") == 0)){
        showHelp();
        return 0;
    }
    /*                                 SETUP                                 */
    int max = 100,
        min = 1;
    bool f = false, // float
        line = false;
    int dec = 2; // decimal numbers
    int gen = 1;
    for(int i = 1; i < argc; i++){
        if(isNumber(argv[i])){
            if(argc == 2 || (argc > 2 && !isNumber(argv[i+1])))
                max = atoi(argv[i]);
            else min = atoi(argv[i]);
            if(i == 2)
                max = atoi(argv[i]);
        }else{
            if(strcmp(argv[i],"-f") == 0 || strcmp(argv[i],"-float") == 0)
                f = true;
            else if(strcmp(argv[i],"-l") == 0 || strcmp(argv[i],"-line") == 0)
                line = true;
            else if(strcmp(argv[i],"-d") == 0 || strcmp(argv[i],"-dec") == 0){
                if(i == argc-1 || !atoi(argv[i+1])) return printf("[Error]: Argument '%s' without a value.\n", argv[i]);
                dec = atoi(argv[i+1]);
                i++;
                f = true;
            }else if(strcmp(argv[i],"-g") == 0 || strcmp(argv[i],"-gen") == 0){
                if(i == argc-1 || !atoi(argv[i+1])) return printf("[Error]: Argument '%s' without a value.\n", argv[i]);
                gen = atoi(argv[i+1]);
                i++;
            }else return printf("[Error]: Unknown argument: '%s'.\n", argv[i]);
        }
    }
    if(min > max){
        int tmp = min;
        min = max;
        max = tmp;
    }
    /*                                 GENERATOR                                 */
    srand(time(NULL));
    if(!f){
        for(int i = 0; i < gen; i++){
            int r = (rand() % (max + 1));
            if(r < min) r += min;
            if(line) printf("%d ", r);
            else printf("%d\n", r);
        }
    }else{
        for(int i = 0; i < gen; i++){
            float r = ((float)rand()/(float)(RAND_MAX)) * max;
            if(r < min) r += min;
            if(line) printf("%.*f ", dec,(float)r);
            else printf("%.*f\n", dec,(float)r);
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

void showHelp(){

printf("\
Random number generator\n\n\
Usage:\t\t random [min] [max] [options]\n\n\
Examples:\t random\t\t 1 ~ 100\n\
\t\t random 1 10\t 1 ~ 10\n\
\t\t random 50\t 1 ~ 50\n\n");

printf("\
OPTIONS:\n\
-f \t-float \t\t Gives a float instead of an integer\n\
-d <N> \t-dec <N> \t Sets 'N' decimal numbers to show with float parameter. [Default = 2].\n\
-g <N> \t-gen <N> \t Generates 'N' numbers. [Default = 1].\n\
-l \t-line \t\t Disable line jumping (\"\\n\").\n");

}
