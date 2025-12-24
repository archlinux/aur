#include <iostream>
#include <ctime>
#include <string>

void print_help(){
    std::cout << "Usage: metal_time [options]\n\n"
    "Options:\n"
    " -h,  --help            Shows this help message.\n"
    " -12, --use-12hr       Uses 12 hour system (AM/PM) instead of 24 hour system.\n"
    " -s,  --no-seconds      Stops displaying seconds, only hours and minutes.\n";
}

bool no_seconds = false;
bool use_12hr = false;
bool invalid_option = false;
std::string bad_arg;
const char* format;

int main(int argc, char* argv[]) {
    time_t now = time(nullptr);
    tm* local = localtime(&now);
    


    for (int i = 1; i < argc; ++i) {
        std::string arg = argv[i];

        if (arg == "-h" || arg == "--help") {
            print_help();
            return 0;
        }

        if (arg == "-s" || arg == "--no-seconds") {
            no_seconds = true;
            continue;
        }

        if (arg == "-12" || arg == "--use-12hr") {
            use_12hr = true;
            continue;
        }

        if (arg[0] == '-') {
            invalid_option = true;
            bad_arg = arg;
            break;
        }

    }

    if (invalid_option) {
    std::cerr << "metal_time: invalid option '" << bad_arg << "'\n";
    std::cerr << "Try 'metal_time --help' for more information.\n";
    return 1;
    }


    if (use_12hr) {
        format = no_seconds ? "%I:%M %p" : "%I:%M:%S %p";
    } else {
        format = no_seconds ? "%H:%M" : "%H:%M:%S";
    }


    char buf[64];
    strftime(buf, sizeof(buf), format, local);

    FILE* pipe = popen("toilet -f mono12 -F metal -t", "w");
    if (!pipe) return 1;

    fprintf(pipe, "%s\n", buf);
    pclose(pipe);
 
    return 0;
}
