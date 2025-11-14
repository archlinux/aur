#include <iostream>
#include <fstream>
#include <string>
#include <map>
#include <filesystem>
#include <cstdlib>
#include <unistd.h>
#include <pwd.h>

namespace fs = std::filesystem;

class RASCIIConfig {
private:
    std::string config_dir;
    std::string config_file;
    std::map<std::string, std::string> ascii_arts;
    
public:
    RASCIIConfig() {
        const char* home_dir = getenv("HOME");
        if (!home_dir) {
            struct passwd* pw = getpwuid(getuid());
            home_dir = pw->pw_dir;
        }
        
        config_dir = std::string(home_dir) + "/.config/atyper";
        config_file = config_dir + "/atyper.conf";
        
        load_config();
    }
    
    void load_config() {
        fs::create_directories(config_dir);
        
        if (!fs::exists(config_file)) {
            create_default_config();
            return;
        }
        
        std::ifstream file(config_file);
        std::string line;
        std::string current_art;
        std::string current_name;
        bool in_art = false;
        
        while (std::getline(file, line)) {
            if (line.find("###ART_START:") == 0) {
                in_art = true;
                current_art.clear();
                size_t start_pos = 13;
                size_t end_pos = line.find("###", start_pos);
                if (end_pos != std::string::npos) {
                    current_name = line.substr(start_pos, end_pos - start_pos);
                } else {
                    current_name = "unnamed_" + std::to_string(ascii_arts.size() + 1);
                }
            } else if (line == "###ART_END###") {
                in_art = false;
                if (!current_art.empty() && !current_name.empty()) {
                    ascii_arts[current_name] = current_art;
                }
            } else if (in_art) {
                current_art += line + "\n";
            }
        }
        
        file.close();
    }
    
    void create_default_config() {
        std::ofstream file(config_file);
        file << "###ART_START:tux###\n";
        file << "    .--.\n";
        file << "   |o_o |\n";
        file << "   |:_/ |\n";
        file << "  //   \\ \\\n";
        file << " (|     | )\n";
        file << "/'\\_   _/`\\\n";
        file << "\\___)=(___/\n";
        file << "###ART_END###\n";
        file.close();
        
        load_config();
    }
    
    void show_art_by_name(const std::string& name) {
        auto it = ascii_arts.find(name);
        if (it != ascii_arts.end()) {
            std::cout << it->second << std::endl;
        } else {
            std::cout << "ASCII art '" << name << "' not found!\n";
            std::cout << "Available arts: ";
            bool first = true;
            for (const auto& art : ascii_arts) {
                if (!first) std::cout << ", ";
                std::cout << art.first;
                first = false;
            }
            std::cout << "\n";
        }
    }
    
    void list_arts() {
        if (ascii_arts.empty()) {
            std::cout << "No ASCII arts found.\n";
            std::cout << "Add your arts to: " << config_file << "\n";
            return;
        }
        
        std::cout << "Total ASCII arts: " << ascii_arts.size() << "\n\n";
        for (const auto& art : ascii_arts) {
            std::cout << "Art: " << art.first << "\n";
            std::cout << art.second << "\n";
        }
    }
    
    std::string get_config_path() const {
        return config_file;
    }
    
    size_t get_art_count() const {
        return ascii_arts.size();
    }
};

void print_help() {
    std::cout << "ATYPER - Named ASCII Art Display\n\n";
    std::cout << "Usage:\n";
    std::cout << "  atyper <art_name>    - Show specific ASCII art by name\n";
    std::cout << "  atyper --list        - List all ASCII arts with names\n";
    std::cout << "  atyper --help        - Show this help message\n";
    std::cout << "  atyper --config      - Show config file path\n";
    std::cout << "\nConfiguration file: ~/.config/atyper/atyper.conf\n";
    std::cout << "Add your ASCII arts with format:\n";
    std::cout << "###ART_START:ART_NAME###\n";
    std::cout << "Your ASCII art here\n";
    std::cout << "###ART_END###\n";
}

int main(int argc, char* argv[]) {
    RASCIIConfig config;
    
    if (argc > 1) {
        std::string arg = argv[1];
        if (arg == "--help" || arg == "-h") {
            print_help();
        } else if (arg == "--list" || arg == "-l") {
            config.list_arts();
        } else if (arg == "--config" || arg == "-c") {
            std::cout << "Config file: " << config.get_config_path() << "\n";
            std::cout << "Total arts: " << config.get_art_count() << "\n";
        } else {
            config.show_art_by_name(arg);
        }
    } else {
        print_help();
        std::cout << "\nUse 'atyper --list' to see available arts.\n";
    }
    
    return 0;
}
