#include <iostream>
#include <string>
#include <vector>
#include <filesystem>
#include <fstream>
#include <chrono>
#include <sstream>
#include <iomanip>
#include <numeric>
#include <cstdlib>
#include <poll.h>
#include <unistd.h>

namespace fs = std::filesystem;

// HOLY ANSI ESCAPE CODES
const std::string RESET = "\x1b[0m";
const std::string RED = "\x1b[0;31m";
const std::string GOLD = "\x1b[0;33m";
const std::string GREEN = "\x1b[0;32m";
const std::string CYAN = "\x1b[0;36m";
const std::string CLEAR = "\x1b[2J\x1b[H";

std::string get_timestamp() {
    auto now = std::chrono::system_clock::now();
    std::time_t now_time = std::chrono::system_clock::to_time_t(now);
    std::tm tm_struct = *std::localtime(&now_time);
    
    std::ostringstream oss;
    oss << std::put_time(&tm_struct, "%y%m%d_%H%M%S");
    return oss.str();
}

void ensure_dir() {
    const char* home = std::getenv("HOME");
    std::string home_str = home ? home : "";
    if (!home_str.empty()) {
        fs::create_directories(fs::path(home_str) / "smosummarysave");
    }
}

double timetoseconds(const std::string& s) {
    if (s == "b" || s == "undo") {
        return -2.0;
    }
    
    std::vector<double> vals;
    std::stringstream ss(s);
    std::string item;
    
    while (std::getline(ss, item, ':')) {
        try {
            vals.push_back(std::stod(item));
        } catch (...) {
            return -1.0;
        }
    }
    
    switch (vals.size()) {
        case 3: return (vals[0] * 3600.0) + (vals[1] * 60.0) + vals[2];
        case 2: return (vals[0] * 60.0) + vals[1];
        case 1: return vals[0];
        default: return -1.0;
    }
}

void print_tui(const std::vector<std::string>& kingdoms, const std::vector<double>& times, const std::string& current_k, double current_run_time) {
    std::cout << CLEAR << GOLD << "=== smosummary ===" << RESET << "\n\n";
    for (size_t i = 0; i < times.size(); ++i) {
        std::cout << "  " << std::left << std::setw(12) << kingdoms[i] << ": " << CYAN << std::fixed << std::setprecision(2) << times[i] << "s" << RESET << "\n";
    }
    if (!current_k.empty()) {
        std::cout << GREEN << "> " << std::left << std::setw(12) << current_k << ": " << RESET 
                  << std::fixed << std::setprecision(2) << current_run_time << "s\n\n[enter] split | [ctrl+c] quit" << std::flush;
    } else {
        std::cout << "\n" << GOLD << "run finished" << RESET << "\n";
    }
}

int main(int argc, char* argv[]) {
    bool stopwatch = false;
    ensure_dir();

    for (int i = 1; i < argc; ++i) {
        std::string flag = argv[i];
        if (flag == "-v" || flag == "--version") {
            std::cout << "smosummary v4.0.1-1 | owner: aray4iv3\n";
            return 0;
        } else if (flag == "-h" || flag == "--help") {
            std::cout << GOLD << "smosummary tui" << RESET << "\nusage:\n"
                      << "  ./smosummary      - manual calculator mode\n"
                      << "  ./smosummary -s   - stopwatch tui\n"
                      << "  -v, --version     - owner info\n";
            return 0;
        } else if (flag == "-s" || flag == "--stopwatch") {
            stopwatch = true;
        } else {
            std::cerr << RED << "err: unknown flag " << flag << RESET << "\n";
            return 1;
        }
    }

    std::cout << GOLD << ".. smosummary .." << RESET << "\n1) any%\n2) 100%\n3) custom\n> " << std::flush;
    
    std::string choice_str;
    std::getline(std::cin, choice_str);
    int choice = 0;
    try { choice = std::stoi(choice_str); } catch (...) {}

    std::vector<std::string> active;
    if (choice == 1) {
        active = {"cap", "cascade", "sand", "lake", "wooded", "cloud", "lost", "metro", "snow", "seaside", "luncheon", "ruined", "bowser", "moon"};
    } else if (choice == 2) {
        active = {"mushroom", "cap", "cascade", "sand", "lake", "wooded", "cloud", "lost", "metro", "snow", "seaside", "luncheon", "ruined", "bowser", "moon", "dark", "darker"};
    } else if (choice == 3) {
        std::cout << "enter kingdom names (type 'done' to finish):\n";
        while (true) {
            std::string k_name;
            std::getline(std::cin, k_name);
            if (k_name == "done" || k_name.empty()) break;
            active.push_back(k_name);
        }
    }

    if (active.empty()) return 0;

    const char* home = std::getenv("HOME");
    fs::path save_path = fs::path(home ? home : "") / "smosummarysave" / ("run_" + get_timestamp() + ".txt");
    std::vector<double> times;

    if (stopwatch) {
        std::cout << "hit enter to start..." << std::flush;
        std::cin.get();

        auto last = std::chrono::steady_clock::now();
        pollfd poll_fds[1];
        poll_fds[0].fd = STDIN_FILENO;
        poll_fds[0].events = POLLIN;

        for (const auto& k : active) {
            while (true) {
                int ret = poll(poll_fds, 1, 50);
                if (ret > 0) break;

                auto now = std::chrono::steady_clock::now();
                std::chrono::duration<double> duration = now - last;
                print_tui(active, times, k, duration.count());
            }

            std::string dummy_buf;
            std::getline(std::cin, dummy_buf);

            auto now = std::chrono::steady_clock::now();
            std::chrono::duration<double> split = now - last;
            times.push_back(split.count());

            std::ofstream f(save_path, std::ios::app);
            f << k << ": " << std::fixed << std::setprecision(2) << split.count() << "s\n";
            last = now;
        }
        print_tui(active, times, "", 0.0);
    } else {
        size_t i = 0;
        while (i < active.size()) {
            std::cout << active[i] << " (or 'b' to undo) > " << std::flush;
            std::string input;
            std::getline(std::cin, input);
            double t = timetoseconds(input);

            if (t == -2.0) {
                if (i > 0) {
                    i--;
                    times.pop_back();
                    std::cout << RED << "undone last segment." << RESET << "\n";
                    continue;
                } else {
                    std::cout << RED << "nothing to undo." << RESET << "\n";
                    continue;
                }
            }
            if (t < 0.0) {
                std::cout << RED << "invalid format." << RESET << "\n";
                continue;
            }
            times.push_back(t);
            i++;
        }

        std::ofstream f(save_path);
        for (size_t j = 0; j < active.size(); ++j) {
            f << active[j] << ": " << std::fixed << std::setprecision(2) << times[j] << "s\n";
        }
    }

    double total = std::accumulate(times.begin(), times.end(), 0.0);
    std::ofstream f(save_path, std::ios::app);
    f << "-------------------\ntotal: " << std::fixed << std::setprecision(2) << total << "s\n";

    std::cout << "\n" << GOLD << "final total: " << total << "s" << RESET << "\n";
    std::cout << "saved: " << save_path.string() << "\n";

    return 0;
}
