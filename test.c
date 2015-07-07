#include <stdio.h>
#include <groove/groove.h>

int main() {
    printf("Currently installed libgroove version: %s\n", groove_version());
    return 0;
}
