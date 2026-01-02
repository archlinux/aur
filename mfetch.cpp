#include <iostream>
#include <fstream>
#include <string>
#include <sys/utsname.h>
#include <unistd.h>
#include <vector>
#include <algorithm>
#include <filesystem>
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <sys/statvfs.h>

using namespace std;

#define C_BOLD    "\033[1m"
#define C_PURPLE  "\033[1;38;5;141m"
#define C_CYAN    "\033[1;36m"
#define C_WHITE   "\033[1;37m"
#define C_GREEN   "\033[1;32m"
#define C_RED     "\033[1;31m"
#define C_BLUE    "\033[1;34m"
#define C_ORANGE  "\033[38;5;208m"
#define C_RESET   "\033[0m"

string clean(string s) {
    size_t first = s.find_first_not_of(" \t\r\n:\"[]");
    if (string::npos == first) return "";
    size_t last = s.find_last_not_of(" \t\r\n:\"[]");
    return s.substr(first, (last - first + 1));
}

string getLocation() {
    char buffer[128]; string city = "";
    FILE* pipe = popen("curl -s --connect-timeout 2 'http://ip-api.com/line/?fields=city' -4", "r");
    if (pipe) { if (fgets(buffer, 128, pipe)) city = clean(buffer); pclose(pipe); }
    return city;
}

string getWeather() {
    char buffer[128]; string res = ""; string city = getLocation();
    string query = "curl -s -4 -L --connect-timeout 3 'wttr.in/" + (city.empty() ? "" : city) + "?format=1'";
    FILE* pipe = popen(query.c_str(), "r");
    if (pipe) { if (fgets(buffer, 128, pipe)) res = clean(buffer); pclose(pipe); }
    return res.empty() ? "N/A" : res;
}

string getUptime() {
    ifstream file("/proc/uptime");
    double uptimeSeconds;
    if (file >> uptimeSeconds) {
        int h = (int)uptimeSeconds / 3600;
        int m = ((int)uptimeSeconds % 3600) / 60;
        if (h > 0) return to_string(h) + "h " + to_string(m) + "m";
        return to_string(m) + "m";
    }
    return "N/A";
}

string getPkgs() {
    int count = 0;
    if (std::filesystem::exists("/var/lib/pacman/local")) {
        for (auto const& _ : std::filesystem::directory_iterator("/var/lib/pacman/local")) count++;
        return to_string(count - 1);
    }
    return "N/A";
}

string getRAM() {
    long total = 0, free = 0, buffers = 0, cached = 0;
    ifstream file("/proc/meminfo"); string key;
    while (file >> key) {
        if (key == "MemTotal:") file >> total;
        else if (key == "MemFree:") file >> free;
        else if (key == "Buffers:") file >> buffers;
        else if (key == "Cached:") file >> cached;
        file.ignore(256, '\n');
    }
    return to_string((total - free - buffers - cached) / 1024 / 1024) + " GB / " + to_string(total / 1024 / 1024) + " GB";
}

string getDisk() {
    struct statvfs fi;
    if (statvfs("/", &fi) < 0) return "N/A";
    unsigned long used = (fi.f_blocks - fi.f_bfree) * fi.f_frsize / 1024 / 1024 / 1024;
    unsigned long total = fi.f_blocks * fi.f_frsize / 1024 / 1024 / 1024;
    return to_string(used) + " GB / " + to_string(total) + " GB";
}

string getTemp(string type) {
    try {
        for (const auto& entry : std::filesystem::directory_iterator("/sys/class/hwmon")) {
            ifstream f(entry.path().string() + "/name"); string n; f >> n;
            if ((type == "cpu" && (n=="coretemp"||n=="k10temp"||n=="it8728")) || 
                (type == "gpu" && (n=="amdgpu"||n=="radeon"))) {
                ifstream tf(entry.path().string() + "/temp1_input");
                if (!tf.is_open()) tf.open(entry.path().string() + "/temp2_input");
                int t; if (tf >> t) return to_string(t / 1000) + "°C";
            }
        }
    } catch (...) {} return "N/A";
}

string getGpuModel() {
    char b[128]; string r = "";
    FILE* p = popen("lspci | grep -E 'VGA|3D' | sed -E 's/.*: //; s/Advanced Micro Devices, Inc. //; s/\\[AMD\\/ATI\\] //; s/\\(rev.*\\)//'", "r");
    if (p) { if (fgets(b, 128, p)) r = clean(b); pclose(p); }
    return r.empty() ? "AMD GPU" : r;
}

