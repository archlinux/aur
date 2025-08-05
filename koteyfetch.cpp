#include <iostream>
#include <fstream>
#include <string>
#include <unistd.h>
#include <pwd.h>
#include <sys/utsname.h>
#include <iomanip>
#include <cstdlib>
#include <sstream>
#include <sys/statvfs.h>
#include <sys/sysinfo.h>
#include <ifaddrs.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <cmath>
#include <sys/stat.h>
#include <map>

// ANSI color codes
const std::string RESET = "\033[0m";
const std::string BOLD = "\033[1m";
const std::string BLACK = "\033[30m";
const std::string RED = "\033[31m";
const std::string GREEN = "\033[32m";
const std::string YELLOW = "\033[33m";
const std::string BLUE = "\033[34m";
const std::string MAGENTA = "\033[35m";
const std::string CYAN = "\033[36m";
const std::string WHITE = "\033[37m";
const std::string BRIGHT_BLACK = "\033[90m";
const std::string BRIGHT_RED = "\033[91m";
const std::string BRIGHT_GREEN = "\033[92m";
const std::string BRIGHT_YELLOW = "\033[93m";
const std::string BRIGHT_BLUE = "\033[94m";
const std::string BRIGHT_MAGENTA = "\033[95m";
const std::string BRIGHT_CYAN = "\033[96m";
const std::string BRIGHT_WHITE = "\033[97m";

struct Config {
    std::map<std::string, std::string> colors;
    std::map<std::string, bool> modules;
    
    Config() {
        // Default colors
        colors["cat"] = "cyan";
        colors["title"] = "magenta";
        colors["separator"] = "white";
        colors["labels"] = "yellow";
        colors["values"] = "white";
        colors["arrows"] = "bright_blue";
        colors["decorations"] = "bright_black";
        
        // Default modules (all enabled)
        modules["user"] = true;
        modules["os"] = true;
        modules["kernel"] = true;
        modules["uptime"] = true;
        modules["shell"] = true;
        modules["terminal"] = true;
        modules["cpu"] = true;
        modules["gpu"] = true;
        modules["memory"] = true;
        modules["swap"] = true;
        modules["disk"] = true;
        modules["local_ip"] = true;
        modules["public_ip"] = true;
    }
};

std::string getColorCode(const std::string& colorName) {
    if (colorName == "black") return BLACK;
    if (colorName == "red") return RED;
    if (colorName == "green") return GREEN;
    if (colorName == "yellow") return YELLOW;
    if (colorName == "blue") return BLUE;
    if (colorName == "magenta") return MAGENTA;
    if (colorName == "cyan") return CYAN;
    if (colorName == "white") return WHITE;
    if (colorName == "bright_black") return BRIGHT_BLACK;
    if (colorName == "bright_red") return BRIGHT_RED;
    if (colorName == "bright_green") return BRIGHT_GREEN;
    if (colorName == "bright_yellow") return BRIGHT_YELLOW;
    if (colorName == "bright_blue") return BRIGHT_BLUE;
    if (colorName == "bright_magenta") return BRIGHT_MAGENTA;
    if (colorName == "bright_cyan") return BRIGHT_CYAN;
    if (colorName == "bright_white") return BRIGHT_WHITE;
    if (colorName == "bold") return BOLD;
    return "";
}

std::string getHomeDir() {
    const char* home = getenv("HOME");
    if (home) {
        return std::string(home);
    }
    struct passwd *pw = getpwuid(getuid());
    return pw ? std::string(pw->pw_dir) : "/tmp";
}

