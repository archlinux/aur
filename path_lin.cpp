#include "path.h"

#include <stdexcept>
#include <string>
#include <sys/stat.h>
#include <unistd.h>
#include <limits.h> // Para PATH_MAX

bool path_exists(const std::string &path)
{
    struct stat buffer;
    return (stat(path.c_str(), &buffer) == 0);
}

std::string path_canonicalize(const std::string &path)
{
    char resolved_path[PATH_MAX];
    if (realpath(path.c_str(), resolved_path) == nullptr) {
        throw std::runtime_error("Error canonicalizing path");
    }
    return std::string(resolved_path);
}
