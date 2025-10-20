#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <string_view>
#include <vector>
#include <algorithm>
#include <optional>
#include <unordered_map>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <array>
#include <filesystem>
#include <cmath>
#include <sys/utsname.h>
#include <sys/sysinfo.h>
#include <sys/stat.h>
#include <pwd.h>
#include <unistd.h>

namespace fs = std::filesystem;

struct Options {
    bool os = true;
    bool kernel = true;
    bool uptime = true;
    bool packages = true;
    bool shell = true;
    bool display = true;
    bool de = true;
    bool wm = true;
    bool theme = true;
    bool icons = true;
    bool font = true;
    bool cursor = true;
    bool terminal = true;
    bool term_font = true;
    bool cpu = true;
    bool memory = true;
    bool swap = true;
    bool disk = true;
    bool gpu = true;
    bool local_ip = true;
    bool locale = true;
};

struct RGB {
    uint8_t r, g, b;
    
    std::string toAnsi() const {
        return "\033[38;2;" + std::to_string(r) + ";" + 
               std::to_string(g) + ";" + std::to_string(b) + "m";
    }
};

enum class GradientType {
    BLUE,
    RED,
    GREEN,
    PURPLE,
    ORANGE,
    NEON,
    AQUA,
    SUNSET,
    FOREST,
    MONO,
    RAINBOW,
    MAGENTA,
    GRAY
};

struct GradientConfig {
    GradientType type = GradientType::MONO;
    bool enabled = true;
    
    RGB getColorAt(size_t index, size_t total) const {
        if (total <= 1) return getStartColor();
        
        const float t = static_cast<float>(index) / (total - 1);
        
        switch (type) {
            case GradientType::BLUE:
                return interpolate({135, 206, 250}, {0, 0, 139}, t);
            case GradientType::RED:
                return interpolate({255, 69, 0}, {139, 0, 0}, t);
            case GradientType::GREEN:
                return interpolate({152, 251, 152}, {0, 128, 128}, t);
            case GradientType::PURPLE:
                return interpolate({218, 112, 214}, {75, 0, 130}, t);
            case GradientType::ORANGE:
                return interpolate({255, 191, 0}, {255, 69, 0}, t);
            case GradientType::NEON:
                return getNeonColor(t);
            case GradientType::AQUA:
                return interpolate({173, 216, 230}, {0, 206, 209}, t);
            case GradientType::SUNSET:
                return interpolate({255, 182, 193}, {255, 215, 0}, t);
            case GradientType::FOREST:
                return interpolate({34, 139, 34}, {144, 238, 144}, t);
            case GradientType::MONO:
                return {0, 120, 255};
            case GradientType::RAINBOW:
                return getRainbowColor(t);
            case GradientType::MAGENTA:
                return interpolate({255, 0, 255}, {139, 0, 139}, t);
            case GradientType::GRAY:
                return interpolate({192, 192, 192}, {64, 64, 64}, t);
            default:
                return {0, 120, 255};
        }
    }
    
private:
    RGB getStartColor() const {
        switch (type) {
            case GradientType::BLUE: return {135, 206, 250};
            case GradientType::RED: return {255, 69, 0};
            case GradientType::GREEN: return {152, 251, 152};
            case GradientType::PURPLE: return {218, 112, 214};
            case GradientType::ORANGE: return {255, 191, 0};
            case GradientType::NEON: return {255, 20, 147};
            case GradientType::AQUA: return {173, 216, 230};
            case GradientType::SUNSET: return {255, 182, 193};
            case GradientType::FOREST: return {34, 139, 34};
            case GradientType::MONO: return {0, 120, 255};
            case GradientType::RAINBOW: return {255, 0, 0};
            case GradientType::MAGENTA: return {255, 0, 255};
            case GradientType::GRAY: return {192, 192, 192};
            default: return {0, 120, 255};
        }
    }
    
    RGB interpolate(const RGB& start, const RGB& end, float t) const {
        return {
            static_cast<uint8_t>(start.r + (end.r - start.r) * t),
            static_cast<uint8_t>(start.g + (end.g - start.g) * t),
            static_cast<uint8_t>(start.b + (end.b - start.b) * t)
        };
    }
    
