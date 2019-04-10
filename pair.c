#include <stdio.h>

#define NO_FORMAT "\033[0m"
#define BOLD "\033[1m"
#define GREEN "\033[38;5;158m"
#define RED "\033[38;5;203m"

const char* title =
"           _ _                 _\n"
"      __ _(_) |_   _ __   __ _(_)_ __\n"
"     / _` | | __| | '_ \\ / _` | | '__|\n"
"    | (_| | | |_  | |_) | (_| | | |\n"
"     \\__, |_|\\__| | .__/ \\__,_|_|_|\n"
"     |___/        |_|\n";

int main() {
    printf("%s%s%s", RED, title, NO_FORMAT);
    
    FILE *pair_file;
    pair_file = fopen(".gitpair", "r");

    return 0;
}

