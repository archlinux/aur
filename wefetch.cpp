#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <map>
#include <sstream>
#include <iomanip>
#include <unistd.h>
#include <sys/utsname.h>
#include <sys/sysinfo.h>
#include <pwd.h>
#include <filesystem>
#include <algorithm>

class WeFetch {
private:
    std::map<std::string, std::string> config;
    std::vector<std::string> displayOrder;
    
    // Цвета
    const std::string RESET = "\033[0m";
    const std::string BOLD = "\033[1m";
    std::string titleColor = "\033[1;36m";
    std::string textColor = "\033[1;37m";
    std::string separatorColor = "\033[1;30m";
    
public:
    WeFetch() {
        loadConfig();
    }
    
    void loadConfig() {
        std::string configPath = std::string(getenv("HOME")) + "/.config/wefetch/wefetch.conf";
        std::ifstream file(configPath);
        
        if (!file.is_open()) {
            createDefaultConfig();
            return;
        }
        
        std::string line;
        while (std::getline(file, line)) {
            if (line.empty() || line[0] == '#') continue;
            
            size_t pos = line.find('=');
            if (pos != std::string::npos) {
                std::string key = line.substr(0, pos);
                std::string value = line.substr(pos + 1);
                
                key.erase(0, key.find_first_not_of(" \t"));
                key.erase(key.find_last_not_of(" \t") + 1);
                value.erase(0, value.find_first_not_of(" \t"));
                value.erase(value.find_last_not_of(" \t") + 1);
                
                config[key] = value;
                
                if (key.find("display.") == 0) {
                    displayOrder.push_back(value);
                }
            }
        }
        
        // Загружаем цвета из конфига
        if (config.find("color.title") != config.end()) {
            titleColor = parseColor(config["color.title"]);
        }
        if (config.find("color.text") != config.end()) {
            textColor = parseColor(config["color.text"]);
        }
        if (config.find("color.separator") != config.end()) {
            separatorColor = parseColor(config["color.separator"]);
        }
    }
    
    void createDefaultConfig() {
        std::string configDir = std::string(getenv("HOME")) + "/.config/wefetch";
        std::filesystem::create_directories(configDir);
        
        std::string configPath = configDir + "/wefetch.conf";
        std::ofstream file(configPath);
        
        file << "# WeFetch Configuration File\n";
        file << "# Available colors: 1-255 for 256 colors, or hex like #FF0000\n\n";
        
        file << "# Colors\n";
        file << "color.title=33\n";
        file << "color.text=39\n";
        file << "color.separator=240\n\n";
        
        file << "# Layout\n";
        file << "separator=:\n";
        file << "title.width=12\n";
        file << "bold=true\n";
        file << "show_border=false\n";
        file << "border.char=|\n";
        file << "border.color=36\n\n";
        
        file << "# Display order (available fields)\n";
        file << "# user, host, os, kernel, uptime, packages, shell, de, wm, terminal, cpu, gpu, memory, swap, disk\n";
        file << "display.1=user\n";
        file << "display.2=host\n";
        file << "display.3=os\n";
        file << "display.4=kernel\n";
        file << "display.5=uptime\n";
        file << "display.6=packages\n";
        file << "display.7=shell\n";
        file << "display.8=de\n";
        file << "display.9=wm\n";
        file << "display.10=terminal\n";
        file << "display.11=cpu\n";
        file << "display.12=memory\n";
        file << "display.13=disk\n";
        
        std::cout << "Created default config at: " << configPath << "\n";
    }
    
    std::string parseColor(const std::string& color) {
        if (color.empty()) return "\033[37m";
        
        if (color[0] == '#') {
            // HEX to 256 color approximation (упрощенная версия)
            return "\033[38;5;39m";
        } else {
            int color_code = std::stoi(color);
            if (color_code >= 0 && color_code <= 255) {
                return "\033[38;5;" + color + "m";
            }
        }
        return "\033[37m";
    }
    