    RGB getNeonColor(float t) const {
        if (t < 0.33f) {
            float localT = t / 0.33f;
            return interpolate({255, 20, 147}, {0, 191, 255}, localT);
        } else if (t < 0.66f) {
            float localT = (t - 0.33f) / 0.33f;
            return interpolate({0, 191, 255}, {138, 43, 226}, localT);
        } else {
            float localT = (t - 0.66f) / 0.34f;
            return interpolate({138, 43, 226}, {50, 205, 50}, localT);
        }
    }
    
    RGB getRainbowColor(float t) const {
        float hue = t * 360.0f;
        return hsvToRgb(hue, 1.0f, 1.0f);
    }
    
    RGB hsvToRgb(float h, float s, float v) const {
        float c = v * s;
        float x = c * (1 - std::abs(std::fmod(h / 60.0f, 2) - 1));
        float m = v - c;
        
        float r, g, b;
        
        if (h >= 0 && h < 60) {
            r = c; g = x; b = 0;
        } else if (h >= 60 && h < 120) {
            r = x; g = c; b = 0;
        } else if (h >= 120 && h < 180) {
            r = 0; g = c; b = x;
        } else if (h >= 180 && h < 240) {
            r = 0; g = x; b = c;
        } else if (h >= 240 && h < 300) {
            r = x; g = 0; b = c;
        } else {
            r = c; g = 0; b = x;
        }
        
        return {
            static_cast<uint8_t>((r + m) * 255),
            static_cast<uint8_t>((g + m) * 255),
            static_cast<uint8_t>((b + m) * 255)
        };
    }
};

struct Settings {
    std::string logoPath = "logo.txt";
    std::string colorTheme = "cyan";
    size_t maxLabelWidth = 13;
    GradientConfig gradientInfo;
    GradientConfig gradientLogo;
};

class XDGPaths {
public:
    static fs::path getConfigHome() {
        const char* configHome = std::getenv("XDG_CONFIG_HOME");
        if (configHome && configHome[0] != '\0') {
            return fs::path(configHome);
        }
        
        const char* home = std::getenv("HOME");
        if (home) {
            return fs::path(home) / ".config";
        }
        
        struct passwd* pw = getpwuid(getuid());
        if (pw && pw->pw_dir) {
            return fs::path(pw->pw_dir) / ".config";
        }
        
        return fs::path();
    }
    
    static fs::path getLegacyConfigHome() {
        const char* home = std::getenv("HOME");
        if (home) {
            return fs::path(home) / ".nanofetch";
        }
        
        struct passwd* pw = getpwuid(getuid());
        if (pw && pw->pw_dir) {
            return fs::path(pw->pw_dir) / ".nanofetch";
        }
        
        return fs::path();
    }
    
    static std::vector<fs::path> getConfigDirs() {
        std::vector<fs::path> dirs;
        
        fs::path configHome = getConfigHome();
        if (!configHome.empty()) {
            dirs.push_back(configHome / "nanofetch");
        }
        
        fs::path legacyHome = getLegacyConfigHome();
        if (!legacyHome.empty()) {
            dirs.push_back(legacyHome);
        }
        
        dirs.push_back("/usr/share/nanofetch");
        dirs.push_back(fs::current_path());
        
        return dirs;
    }
    
    static bool ensureDirectory(const fs::path& dir) {
        try {
            if (!fs::exists(dir)) {
                return fs::create_directories(dir);
            }
            return fs::is_directory(dir);
        } catch (...) {
            return false;
        }
    }
    
    static bool copyFile(const fs::path& src, const fs::path& dst) {
        try {
            if (!fs::exists(src)) return false;
            if (fs::exists(dst)) return true;
            
            fs::copy_file(src, dst);
            return true;
        } catch (...) {
            return false;
        }
    }
    
    static void initializeUserConfig() {
        fs::path configHome = getConfigHome();
        if (configHome.empty()) return;
        
        fs::path userConfigDir = configHome / "nanofetch";
        
        if (!ensureDirectory(userConfigDir)) return;
        
        std::vector<fs::path> sourceDirs = {
            "/usr/share/nanofetch",
            fs::current_path()
        };
        
        std::vector<std::string> filesToCopy = {
            "logo.txt",
            "config.txt",
            "options.txt",
            "settings.txt"
        };
        
        for (const auto& filename : filesToCopy) {
            fs::path dst = userConfigDir / filename;
            
            if (fs::exists(dst)) continue;
            
            bool copied = false;
            for (const auto& sourceDir : sourceDirs) {
                fs::path src = sourceDir / filename;
                
                if (copyFile(src, dst)) {
                    copied = true;
                    break;
                }
            }
            
            if (!copied) {
                createDefaultFile(dst, filename);
            }
        }
    }
    