void printFetch(string id, string user, string host) {
    struct utsname os; uname(&os);
    string cpu = "Unknown";
    ifstream f("/proc/cpuinfo"); string l;
    while(getline(f, l)) if(l.find("model name")!=string::npos) { cpu = clean(l.substr(l.find(":")+1)); break; }
    
    string c1 = C_PURPLE;
    vector<string> logo;

    if (id == "arch") {
        c1 = C_CYAN; logo = {"      /\\      ", "     /  \\     ", "    /    \\    ", "   /      \\   ", "  /   __   \\  ", " /___/  \\___\\ "};
    } else if (id == "debian") {
        c1 = C_RED; logo = {"  _____  ", " /  __ \\ ", "|  /    |", "|  \\___- ", " \\_____  ", "         "};
    } else if (id == "ubuntu") {
        c1 = C_ORANGE; logo = {"  _____  ", " /  __ \\ ", "|  /    |", "|  \\___- ", " \\_____  ", "         "};
    } else if (id == "fedora") {
        c1 = C_BLUE; 
        logo = {"    ______    ", "   / ____ \\   ", "  / /  __\\ \\  ", "  | | |__  |  ", "  \\ \\____/ /  ", "   \\______/   "};
    } else if (id == "mint") {
        c1 = C_GREEN; logo = {"  _________  ", " |  _____  | ", " | | ___ | | ", " | | | | | | ", " | |_____| | ", " |_________| "};
    } else if (id == "void") {
        c1 = C_GREEN; logo = {"    ______    ", "   / ___  \\   ", "  / /   \\  \\  ", "  \\ \\___/  /  ", "   \\______/   ", "              "};
    } else if (id == "gentoo") {
        c1 = C_PURPLE; logo = {"  _-----_  ", " (       \\ ", "  \\    __  ", "   \\  /  \\ ", "    --____/ ", "           "};
    } else if (id == "opensuse" || id == "suse") {
        c1 = C_GREEN; logo = {"   _______   ", "  / ____  \\  ", " | |    | |  ", " | |____| |  ", "  \\_______/  ", "   -------   "};
    } else { 
        c1 = C_PURPLE; // EndeavourOS / Default
        logo = {"      /\\      ", "     /  \\     ", "    /    \\    ", "   /      \\   ", "  /   __   \\  ", " /___/  \\___\\ "}; 
    }

    vector<string> info;
    info.push_back(string(C_BOLD) + c1 + user + C_WHITE + "@" + c1 + host + C_RESET);
    info.push_back(string(C_WHITE) + "------------------------" + C_RESET);
    info.push_back(string(C_WHITE) + "OS:     " + C_RESET + id);
    info.push_back(string(C_WHITE) + "Uptime: " + C_RESET + getUptime());
    info.push_back(string(C_WHITE) + "Pkgs:   " + C_RESET + getPkgs() + " (pacman)");
    info.push_back(string(C_WHITE) + "CPU:    " + C_RESET + cpu + " [" + C_CYAN + getTemp("cpu") + C_RESET + "]");
    info.push_back(string(C_WHITE) + "GPU:    " + C_RESET + getGpuModel() + " [" + C_GREEN + getTemp("gpu") + C_RESET + "]");
    info.push_back(string(C_WHITE) + "RAM:    " + C_RESET + getRAM());
    info.push_back(string(C_WHITE) + "Disk:   " + C_RESET + getDisk());
    info.push_back(string(C_WHITE) + "Weather:" + C_RESET + getWeather());

    cout << endl;
    int mL = max((int)logo.size(), (int)info.size());
    for (int i = 0; i < mL; i++) {
        if (i < (int)logo.size()) cout << c1 << logo[i] << "  ";
        else cout << string(logo[0].size() + 2, ' ');
        if (i < (int)info.size()) cout << info[i];
        cout << endl;
    }
    cout << string(logo[0].size() + 2, ' ');
    for (int j = 1; j <= 8; j++) cout << "\033[48;5;" << j << "m  ";
    cout << C_RESET << endl << endl;
}

int main(int argc, char* argv[]) {
    char h[64]; gethostname(h, sizeof(h));
    const char* up = getlogin(); string u = up ? up : "user";
    string d = "";
    if (argc > 1) d = argv[1];
    else {
        ifstream f("/etc/os-release"); string l;
        while (getline(f, l)) if (l.find("ID=")==0 && l.find("VARIANT")==string::npos) { d = clean(l.substr(3)); break; }
    }
    printFetch(d.empty()?"linux":d, u, h);
    return 0;
}