    std::string getFieldTitle(const std::string& field) {
        static std::map<std::string, std::string> titles = {
            {"user", "User"},
            {"host", "Hostname"},
            {"os", "OS"},
            {"kernel", "Kernel"},
            {"uptime", "Uptime"},
            {"packages", "Packages"},
            {"shell", "Shell"},
            {"de", "DE"},
            {"wm", "WM"},
            {"terminal", "Terminal"},
            {"theme", "Theme"},
            {"cpu", "CPU"},
            {"gpu", "GPU"},
            {"memory", "Memory"},
            {"swap", "Swap"},
            {"disk", "Disk"}
        };
        return titles[field];
    }
    
    std::string getUsername() {
        struct passwd *pw = getpwuid(getuid());
        return pw ? std::string(pw->pw_name) : "unknown";
    }
    
    std::string getHostname() {
        char hostname[256];
        return gethostname(hostname, sizeof(hostname)) == 0 ? std::string(hostname) : "unknown";
    }
    
    std::string getOS() {
        std::ifstream file("/etc/os-release");
        if (!file.is_open()) return "Linux";
        
        std::string line;
        while (std::getline(file, line)) {
            if (line.find("PRETTY_NAME=") == 0) {
                std::string name = line.substr(12);
                name.erase(std::remove(name.begin(), name.end(), '"'), name.end());
                return name;
            }
        }
        return "Linux";
    }
    
    std::string getKernel() {
        struct utsname buf;
        return uname(&buf) == 0 ? std::string(buf.release) : "unknown";
    }
    
    std::string getUptime() {
        std::ifstream file("/proc/uptime");
        if (!file.is_open()) return "unknown";
        
        double uptime_seconds;
        file >> uptime_seconds;
        
        int days = uptime_seconds / 86400;
        int hours = (uptime_seconds - days * 86400) / 3600;
        int minutes = (uptime_seconds - days * 86400 - hours * 3600) / 60;
        
        std::stringstream ss;
        if (days > 0) ss << days << "d ";
        if (hours > 0) ss << hours << "h ";
        ss << minutes << "m";
        
        return ss.str();
    }
    
    std::string getPackages() {
        int count = 0;
        
        // Pacman (Arch)
        if (std::filesystem::exists("/var/lib/pacman/local")) {
            for (const auto& entry : std::filesystem::directory_iterator("/var/lib/pacman/local")) {
                if (entry.is_directory()) count++;
            }
            return std::to_string(count) + " (pacman)";
        }
        
        // DPKG (Debian/Ubuntu)
        std::ifstream dpkg("/var/lib/dpkg/status");
        if (dpkg.is_open()) {
            std::string line;
            while (std::getline(dpkg, line)) {
                if (line.find("Package:") == 0) count++;
            }
            return std::to_string(count) + " (dpkg)";
        }
        
        // RPM (Fedora)
        FILE* pipe = popen("rpm -qa 2>/dev/null | wc -l", "r");
        if (pipe) {
            char buffer[128];
            if (fgets(buffer, sizeof(buffer), pipe) != NULL) {
                count = std::stoi(buffer);
                pclose(pipe);
                return std::to_string(count) + " (rpm)";
            }
            pclose(pipe);
        }
        
        return "unknown";
    }
    
    std::string getShell() {
        char* shell = getenv("SHELL");
        if (!shell) return "unknown";
        
        std::string shell_str(shell);
        size_t pos = shell_str.find_last_of('/');
        return pos != std::string::npos ? shell_str.substr(pos + 1) : shell_str;
    }
    
    std::string getDE() {
        char* desktop = getenv("XDG_CURRENT_DESKTOP");
        return desktop ? std::string(desktop) : "None";
    }
    