    static void createDefaultFile(const fs::path& filepath, const std::string& filename) {
        std::ofstream file(filepath);
        if (!file.is_open()) return;
        
        if (filename == "config.txt") {
            file << "gradient_info=mono\n";
            file << "gradient_logo=rainbow\n";
        } else if (filename == "options.txt") {
            file << "os=true\n";
            file << "kernel=true\n";
            file << "uptime=true\n";
            file << "packages=true\n";
            file << "shell=true\n";
            file << "display=true\n";
            file << "de=true\n";
            file << "wm=true\n";
            file << "theme=true\n";
            file << "icons=true\n";
            file << "font=true\n";
            file << "cursor=true\n";
            file << "terminal=true\n";
            file << "term_font=false\n";
            file << "cpu=true\n";
            file << "memory=true\n";
            file << "swap=true\n";
            file << "disk=true\n";
            file << "gpu=true\n";
            file << "local_ip=true\n";
            file << "locale=true\n";
        } else if (filename == "settings.txt") {
            file << "logo=logo.txt\n";
            file << "theme=cyan\n";
            file << "max_label_width=13\n";
        } else if (filename == "logo.txt") {
            file << "     ████████     \n";
            file << "   ██        ██   \n";
            file << "  ██          ██  \n";
            file << " ██            ██ \n";
            file << " ██    ████    ██ \n";
            file << " ██            ██ \n";
            file << "  ██          ██  \n";
            file << "   ██        ██   \n";
            file << "     ████████     \n";
        }
        
        file.close();
    }
    
    static std::optional<fs::path> findFile(const std::string& filename) {
        auto dirs = getConfigDirs();
        
        for (const auto& dir : dirs) {
            fs::path filepath = dir / filename;
            if (fs::exists(filepath) && fs::is_regular_file(filepath)) {
                return filepath;
            }
        }
        
        return std::nullopt;
    }
};

class SystemReader {
public:
    static std::string exec(const char* cmd) {
        std::array<char, 128> buffer;
        std::string result;
        FILE* pipe = popen(cmd, "r");
        if (!pipe) return "";
        
        while (fgets(buffer.data(), buffer.size(), pipe) != nullptr) {
            result += buffer.data();
        }
        pclose(pipe);
        
        if (!result.empty() && result.back() == '\n') {
            result.pop_back();
        }
        return result;
    }
    
    static std::string readFile(const char* path) {
        std::ifstream file(path);
        if (!file.is_open()) return "";
        
        std::string content;
        std::getline(file, content);
        return content;
    }
    
    static std::string getOS() {
        std::string os = exec("uname -o 2>/dev/null");
        std::string arch = exec("uname -m 2>/dev/null");
        
        if (!os.empty() && !arch.empty()) {
            return os + " " + arch;
        }
        
        std::string osRelease = readFile("/etc/os-release");
        size_t namePos = osRelease.find("PRETTY_NAME=");
        if (namePos != std::string::npos) {
            size_t start = osRelease.find('"', namePos) + 1;
            size_t end = osRelease.find('"', start);
            std::string name = osRelease.substr(start, end - start);
            if (!arch.empty()) {
                return name + " " + arch;
            }
            return name;
        }
        
        utsname unameData;
        if (uname(&unameData) == 0) {
            return std::string(unameData.sysname) + " " + unameData.machine;
        }
        return "Unknown";
    }
    
    static std::string getKernel() {
        std::string kernel = exec("uname -r 2>/dev/null");
        if (!kernel.empty()) {
            return kernel;
        }
        
        utsname unameData;
        if (uname(&unameData) == 0) {
            return std::string(unameData.release);
        }
        return "Unknown";
    }
    