void createConfigDir() {
    std::string homeDir = getHomeDir();
    std::string configDir = homeDir + "/.config";
    std::string koteyfetchDir = configDir + "/koteyfetch";
    std::string configFile = koteyfetchDir + "/config.jsonc";
    
    // Create .config directory if it doesn't exist
    struct stat st = {0};
    if (stat(configDir.c_str(), &st) == -1) {
        mkdir(configDir.c_str(), 0755);
    }
    
    // Create koteyfetch directory if it doesn't exist
    if (stat(koteyfetchDir.c_str(), &st) == -1) {
        mkdir(koteyfetchDir.c_str(), 0755);
    }
    
    // Create config file if it doesn't exist
    if (stat(configFile.c_str(), &st) == -1) {
        std::ofstream file(configFile);
        file << "{\n";
        file << "  // Color configuration\n";
        file << "  \"colors\": {\n";
        file << "    \"cat\": \"cyan\",           // Cat ASCII art color\n";
        file << "    \"title\": \"magenta\",      // koteyfetch title color\n";
        file << "    \"separator\": \"white\",    // Separator lines color\n";
        file << "    \"labels\": \"yellow\",      // Info labels color (User, OS, etc.)\n";
        file << "    \"values\": \"white\",       // Info values color\n";
        file << "    \"arrows\": \"bright_blue\", // Arrow symbols color\n";
        file << "    \"decorations\": \"bright_black\" // Decorative dots color\n";
        file << "  },\n\n";
        file << "  // Module configuration (true = show, false = hide)\n";
        file << "  \"modules\": {\n";
        file << "    \"user\": true,      // User@hostname\n";
        file << "    \"os\": true,        // Operating system\n";
        file << "    \"kernel\": true,    // Kernel version\n";
        file << "    \"uptime\": true,    // System uptime\n";
        file << "    \"shell\": true,     // Shell name and version\n";
        file << "    \"terminal\": true,  // Terminal name and version\n";
        file << "    \"cpu\": true,       // CPU information\n";
        file << "    \"gpu\": true,       // GPU information\n";
        file << "    \"memory\": true,    // Memory usage\n";
        file << "    \"swap\": true,      // Swap usage\n";
        file << "    \"disk\": true,      // Disk usage\n";
        file << "    \"local_ip\": true,  // Local IP address\n";
        file << "    \"public_ip\": true  // Public IP address\n";
        file << "  }\n";
        file << "}\n";
        file.close();
        
        std::cout << "Created config file: " << configFile << std::endl;
        std::cout << "Edit this file to customize colors and modules." << std::endl;
    }
}

Config loadConfig() {
    Config config;
    std::string configFile = getHomeDir() + "/.config/koteyfetch/config.jsonc";
    
    std::ifstream file(configFile);
    if (!file.is_open()) {
        return config; // Return default config
    }
    
    std::string line;
    bool inColors = false, inModules = false;
    
    while (std::getline(file, line)) {
        // Remove comments and trim
        size_t commentPos = line.find("//");
        if (commentPos != std::string::npos) {
            line = line.substr(0, commentPos);
        }
        
        // Trim whitespace
        line.erase(0, line.find_first_not_of(" \t"));
        line.erase(line.find_last_not_of(" \t") + 1);
        
        if (line.empty()) continue;
        
        if (line.find("\"colors\"") != std::string::npos) {
            inColors = true;
            inModules = false;
            continue;
        }
        
        if (line.find("\"modules\"") != std::string::npos) {
            inModules = true;
            inColors = false;
            continue;
        }
        
        if (line.find("}") != std::string::npos) {
            inColors = false;
            inModules = false;
            continue;
        }
        
        if (inColors || inModules) {
            size_t colonPos = line.find(':');
            if (colonPos != std::string::npos) {
                std::string key = line.substr(0, colonPos);
                std::string value = line.substr(colonPos + 1);
                
                // Clean key
                key.erase(0, key.find_first_not_of(" \t\""));
                key.erase(key.find_last_not_of(" \t\"") + 1);
                
                // Clean value
                value.erase(0, value.find_first_not_of(" \t\""));
                value.erase(value.find_last_not_of(" \t\",") + 1);
                
                if (inColors) {
                    config.colors[key] = value;
                } else if (inModules) {
                    config.modules[key] = (value == "true");
                }
            }
        }
    }
    
    return config;
}

std::string formatBytes(long bytes) {
    const char* units[] = {"B", "KB", "MB", "GB", "TB"};
    int unitIndex = 0;
    double size = bytes;
    
    while (size >= 1024 && unitIndex < 4) {
        size /= 1024;
        unitIndex++;
    }
    
    std::stringstream ss;
    if (unitIndex == 0) {
        ss << (long)size << " " << units[unitIndex];
    } else {
        ss << std::fixed << std::setprecision(0) << size << " " << units[unitIndex];
    }
    return ss.str();
}

