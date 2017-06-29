#include "handle.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>

int error(char* message) {

	fprintf(stderr, "%s: %s\n", "ttyvideo", message);

	return 1;

}

static int numOptionsSpecified = 0;
static int numUniqueOptionsSpecified = 0;
static char** argumentCallMap = NULL;
static char** argumentMemStore = NULL;
static int*   argumentNumStore = NULL;
static char** helpMessages = NULL;
static char* defaultArg = NULL;
static char* defaultArgHelp = NULL;

#define MAX_ARG_SIZE 200

char* setDefaultArgument(char* helpText) {

	defaultArg = (char*)malloc(sizeof(char) * MAX_ARG_SIZE);
	defaultArgHelp = (char*)malloc(sizeof(char) * strlen(helpText));
	strcpy(defaultArgHelp, helpText);

	defaultArg[0] = '\0';

	return defaultArg;

}

#define MAX_ACCESS_MAP_SIZE 100
#define MAX_HELP_MESSAGE_ARRAY_SIZE 100

char* addArgument(char* helpText, int numArguments, char* firstCall, char* secondCall) {

	if(firstCall == NULL) {
		fprintf(stderr, "No option specified for parameter\n");
		return NULL;
	}
	if(firstCall[0] != '-') {
		fprintf(stderr, "Option '%s' does not start with a '-'\n", firstCall);
		return NULL;
	}
	if(secondCall != NULL && secondCall[0] != '-') {
		fprintf(stderr, "Option '%s' does not start with a '-'\n", secondCall);
	}

	if(argumentCallMap == NULL) {
		argumentCallMap = (char**)malloc(sizeof(char*) * MAX_ACCESS_MAP_SIZE);
	}
	if(argumentMemStore == NULL) {
		argumentMemStore = (char**)malloc(sizeof(char*) * MAX_ACCESS_MAP_SIZE);
	}
	if(argumentNumStore == NULL) {
		argumentNumStore = (int*)malloc(sizeof(int*) * MAX_ACCESS_MAP_SIZE);
	}
	if(helpMessages == NULL) {
		helpMessages = (char**)malloc(sizeof(char*) * MAX_HELP_MESSAGE_ARRAY_SIZE);
	}

	// TODO: Add ability to allocate lots of these
	char* argumentMemLocation = (char*)malloc(sizeof(char) * MAX_ARG_SIZE);
	if(argumentMemLocation == NULL) {
		fprintf(stderr, "Couldn't allocate memory to store argument to pass to %s", firstCall);
		return NULL;
	}
	argumentMemLocation[0] = '\0';

	int argumentAccessLocation = numOptionsSpecified++;
	argumentCallMap[argumentAccessLocation] = (char*)malloc(sizeof(char) * strlen(firstCall));
	strcpy(argumentCallMap[argumentAccessLocation], firstCall);
	argumentMemStore[argumentAccessLocation] = argumentMemLocation;
	argumentNumStore[argumentAccessLocation] = numArguments;


	if(secondCall == NULL) {

		helpMessages[numUniqueOptionsSpecified] = (char*)malloc(sizeof(char) * (strlen(helpText) + strlen(firstCall) + 4));

		strcpy(helpMessages[numUniqueOptionsSpecified], firstCall);
		strcat(helpMessages[numUniqueOptionsSpecified], ":\t");
		strcat(helpMessages[numUniqueOptionsSpecified], helpText);

		numUniqueOptionsSpecified++;

		return argumentMemLocation;
	}

	helpMessages[numUniqueOptionsSpecified] = (char*)malloc(sizeof(char) * (strlen(helpText) + strlen(firstCall) + 2 + 4 + strlen(secondCall)));

	strcpy(helpMessages[numUniqueOptionsSpecified], firstCall);
	strcat(helpMessages[numUniqueOptionsSpecified], ", ");
	strcat(helpMessages[numUniqueOptionsSpecified], secondCall);
	strcat(helpMessages[numUniqueOptionsSpecified], ":\t");
	strcat(helpMessages[numUniqueOptionsSpecified], helpText);

	numUniqueOptionsSpecified++;

	argumentAccessLocation = numOptionsSpecified++;
	argumentCallMap[argumentAccessLocation] = (char*)malloc(sizeof(char) * strlen(secondCall));
	strcpy(argumentCallMap[argumentAccessLocation], secondCall);
	argumentMemStore[argumentAccessLocation] = argumentMemLocation;
	argumentNumStore[argumentAccessLocation] = numArguments;

	return argumentMemLocation;
}

void printUsage() {

	if(helpMessages != NULL) {
		register int i;
		for(i = 0; i < numUniqueOptionsSpecified; ++i) {
			printf("%s\n", helpMessages[i]);
		}
	} else {
		printf("No options to display\n");
	}

}

int handle(int argc, char** argv) {

	register int i, j;
	int numArguments;
	for(i = 1; i < argc; ++i) {
		for(j = 0; j < numOptionsSpecified; ++j) {
			if(argv[i][0] != '-') {
				if(defaultArg == NULL) {
					fprintf(stderr, "Argument '%s' was passed without an option, and no default argument has been set\n", argv[0]);
					return 1;
				}
				if(defaultArg[0] != '\0') {
					fprintf(stderr, "Unrecognized option '%s'\n", argv[i]);
					return 1;
				}
				strcpy(defaultArg, argv[i]);
				break;
			}
			if(strcmp(argv[i], argumentCallMap[j]))
				continue;
			numArguments = argumentNumStore[j];
			if(numArguments) {
				if(i < argc - 1 && argv[i+1][0] != '-') {
					strcpy(argumentMemStore[j], argv[++i]);
				} else {
					fprintf(stderr, "Option '%s' requires an argument\n", argv[i]);
					return 1;
				}
			}
			else
				strcpy(argumentMemStore[j], "1"); // The option is present
			break;
		}
		if(j == numOptionsSpecified) {
			fprintf(stderr, "Unrecognized option '%s'\n", argv[i]);
			return 1;
		}
	}

	return 0;

}

void sig_handler(int signo) {
	if(signo == SIGINT)
		terminate = 1;
}