    static std::string getUptime() {
        std::ifstream upfile("/proc/uptime");
        if (!upfile.is_open()) return "Unknown";
        
        double uptime_seconds;
        upfile >> uptime_seconds;
        upfile.close();
        
        long uptime = static_cast<long>(uptime_seconds);
        long days = uptime / 86400;
        long hours = (uptime % 86400) / 3600;
        long mins = (uptime % 3600) / 60;
        
        std::ostringstream oss;
        if (days > 0) oss << days << "d ";
        if (hours > 0) oss << hours << "h ";
        oss << mins << "m";
        
        return oss.str();
    }
    
    static std::string getPackages() {
        std::string result;
        
        std::string pacman = exec("pacman -Q 2>/dev/null | wc -l");
        if (!pacman.empty() && pacman != "0") {
            result = pacman + " (pacman)";
            return result;
        }
        
        std::string dpkg = exec("dpkg -l 2>/dev/null | grep ^ii | wc -l");
        if (!dpkg.empty() && dpkg != "0") {
            result = dpkg + " (dpkg)";
            return result;
        }
        
        std::string rpm = exec("rpm -qa 2>/dev/null | wc -l");
        if (!rpm.empty() && rpm != "0") {
            result = rpm + " (rpm)";
            return result;
        }
        
        return "Unknown";
    }
    
    static std::string getShell() {
        const char* shell = std::getenv("SHELL");
        if (!shell) return "Unknown";
        
        std::string shellPath(shell);
        size_t lastSlash = shellPath.find_last_of('/');
        std::string shellName = (lastSlash != std::string::npos) ? 
                                shellPath.substr(lastSlash + 1) : shellPath;
        
        std::string version = exec((shellName + " --version 2>/dev/null | head -n1").c_str());
        if (!version.empty()) {
            size_t versionPos = version.find_first_of("0123456789");
            if (versionPos != std::string::npos) {
                size_t endPos = version.find_first_not_of("0123456789.", versionPos);
                std::string versionNum = version.substr(versionPos, endPos - versionPos);
                return shellName + " " + versionNum;
            }
        }
        
        return shellName;
    }
    
    static std::string getDisplay() {
        std::string xrandr = exec("xrandr 2>/dev/null | grep ' connected' | grep -oP '\\d+x\\d+' | head -n1");
        if (!xrandr.empty()) {
            return xrandr + " @ 60Hz";
        }
        return "Unknown";
    }
    
    static std::string getDE() {
        const char* de = std::getenv("XDG_CURRENT_DESKTOP");
        if (de && strlen(de) > 0) return std::string(de);
        
        de = std::getenv("DESKTOP_SESSION");
        if (de && strlen(de) > 0) return std::string(de);
        
        return "Unknown";
    }
    
    static std::string getWM() {
        const char* wm = std::getenv("XDG_SESSION_TYPE");
        if (wm && strlen(wm) > 0) return std::string(wm);
        
        std::string wmctrl = exec("wmctrl -m 2>/dev/null | grep 'Name:' | cut -d' ' -f2-");
        if (!wmctrl.empty()) return wmctrl;
        
        return "Unknown";
    }
    
    static std::string getTheme() {
        std::string gtk3 = exec("gsettings get org.gnome.desktop.interface gtk-theme 2>/dev/null | tr -d \"'\"");
        if (!gtk3.empty()) return gtk3 + " [GTK3]";
        return "Unknown";
    }
    
    static std::string getIcons() {
        std::string icons = exec("gsettings get org.gnome.desktop.interface icon-theme 2>/dev/null | tr -d \"'\"");
        if (!icons.empty()) return icons + " [GTK3]";
        return "Unknown";
    }
    
    static std::string getFont() {
        std::string font = exec("gsettings get org.gnome.desktop.interface font-name 2>/dev/null | tr -d \"'\"");
        if (!font.empty()) return font + " [GTK3]";
        return "Unknown";
    }
    
    static std::string getCursor() {
        std::string cursor = exec("gsettings get org.gnome.desktop.interface cursor-theme 2>/dev/null | tr -d \"'\"");
        if (!cursor.empty()) return cursor;
        return "Unknown";
    }
    
    static std::string getTerminal() {
        pid_t ppid = getppid();
        std::string procPath = "/proc/" + std::to_string(ppid) + "/comm";
        std::string term = readFile(procPath.c_str());
        return term.empty() ? "Unknown" : term;
    }
    