std::string getUsername() {
    struct passwd *pw = getpwuid(geteuid());
    return pw ? pw->pw_name : "unknown";
}

std::string getHostname() {
    char hostname[256];
    gethostname(hostname, sizeof(hostname));
    return std::string(hostname);
}

std::string getOSInfo() {
    std::ifstream file("/etc/os-release");
    std::string line, name = "Unknown", arch = "unknown";
    
    while (std::getline(file, line)) {
        if (line.find("NAME=") == 0) {
            size_t start = line.find('"') + 1;
            size_t end = line.rfind('"');
            if (start < end) {
                name = line.substr(start, end - start);
            }
        }
    }
    
    struct utsname unameData;
    if (uname(&unameData) == 0) {
        arch = std::string(unameData.machine);
    }
    
    return name + " " + arch;
}

std::string getKernel() {
    struct utsname unameData;
    if (uname(&unameData) == 0) {
        return std::string(unameData.sysname) + " " + std::string(unameData.release);
    }
    return "Unknown";
}

std::string getUptime() {
    struct sysinfo info;
    if (sysinfo(&info) == 0) {
        long uptime_seconds = info.uptime;
        
        int days = uptime_seconds / 86400;
        int hours = (uptime_seconds % 86400) / 3600;
        int minutes = (uptime_seconds % 3600) / 60;
        
        std::stringstream ss;
        if (days > 0) ss << days << "d ";
        if (hours > 0) ss << hours << "h ";
        ss << minutes << "m";
        
        return ss.str();
    }
    return "Unknown";
}

std::string getShell() {
    const char* shell = getenv("SHELL");
    if (shell) {
        std::string shellPath(shell);
        size_t lastSlash = shellPath.rfind('/');
        std::string shellName = "unknown";
        
        if (lastSlash != std::string::npos) {
            shellName = shellPath.substr(lastSlash + 1);
        } else {
            shellName = shellPath;
        }
        
        // Try to get version
        std::string versionCommand = shellName + " --version 2>/dev/null | head -1";
        FILE* pipe = popen(versionCommand.c_str(), "r");
        if (pipe) {
            char buffer[256];
            if (fgets(buffer, sizeof(buffer), pipe) != NULL) {
                std::string version(buffer);
                version.erase(version.find_last_not_of("\n\r\t ") + 1);
                
                // Extract version number based on shell type
                if (shellName == "bash") {
                    size_t version_pos = version.find("version ");
                    if (version_pos != std::string::npos) {
                        std::string ver = version.substr(version_pos + 8);
                        size_t space = ver.find(' ');
                        if (space != std::string::npos) {
                            ver = ver.substr(0, space);
                        }
                        pclose(pipe);
                        return shellName + " " + ver;
                    }
                } else if (shellName == "zsh") {
                    size_t version_pos = version.find("zsh ");
                    if (version_pos != std::string::npos) {
                        std::string ver = version.substr(version_pos + 4);
                        size_t space = ver.find(' ');
                        if (space != std::string::npos) {
                            ver = ver.substr(0, space);
                        }
                        pclose(pipe);
                        return shellName + " " + ver;
                    }
                } else if (shellName == "fish") {
                    size_t version_pos = version.find("version ");
                    if (version_pos != std::string::npos) {
                        std::string ver = version.substr(version_pos + 8);
                        size_t space = ver.find(' ');
                        if (space != std::string::npos) {
                            ver = ver.substr(0, space);
                        }
                        pclose(pipe);
                        return shellName + " " + ver;
                    }
                }
            }
            pclose(pipe);
        }
        
        return shellName;
    }
    return "Unknown";
}