    std::string getWM() {
        // Для Hyprland проверим переменную окружения
        char* hyprland = getenv("HYPRLAND_INSTANCE_SIGNATURE");
        if (hyprland) return "Hyprland";
        
        // Для Sway
        char* sway = getenv("SWAYSOCK");
        if (sway) return "Sway";
        
        // Для других WM
        char* wm = getenv("XDG_CURRENT_DESKTOP");
        if (wm) return wm;
        
        // Проверим через процесс
        system("ps -e | grep -E 'kwin|openbox|i3|xfwm4|mutter|compiz|qtile|bspwm' | head -1 | awk '{print $4}' > /tmp/wefetch_wm 2>/dev/null");
        std::ifstream file("/tmp/wefetch_wm");
        std::string wm_name;
        if (std::getline(file, wm_name) && !wm_name.empty()) {
            return wm_name;
        }
        
        return "unknown";
    }
    
    std::string getTerminal() {
        char* term = getenv("TERM");
        return term ? std::string(term) : "unknown";
    }
    
    std::string getCPU() {
        std::ifstream file("/proc/cpuinfo");
        if (!file.is_open()) return "unknown";
        
        std::string line;
        while (std::getline(file, line)) {
            if (line.find("model name") != std::string::npos) {
                size_t pos = line.find(':');
                if (pos != std::string::npos) {
                    std::string cpu = line.substr(pos + 2);
                    cpu.erase(0, cpu.find_first_not_of(" \t"));
                    cpu.erase(cpu.find_last_not_of(" \t") + 1);
                    
                    // Упрощаем длинные названия CPU
                    if (cpu.length() > 40) {
                        size_t pos = cpu.find('@');
                        if (pos != std::string::npos) {
                            cpu = cpu.substr(0, pos);
                            cpu.erase(cpu.find_last_not_of(" \t") + 1);
                        }
                    }
                    return cpu;
                }
            }
        }
        return "unknown";
    }
    
    std::vector<std::string> getGPUs() {
        std::vector<std::string> gpus;
        FILE* pipe = popen("lspci | grep -i 'vga\\|3d\\|2d'", "r");
        if (!pipe) return gpus;
        
        char buffer[512];
        while (fgets(buffer, sizeof(buffer), pipe) != NULL) {
            std::string line(buffer);
            // Ищем название видеокарты после последнего двоеточия
            size_t last_colon = line.find_last_of(':');
            if (last_colon != std::string::npos) {
                std::string gpu_name = line.substr(last_colon + 2);
                // Убираем версию в скобках (rev xx)
                size_t rev_pos = gpu_name.find("(rev");
                if (rev_pos != std::string::npos) {
                    gpu_name = gpu_name.substr(0, rev_pos);
                }
                gpu_name.erase(gpu_name.find_last_not_of(" \n\r\t") + 1);
                if (!gpu_name.empty()) {
                    gpus.push_back(gpu_name);
                }
            }
        }
        pclose(pipe);
        
        return gpus;
    }
    
    std::string getMemory() {
        std::ifstream file("/proc/meminfo");
        if (!file.is_open()) return "unknown";
        
        long total_mem = 0, free_mem = 0, buffers = 0, cached = 0;
        std::string line;
        
        while (std::getline(file, line)) {
            std::stringstream ss(line);
            std::string key;
            ss >> key;
            
            if (key == "MemTotal:") ss >> total_mem;
            else if (key == "MemFree:") ss >> free_mem;
            else if (key == "Buffers:") ss >> buffers;
            else if (key == "Cached:") ss >> cached;
        }
        
        if (total_mem > 0) {
            long used_mem = total_mem - free_mem - buffers - cached;
            double used_gb = used_mem / 1024.0 / 1024.0;
            double total_gb = total_mem / 1024.0 / 1024.0;
            int percent = static_cast<int>((used_mem * 100) / total_mem);
            
            std::stringstream ss;
            ss << std::fixed << std::setprecision(1) << used_gb << "GB / " << total_gb << "GB (" << percent << "%)";
            return ss.str();
        }
        
        return "unknown";
    }
    