    static std::string getTermFont() {
        return "Unknown";
    }
    
    static std::string getCPU() {
        std::ifstream cpuinfo("/proc/cpuinfo");
        std::string line, model;
        int cores = 0;
        
        while (std::getline(cpuinfo, line)) {
            if (line.find("model name") != std::string::npos) {
                size_t colonPos = line.find(':');
                if (colonPos != std::string::npos) {
                    model = line.substr(colonPos + 2);
                }
            }
            if (line.find("processor") != std::string::npos) {
                cores++;
            }
        }
        
        if (!model.empty()) {
            model = truncateCPU(model);
            
            std::string freq = exec("lscpu | grep 'CPU MHz' | awk '{print $3}'");
            if (!freq.empty()) {
                float mhz = std::stof(freq);
                std::ostringstream oss;
                oss.precision(2);
                oss << std::fixed << model << " (" << cores << ") @ " << (mhz / 1000.0) << "GHz";
                return oss.str();
            }
            return model + " (" + std::to_string(cores) + ")";
        }
        
        return "Unknown";
    }
    
    static std::string truncateCPU(const std::string& cpu) {
        std::string result = cpu;
        
        size_t pos = result.find("(R)");
        while (pos != std::string::npos) {
            result.erase(pos, 3);
            pos = result.find("(R)");
        }
        
        pos = result.find("(TM)");
        while (pos != std::string::npos) {
            result.erase(pos, 4);
            pos = result.find("(TM)");
        }
        
        pos = result.find("CPU");
        if (pos != std::string::npos) {
            result.erase(pos, 3);
        }
        
        pos = result.find(" @");
        if (pos != std::string::npos) {
            result = result.substr(0, pos);
        }
        
        std::string trimmed;
        bool prevSpace = false;
        for (char c : result) {
            if (c == ' ') {
                if (!prevSpace) {
                    trimmed += c;
                    prevSpace = true;
                }
            } else {
                trimmed += c;
                prevSpace = false;
            }
        }
        
        size_t start = trimmed.find_first_not_of(' ');
        size_t end = trimmed.find_last_not_of(' ');
        if (start != std::string::npos && end != std::string::npos) {
            trimmed = trimmed.substr(start, end - start + 1);
        }
        
        return trimmed;
    }
    
    static std::string getMemory() {
        std::ifstream meminfo("/proc/meminfo");
        if (!meminfo.is_open()) return "Unknown";
        
        unsigned long totalMem = 0, availMem = 0;
        std::string line;
        
        while (std::getline(meminfo, line)) {
            if (line.find("MemTotal:") != std::string::npos) {
                std::istringstream iss(line);
                std::string label;
                iss >> label >> totalMem;
                totalMem /= 1024;
            } else if (line.find("MemAvailable:") != std::string::npos) {
                std::istringstream iss(line);
                std::string label;
                iss >> label >> availMem;
                availMem /= 1024;
            }
        }
        
        if (totalMem > 0 && availMem > 0) {
            unsigned long usedMem = totalMem - availMem;
            std::ostringstream oss;
            oss << usedMem << " MiB / " << totalMem << " MiB";
            return oss.str();
        }
        
        return "Unknown";
    }
    
    static std::string getSwap() {
        std::string swap = exec("free -m 2>/dev/null | grep Swap | awk '{print $3 \" MiB / \" $2 \" MiB\"}'");
        return swap.empty() ? "Unknown" : swap;
    }
    
    static std::string getDisk() {
        std::string df = exec("df -h / 2>/dev/null | tail -n1 | awk '{print $3 \" / \" $2 \" (\" $5 \")\"}'");
        return df.empty() ? "Unknown" : df;
    }
    
    static std::string getGPU() {
        std::string gpu = exec("lspci 2>/dev/null | grep -i 'vga' | cut -d':' -f3 | sed 's/^[[:space:]]*//'");
        if (!gpu.empty()) {
            gpu = truncateGPUWords(gpu, 5);
            return gpu;
        }
        return "Unknown";
    }
    
    static std::string truncateGPUWords(const std::string& gpu, int maxWords) {
        std::istringstream iss(gpu);
        std::string word, result;
        int count = 0;
        
        while (iss >> word && count < maxWords) {
            if (count > 0) result += " ";
            result += word;
            count++;
        }
        
        return result;
    }
    