std::string getTerminal() {
    std::string termName = "Unknown";
    std::string termVersion = "";
    
    // Try to get terminal name from various environment variables
    const char* term_program = getenv("TERM_PROGRAM");
    const char* term = getenv("TERM");
    
    if (term_program) {
        termName = std::string(term_program);
    } else if (term) {
        termName = std::string(term);
    }
    
    // Try to get version based on terminal type
    if (termName == "alacritty" || termName.find("alacritty") != std::string::npos) {
        FILE* pipe = popen("alacritty --version 2>/dev/null | head -1", "r");
        if (pipe) {
            char buffer[128];
            if (fgets(buffer, sizeof(buffer), pipe) != NULL) {
                std::string version(buffer);
                size_t space = version.find(' ');
                if (space != std::string::npos) {
                    termVersion = version.substr(space + 1);
                    termVersion.erase(termVersion.find_last_not_of("\n\r\t ") + 1);
                }
            }
            pclose(pipe);
            termName = "alacritty";
        }
    } else if (termName.find("kitty") != std::string::npos) {
        FILE* pipe = popen("kitty --version 2>/dev/null", "r");
        if (pipe) {
            char buffer[128];
            if (fgets(buffer, sizeof(buffer), pipe) != NULL) {
                std::string version(buffer);
                size_t space = version.find(' ');
                if (space != std::string::npos) {
                    termVersion = version.substr(space + 1);
                    termVersion.erase(termVersion.find_last_not_of("\n\r\t ") + 1);
                }
            }
            pclose(pipe);
            termName = "kitty";
        }
    } else if (termName.find("gnome") != std::string::npos) {
        FILE* pipe = popen("gnome-terminal --version 2>/dev/null", "r");
        if (pipe) {
            char buffer[128];
            if (fgets(buffer, sizeof(buffer), pipe) != NULL) {
                std::string version(buffer);
                size_t space = version.rfind(' ');
                if (space != std::string::npos) {
                    termVersion = version.substr(space + 1);
                    termVersion.erase(termVersion.find_last_not_of("\n\r\t ") + 1);
                }
            }
            pclose(pipe);
            termName = "gnome-terminal";
        }
    }
    
    if (!termVersion.empty()) {
        return termName + " " + termVersion;
    }
    return termName;
}

std::string getCPUInfo() {
    std::ifstream file("/proc/cpuinfo");
    std::string line, model = "Unknown CPU", maxFreq = "Unknown";
    int cores = 0;
    
    while (std::getline(file, line)) {
        if (line.find("model name") != std::string::npos) {
            size_t colon = line.find(':');
            if (colon != std::string::npos) {
                model = line.substr(colon + 2);
            }
        }
        if (line.find("processor") != std::string::npos) {
            cores++;
        }
    }
    
    // Try to get max frequency
    std::ifstream maxFreqFile("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq");
    if (maxFreqFile.is_open()) {
        long freq;
        maxFreqFile >> freq;
        double freqGHz = freq / 1000000.0;
        std::stringstream ss;
        ss << std::fixed << std::setprecision(2) << freqGHz;
        maxFreq = ss.str() + " GHz";
    }
    
    return model + " (" + std::to_string(cores) + ") @ " + maxFreq;
}

std::string getGPUInfo() {
    // Try to get GPU info from lspci
    FILE* pipe = popen("lspci | grep -E '(VGA|3D|Display)' | head -1", "r");
    if (pipe) {
        char buffer[512];
        std::string result = "";
        while (fgets(buffer, sizeof(buffer), pipe) != NULL) {
            result += buffer;
        }
        pclose(pipe);
        
        if (!result.empty()) {
            // Extract GPU name after the colon
            size_t colon = result.find(':');
            if (colon != std::string::npos && colon + 2 < result.length()) {
                std::string gpu = result.substr(colon + 2);
                // Remove newline
                gpu.erase(gpu.find_last_not_of("\n\r\t ") + 1);
                
                // Clean up the GPU name - remove controller info and brackets
                size_t controller_pos = gpu.find("controller:");
                if (controller_pos != std::string::npos) {
                    gpu = gpu.substr(controller_pos + 11);
                }
                
                // Remove revision info
                size_t rev_pos = gpu.find("(rev");
                if (rev_pos != std::string::npos) {
                    gpu = gpu.substr(0, rev_pos);
                }
                
                // Trim whitespace
                gpu.erase(0, gpu.find_first_not_of(" \t"));
                gpu.erase(gpu.find_last_not_of(" \t") + 1);
                
                // Add [Discrete] suffix for dedicated cards
                if (gpu.find("NVIDIA") != std::string::npos || 
                    gpu.find("AMD") != std::string::npos || 
                    gpu.find("Radeon") != std::string::npos) {
                    gpu += " [Discrete]";
                }
                
                return gpu;
            }
        }
    }
    return "Unknown GPU";
}