    std::string getDisk() {
        FILE* pipe = popen("df -h --output=target,used,size,pcent 2>/dev/null | grep -E '^/|/home$|/boot$' | awk '{print $1 \": \" $2 \" / \" $3 \" (\" $4 \")\"}'", "r");
        if (!pipe) return "unknown";
        
        std::stringstream result;
        char buffer[256];
        bool first = true;
        
        while (fgets(buffer, sizeof(buffer), pipe) != NULL) {
            std::string line(buffer);
            line.erase(line.find_last_not_of(" \n\r\t") + 1);
            
            if (!line.empty()) {
                if (!first) {
                    result << ", ";
                }
                result << line;
                first = false;
            }
        }
        pclose(pipe);
        
        std::string disk_info = result.str();
        return disk_info.empty() ? "unknown" : disk_info;
    }
    
    std::string getSwap() {
        std::ifstream file("/proc/meminfo");
        if (!file.is_open()) return "unknown";
        
        long total_swap = 0, free_swap = 0;
        std::string line;
        
        while (std::getline(file, line)) {
            std::stringstream ss(line);
            std::string key;
            ss >> key;
            
            if (key == "SwapTotal:") ss >> total_swap;
            else if (key == "SwapFree:") ss >> free_swap;
        }
        
        if (total_swap > 0) {
            long used_swap = total_swap - free_swap;
            double used_gb = used_swap / 1024.0 / 1024.0;
            double total_gb = total_swap / 1024.0 / 1024.0;
            int percent = static_cast<int>((used_swap * 100) / total_swap);
            
            std::stringstream ss;
            ss << std::fixed << std::setprecision(1) << used_gb << "GB / " << total_gb << "GB (" << percent << "%)";
            return ss.str();
        }
        
        return "None";
    }
    
    void display() {
        std::map<std::string, std::string> info;
        
        // Собираем всю информацию
        info["user"] = getUsername();
        info["host"] = getHostname();
        info["os"] = getOS();
        info["kernel"] = getKernel();
        info["uptime"] = getUptime();
        info["packages"] = getPackages();
        info["shell"] = getShell();
        info["de"] = getDE();
        info["wm"] = getWM();
        info["terminal"] = getTerminal();
        info["cpu"] = getCPU();
        info["memory"] = getMemory();
        info["swap"] = getSwap();
        info["disk"] = getDisk();
        
        std::string separator = config.find("separator") != config.end() ? 
                               config["separator"] : ":";
        
        int titleWidth = 12;
        if (config.find("title.width") != config.end()) {
            titleWidth = std::stoi(config["title.width"]);
        }
        
        bool showBorder = config.find("show_border") != config.end() && 
                         config["show_border"] == "true";
        
        std::string borderColor = separatorColor;
        if (config.find("border.color") != config.end()) {
            borderColor = parseColor(config["border.color"]);
        }
        
        std::string borderChar = "|";
        if (config.find("border.char") != config.end()) {
            borderChar = config["border.char"];
        }
        
        // Выводим информацию
        for (const auto& field : displayOrder) {
            if (field == "gpu") {
                // Обработка нескольких видеокарт
                std::vector<std::string> gpus = getGPUs();
                if (!gpus.empty()) {
                    for (size_t i = 0; i < gpus.size(); ++i) {
                        std::string title = "GPU" + std::to_string(i + 1);
                        std::string value = gpus[i];
                        
                        if (showBorder) {
                            std::cout << borderColor << borderChar << RESET << " ";
                        }
                        
                        std::cout << titleColor << std::left << std::setw(titleWidth) 
                                  << (title + separator) 
                                  << RESET << textColor << value << RESET;
                                  
                        if (showBorder) {
                            std::cout << borderColor << " " << borderChar;
                        }
                        std::cout << "\n";
                    }
                }
            } else if (info.find(field) != info.end() && !info[field].empty() && info[field] != "unknown") {
                std::string title = getFieldTitle(field);
                std::string value = info[field];
                
                if (showBorder) {
                    std::cout << borderColor << borderChar << RESET << " ";
                }
                
                std::cout << titleColor << std::left << std::setw(titleWidth) 
                          << (title + separator) 
                          << RESET << textColor << value << RESET;
                          
                if (showBorder) {
                    std::cout << borderColor << " " << borderChar;
                }
                std::cout << "\n";
            }
        }
    }
};

int main() {
    WeFetch wefetch;
    wefetch.display();
    return 0;
}