    static std::string getLocalIP() {
        std::string ip = exec("hostname -I 2>/dev/null | awk '{print $1}'");
        return ip.empty() ? "Unknown" : ip;
    }
    
    static std::string getLocale() {
        const char* locale = std::getenv("LANG");
        return locale ? std::string(locale) : "Unknown";
    }
};

class ConfigParser {
public:
    static std::optional<Options> parseOptions(const std::string& filename) {
        auto filepath = XDGPaths::findFile(filename);
        if (!filepath) return std::nullopt;
        
        std::ifstream file(*filepath);
        if (!file.is_open()) return std::nullopt;
        
        Options opts;
        std::string line;
        
        while (std::getline(file, line)) {
            if (auto [key, value] = parseLine(line); !key.empty()) {
                setBoolOption(opts, key, value == "true");
            }
        }
        
        return opts;
    }
    
    static std::optional<Settings> parseSettings(const std::string& filename) {
        auto filepath = XDGPaths::findFile(filename);
        if (!filepath) return std::nullopt;
        
        std::ifstream file(*filepath);
        if (!file.is_open()) return std::nullopt;
        
        Settings settings;
        std::string line;
        
        while (std::getline(file, line)) {
            if (auto [key, value] = parseLine(line); !key.empty()) {
                if (key == "logo") {
                    settings.logoPath = value;
                } else if (key == "theme") {
                    settings.colorTheme = value;
                } else if (key == "max_label_width") {
                    try {
                        settings.maxLabelWidth = std::stoul(value);
                    } catch (...) {}
                }
            }
        }
        
        return settings;
    }
    
    static Settings parseGradients(const std::string& filename) {
        Settings settings;
        settings.gradientInfo.type = GradientType::MONO;
        settings.gradientLogo.type = GradientType::MONO;
        
        auto filepath = XDGPaths::findFile(filename);
        if (!filepath) {
            return settings;
        }
        
        std::ifstream file(*filepath);
        if (!file.is_open()) {
            return settings;
        }
        
        std::string line;
        while (std::getline(file, line)) {
            auto [key, value] = parseLine(line);
            if (key == "gradient_info") {
                auto type = parseGradientType(value);
                if (type) {
                    settings.gradientInfo.type = *type;
                }
            } else if (key == "gradient_logo") {
                auto type = parseGradientType(value);
                if (type) {
                    settings.gradientLogo.type = *type;
                }
            }
        }
        
        return settings;
    }

private:
    static std::pair<std::string, std::string> parseLine(const std::string& line) {
        auto trimmed = trim(line);
        if (trimmed.empty() || trimmed[0] == '#') {
            return {"", ""};
        }
        
        size_t pos = trimmed.find('=');
        if (pos == std::string::npos) {
            return {"", ""};
        }
        
        return {
            trim(trimmed.substr(0, pos)),
            trim(trimmed.substr(pos + 1))
        };
    }
    
    static std::string trim(const std::string& str) {
        auto start = str.find_first_not_of(" \t\r\n");
        if (start == std::string::npos) return "";
        
        auto end = str.find_last_not_of(" \t\r\n");
        return str.substr(start, end - start + 1);
    }
    
    static std::optional<GradientType> parseGradientType(const std::string& value) {
        std::string lower = value;
        std::transform(lower.begin(), lower.end(), lower.begin(), ::tolower);
        
        if (lower == "blue") return GradientType::BLUE;
        if (lower == "red") return GradientType::RED;
        if (lower == "green") return GradientType::GREEN;
        if (lower == "purple") return GradientType::PURPLE;
        if (lower == "orange") return GradientType::ORANGE;
        if (lower == "neon") return GradientType::NEON;
        if (lower == "aqua") return GradientType::AQUA;
        if (lower == "sunset") return GradientType::SUNSET;
        if (lower == "forest") return GradientType::FOREST;
        if (lower == "mono") return GradientType::MONO;
        if (lower == "rainbow") return GradientType::RAINBOW;
        if (lower == "magenta") return GradientType::MAGENTA;
        if (lower == "gray") return GradientType::GRAY;
        
        return std::nullopt;
    }
    