std::string getMemoryInfo() {
    struct sysinfo info;
    if (sysinfo(&info) == 0) {
        long totalMem = info.totalram * info.mem_unit;
        long freeMem = info.freeram * info.mem_unit;
        long usedMem = totalMem - freeMem;
        
        int percentage = (int)((double)usedMem / totalMem * 100);
        
        return "(" + formatBytes(usedMem) + " / " + formatBytes(totalMem) + ") [" + 
               std::to_string(percentage) + "%]";
    }
    return "Unknown";
}

std::string getSwapInfo() {
    struct sysinfo info;
    if (sysinfo(&info) == 0) {
        long totalSwap = info.totalswap * info.mem_unit;
        long freeSwap = info.freeswap * info.mem_unit;
        long usedSwap = totalSwap - freeSwap;
        
        int percentage = totalSwap > 0 ? (int)((double)usedSwap / totalSwap * 100) : 0;
        
        return "(" + formatBytes(usedSwap) + " / " + formatBytes(totalSwap) + ") [" + 
               std::to_string(percentage) + "%]";
    }
    return "Unknown";
}

std::string getDiskInfo() {
    struct statvfs stat;
    if (statvfs("/", &stat) == 0) {
        long totalSpace = stat.f_blocks * stat.f_frsize;
        long freeSpace = stat.f_bavail * stat.f_frsize;
        long usedSpace = totalSpace - freeSpace;
        
        int percentage = (int)((double)usedSpace / totalSpace * 100);
        
        // Try to get filesystem type
        std::string fsType = "unknown";
        std::ifstream mounts("/proc/mounts");
        std::string line;
        while (std::getline(mounts, line)) {
            if (line.find(" / ") != std::string::npos) {
                std::stringstream ss(line);
                std::string device, mountpoint, type;
                ss >> device >> mountpoint >> type;
                fsType = type;
                break;
            }
        }
        
        return "(" + formatBytes(usedSpace) + " / " + formatBytes(totalSpace) + ") [" + 
               std::to_string(percentage) + "%] - " + fsType;
    }
    return "Unknown";
}

std::string getLocalIP() {
    struct ifaddrs *ifaddrs_ptr;
    if (getifaddrs(&ifaddrs_ptr) == -1) {
        return "Unknown";
    }
    
    std::string result = "Unknown";
    for (struct ifaddrs *ifa = ifaddrs_ptr; ifa != NULL; ifa = ifa->ifa_next) {
        if (ifa->ifa_addr == NULL) continue;
        
        if (ifa->ifa_addr->sa_family == AF_INET) {
            struct sockaddr_in* addr_in = (struct sockaddr_in*)ifa->ifa_addr;
            char ip[INET_ADDRSTRLEN];
            inet_ntop(AF_INET, &(addr_in->sin_addr), ip, INET_ADDRSTRLEN);
            
            std::string interface(ifa->ifa_name);
            std::string ipStr(ip);
            
            // Skip loopback and look for typical network interfaces
            if (interface != "lo" && ipStr != "127.0.0.1" && 
                (interface.find("eth") == 0 || interface.find("wlan") == 0 || 
                 interface.find("en") == 0 || interface.find("wl") == 0)) {
                
                // Get netmask
                struct sockaddr_in* netmask = (struct sockaddr_in*)ifa->ifa_netmask;
                if (netmask) {
                    uint32_t mask = ntohl(netmask->sin_addr.s_addr);
                    int cidr = __builtin_popcount(mask);
                    result = ipStr + "/" + std::to_string(cidr);
                    break;
                }
            }
        }
    }
    
    freeifaddrs(ifaddrs_ptr);
    return result;
}

