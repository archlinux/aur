#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define DOC_DIR "/usr/share/langman/"

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: langman <language>\n");
        return 1;
    }

    char filepath[256];
    snprintf(filepath, sizeof(filepath), "%s%s.h", DOC_DIR, argv[1]);

    FILE *file = fopen(filepath, "r");
    if (file == NULL) {
        printf("Error: Language '%s' not found.\n", argv[1]);
        return 1;
    }

    char buffer[1024];
    while (fgets(buffer, sizeof(buffer), file)) {
        printf("%s", buffer);
    }

    fclose(file);
    return 0;
}