    static void setBoolOption(Options& opts, const std::string& key, bool value) {
        static const std::unordered_map<std::string, bool Options::*> optionMap = {
            {"os", &Options::os}, {"kernel", &Options::kernel},
            {"uptime", &Options::uptime}, {"packages", &Options::packages},
            {"shell", &Options::shell}, {"display", &Options::display},
            {"de", &Options::de}, {"wm", &Options::wm},
            {"theme", &Options::theme}, {"icons", &Options::icons},
            {"font", &Options::font}, {"cursor", &Options::cursor},
            {"terminal", &Options::terminal}, {"term_font", &Options::term_font},
            {"cpu", &Options::cpu}, {"memory", &Options::memory},
            {"swap", &Options::swap}, {"disk", &Options::disk},
            {"gpu", &Options::gpu}, {"local_ip", &Options::local_ip},
            {"locale", &Options::locale}
        };
        
        if (auto it = optionMap.find(key); it != optionMap.end()) {
            opts.*(it->second) = value;
        }
    }
};

class LogoReader {
public:
    static std::vector<std::string> read(const std::string& filename) {
        std::vector<std::string> logo;
        
        auto filepath = XDGPaths::findFile(filename);
        if (!filepath) return logo;
        
        std::ifstream file(*filepath);
        if (!file.is_open()) return logo;
        
        std::string line;
        logo.reserve(20);
        
        while (std::getline(file, line)) {
            logo.push_back(std::move(line));
        }
        
        return logo;
    }
};

class ColorManager {
public:
    static constexpr std::string_view getCode(std::string_view theme) {
        if (theme == "cyan") return "\033[36m";
        if (theme == "magenta") return "\033[35m";
        if (theme == "green") return "\033[32m";
        if (theme == "yellow") return "\033[33m";
        if (theme == "blue") return "\033[34m";
        if (theme == "red") return "\033[31m";
        if (theme == "white") return "\033[37m";
        return "\033[36m";
    }
    
    static constexpr std::string_view reset() {
        return "\033[0m";
    }
};

class StringUtils {
public:
    static size_t visibleLength(std::string_view str) {
        size_t len = 0;
        bool inEscape = false;
        
        for (char c : str) {
            if (c == '\033') {
                inEscape = true;
            } else if (inEscape && c == 'm') {
                inEscape = false;
            } else if (!inEscape) {
                ++len;
            }
        }
        
        return len;
    }
};

class SystemInfo {
public:
    SystemInfo(const Options& opts, const GradientConfig& gradient, 
               std::string_view fallbackColor)
        : opts_(opts), gradient_(gradient), fallbackColor_(fallbackColor),
          reset_(ColorManager::reset()) {}
    
    std::vector<std::string> generate() {
        std::vector<std::string> info;
        info.reserve(21);
        
        addInfo(info, opts_.os, "OS", SystemReader::getOS());
        addInfo(info, opts_.kernel, "Kernel", SystemReader::getKernel());
        addInfo(info, opts_.uptime, "Uptime", SystemReader::getUptime());
        addInfo(info, opts_.packages, "Packages", SystemReader::getPackages());
        addInfo(info, opts_.shell, "Shell", SystemReader::getShell());
        addInfo(info, opts_.display, "Display", SystemReader::getDisplay());
        addInfo(info, opts_.de, "DE", SystemReader::getDE());
        addInfo(info, opts_.wm, "WM", SystemReader::getWM());
        addInfo(info, opts_.theme, "Theme", SystemReader::getTheme());
        addInfo(info, opts_.icons, "Icons", SystemReader::getIcons());
        addInfo(info, opts_.font, "Font", SystemReader::getFont());
        addInfo(info, opts_.cursor, "Cursor", SystemReader::getCursor());
        addInfo(info, opts_.terminal, "Terminal", SystemReader::getTerminal());
        addInfo(info, opts_.term_font, "Term Font", SystemReader::getTermFont());
        addInfo(info, opts_.cpu, "CPU", SystemReader::getCPU());
        addInfo(info, opts_.memory, "Memory", SystemReader::getMemory());
        addInfo(info, opts_.swap, "Swap", SystemReader::getSwap());
        addInfo(info, opts_.disk, "Disk", SystemReader::getDisk());
        addInfo(info, opts_.gpu, "GPU", SystemReader::getGPU());
        addInfo(info, opts_.local_ip, "Local IP", SystemReader::getLocalIP());
        addInfo(info, opts_.locale, "Locale", SystemReader::getLocale());
        
        applyGradient(info);
        return info;
    }

private:
    void addInfo(std::vector<std::string>& info, bool enabled,
                 std::string_view label, const std::string& value) {
        if (!enabled) return;
        
        std::ostringstream oss;
        oss << "{{COLOR}}" << label << reset_ << ": " << value;
        info.push_back(oss.str());
    }
    