std::string getPublicIP() {
    FILE* pipe = popen("curl -s ifconfig.me 2>/dev/null || curl -s icanhazip.com 2>/dev/null", "r");
    if (pipe) {
        char buffer[128];
        std::string result = "";
        while (fgets(buffer, sizeof(buffer), pipe) != NULL) {
            result += buffer;
        }
        pclose(pipe);
        
        // Remove newline
        if (!result.empty()) {
            result.erase(result.find_last_not_of("\n\r\t ") + 1);
            return result;
        }
    }
    return "Unknown";
}

int main() {
    // Create config directory and file if they don't exist
    createConfigDir();
    
    // Load configuration
    Config config = loadConfig();
    
    // Get color codes
    std::string catColor = getColorCode(config.colors["cat"]);
    std::string titleColor = getColorCode(config.colors["title"]);
    std::string separatorColor = getColorCode(config.colors["separator"]);
    std::string labelColor = getColorCode(config.colors["labels"]);
    std::string valueColor = getColorCode(config.colors["values"]);
    std::string arrowColor = getColorCode(config.colors["arrows"]);
    std::string decorationColor = getColorCode(config.colors["decorations"]);
    
    // Print header
    std::cout << decorationColor << "    ◦ ◦ ◦ ◦ ◦ ◦ ◦ ◦ ◦ ◦" << RESET << "\n\n";
    
    std::cout << catColor;
    std::cout << "       /\\_/\\  \n";
    std::cout << "      ( o.o ) \n";
    std::cout << "       > ^ <  \n";
    std::cout << RESET << "\n";
    
    std::cout << titleColor << "    ♦ koteyfetch ♦" << RESET << "\n\n";
    
    // Print system information based on config
    if (config.modules["user"]) {
        std::cout << "    " << labelColor << "● User      " << arrowColor << "→ " << valueColor << getUsername() << "@" << getHostname() << RESET << "\n";
    }
    if (config.modules["os"]) {
        std::cout << "    " << labelColor << "● OS        " << arrowColor << "→ " << valueColor << getOSInfo() << RESET << "\n";
    }
    if (config.modules["kernel"]) {
        std::cout << "    " << labelColor << "● Kernel    " << arrowColor << "→ " << valueColor << getKernel() << RESET << "\n";
    }
    if (config.modules["uptime"]) {
        std::cout << "    " << labelColor << "● Uptime    " << arrowColor << "→ " << valueColor << getUptime() << RESET << "\n";
    }
    if (config.modules["shell"]) {
        std::cout << "    " << labelColor << "● Shell     " << arrowColor << "→ " << valueColor << getShell() << RESET << "\n";
    }
    if (config.modules["terminal"]) {
        std::cout << "    " << labelColor << "● Terminal  " << arrowColor << "→ " << valueColor << getTerminal() << RESET << "\n";
    }
    if (config.modules["cpu"]) {
        std::cout << "    " << labelColor << "● CPU       " << arrowColor << "→ " << valueColor << getCPUInfo() << RESET << "\n";
    }
    if (config.modules["gpu"]) {
        std::cout << "    " << labelColor << "● GPU       " << arrowColor << "→ " << valueColor << getGPUInfo() << RESET << "\n";
    }
    if (config.modules["memory"]) {
        std::cout << "    " << labelColor << "● Memory    " << arrowColor << "→ " << valueColor << getMemoryInfo() << RESET << "\n";
    }
    if (config.modules["swap"]) {
        std::cout << "    " << labelColor << "● Swap      " << arrowColor << "→ " << valueColor << getSwapInfo() << RESET << "\n";
    }
    if (config.modules["disk"]) {
        std::cout << "    " << labelColor << "● Disk      " << arrowColor << "→ " << valueColor << getDiskInfo() << RESET << "\n";
    }
    if (config.modules["local_ip"]) {
        std::cout << "    " << labelColor << "● Local IP  " << arrowColor << "→ " << valueColor << getLocalIP() << RESET << "\n";
    }
    if (config.modules["public_ip"]) {
        std::cout << "    " << labelColor << "● Public IP " << arrowColor << "→ " << valueColor << getPublicIP() << RESET << "\n";
    }
    
    std::cout << "\n" << decorationColor << "    ◦ ◦ ◦ ◦ ◦ ◦ ◦ ◦ ◦ ◦" << RESET << "\n";
    
    return 0;
}
