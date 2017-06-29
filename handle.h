#ifndef HANDLE_H
#define HANDLE_H

#ifdef __cplusplus
extern "C" {
#endif

char* filename;

char* setDefaultArgument(char* helpText);

char* addArgument(char* helpText, int numArguments, char* firstCall, char* secondCall);

void printUsage();

int error(char* message);
int handle(int argc, char** argv);

int terminate;

#define TAKES_NO_ARGUMENTS 0
#define TAKES_ONE_ARGUMENT 1

void sig_handler(int signo);

#ifdef __cplusplus
}
#endif

#endif // HANDLE_H