    void applyGradient(std::vector<std::string>& info) {
        const size_t total = info.size();
        
        for (size_t i = 0; i < total; ++i) {
            std::string color;
            
            if (gradient_.enabled) {
                RGB rgb = gradient_.getColorAt(i, total);
                color = rgb.toAnsi();
            } else {
                color = std::string(fallbackColor_);
            }
            
            size_t pos = info[i].find("{{COLOR}}");
            if (pos != std::string::npos) {
                info[i].replace(pos, 9, color);
            }
        }
    }
    
    const Options& opts_;
    const GradientConfig& gradient_;
    std::string_view fallbackColor_;
    std::string_view reset_;
};

class LogoRenderer {
public:
    static std::vector<std::string> applyGradient(const std::vector<std::string>& logo, 
                                                   const GradientConfig& gradient) {
        std::vector<std::string> result;
        result.reserve(logo.size());
        
        for (size_t i = 0; i < logo.size(); ++i) {
            RGB color = gradient.getColorAt(i, logo.size());
            std::string colorCode = color.toAnsi();
            result.push_back(colorCode + logo[i] + std::string(ColorManager::reset()));
        }
        
        return result;
    }
};

class Renderer {
public:
    Renderer(std::ostream& out) : out_(out) {}
    
    void render(const std::vector<std::string>& logo,
                const std::vector<std::string>& info) {
        const size_t maxLogoWidth = calculateMaxLogoWidth(logo);
        const size_t padding = maxLogoWidth + 3;
        const size_t maxLines = std::max(logo.size(), info.size());
        
        for (size_t i = 0; i < maxLines; ++i) {
            renderLine(logo, info, i, padding);
        }
    }

private:
    size_t calculateMaxLogoWidth(const std::vector<std::string>& logo) const {
        size_t maxWidth = 0;
        for (const auto& line : logo) {
            maxWidth = std::max(maxWidth, StringUtils::visibleLength(line));
        }
        return maxWidth;
    }
    
    void renderLine(const std::vector<std::string>& logo,
                    const std::vector<std::string>& info,
                    size_t lineIdx, size_t padding) {
        if (lineIdx < logo.size()) {
            out_ << logo[lineIdx];
            const size_t visibleLen = StringUtils::visibleLength(logo[lineIdx]);
            printSpaces(padding - visibleLen);
        } else {
            printSpaces(padding);
        }
        
        if (lineIdx < info.size()) {
            out_ << info[lineIdx];
        }
        
        out_ << '\n';
    }
    
    void printSpaces(size_t count) {
        for (size_t i = 0; i < count; ++i) {
            out_ << ' ';
        }
    }
    
    std::ostream& out_;
};

int main() {
    std::ios::sync_with_stdio(false);
    std::cin.tie(nullptr);
    
    XDGPaths::initializeUserConfig();
    
    auto opts = ConfigParser::parseOptions("options.txt").value_or(Options{});
    auto settings = ConfigParser::parseSettings("settings.txt").value_or(Settings{});
    auto gradientSettings = ConfigParser::parseGradients("config.txt");
    
    auto logoRaw = LogoReader::read(settings.logoPath);
    if (logoRaw.empty()) {
        std::cerr << "Error: Unable to read logo file\n";
        return 1;
    }
    
    auto logo = LogoRenderer::applyGradient(logoRaw, gradientSettings.gradientLogo);
    
    auto fallbackColor = ColorManager::getCode(settings.colorTheme);
    SystemInfo sysInfo(opts, gradientSettings.gradientInfo, fallbackColor);
    auto info = sysInfo.generate();
    
    Renderer renderer(std::cout);
    renderer.render(logo, info);
    
    return 0;
}