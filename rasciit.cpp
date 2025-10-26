#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <random>
#include <filesystem>
#include <cstdlib>
#include <unistd.h>
#include <pwd.h>

namespace fs = std::filesystem;

class RASCIIConfig {
private:
    std::string config_dir;
    std::string config_file;
    std::vector<std::string> ascii_arts;
    
public:
    RASCIIConfig() {
        const char* home_dir = getenv("HOME");
        if (!home_dir) {
            struct passwd* pw = getpwuid(getuid());
            home_dir = pw->pw_dir;
        }
        
        config_dir = std::string(home_dir) + "/.config/rasciit";
        config_file = config_dir + "/rasciit.conf";
        
        load_config();
    }
    
    void load_config() {
        fs::create_directories(config_dir);
        
        if (!fs::exists(config_file)) {
            create_default_config();
        }
        
        std::ifstream file(config_file);
        std::string line;
        std::string current_art;
        bool in_art = false;
        
        while (std::getline(file, line)) {
            if (line == "###ART_START###") {
                in_art = true;
                current_art.clear();
            } else if (line == "###ART_END###") {
                in_art = false;
                if (!current_art.empty()) {
                    ascii_arts.push_back(current_art);
                }
            } else if (in_art) {
                current_art += line + "\n";
            }
        }
        
        file.close();
    }
    
    void create_default_config() {
        std::ofstream file(config_file);
        file << "# RASCII Configuration File\n";
        file << "# Add your ASCII arts between ###ART_START### and ###ART_END### markers\n";
        file << "# Each art should be separated by these markers\n\n";
        file << "# Example:\n";
        file << "###ART_START###\n";
        file << "    _____\n";
        file << "   /     \\\n";
        file << "  | () () |\n";
        file << "   \\  ^  /\n";
        file << "    |||||\n";
        file << "    |||||\n";
        file << "###ART_END###\n\n";
        file << "###ART_START###\n";
        file << "   .--.\n";
        file << "  |o_o |\n";
        file << "  |:_/ |\n";
        file << " //   \\ \\\n";
        file << "(|     | )\n";
        file << "'\\_   _/`\n";
        file << "  \\___/\n";
        file << "###ART_END###\n";
        
        file.close();
        
        // Перезагружаем конфиг, чтобы загрузить примеры
        load_config();
    }
    
    void save_config() {
        std::ofstream file(config_file);
        file << "# RASCII Configuration File\n";
        file << "# Add your ASCII arts between ###ART_START### and ###ART_END### markers\n";
        file << "# Each art should be separated by these markers\n\n";
        
        for (const auto& art : ascii_arts) {
            file << "###ART_START###\n";
            file << art;
            if (!art.empty() && art.back() != '\n') {
                file << "\n";
            }
            file << "###ART_END###\n\n";
        }
        
        file.close();
    }
    
    void add_art(const std::string& art) {
        ascii_arts.push_back(art);
        save_config();
    }
    
    void show_random_art() {
        if (ascii_arts.empty()) {
            std::cout << "No ASCII arts found in configuration!\n";
            std::cout << "Add your arts to: " << config_file << "\n";
            return;
        }
        
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<> dis(0, ascii_arts.size() - 1);
        
        int random_index = dis(gen);
        std::cout << ascii_arts[random_index] << std::endl;
    }
    
    void list_arts() {
        if (ascii_arts.empty()) {
            std::cout << "No ASCII arts found.\n";
            std::cout << "Add your arts to: " << config_file << "\n";
            return;
        }
        
        std::cout << "Total ASCII arts: " << ascii_arts.size() << "\n\n";
        for (size_t i = 0; i < ascii_arts.size(); ++i) {
            std::cout << "Art #" << i + 1 << ":\n";
            std::cout << ascii_arts[i] << "\n";
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
    std::cout << "RASCII - Random ASCII Art Display\n\n";
    std::cout << "Usage:\n";
    std::cout << "  rascii          - Show random ASCII art\n";
    std::cout << "  rascii --list   - List all ASCII arts\n";
    std::cout << "  rascii --help   - Show this help message\n";
    std::cout << "  rascii --config - Show config file path\n";
    std::cout << "\nConfiguration file: ~/.config/rasciit/rasciit.conf\n";
    std::cout << "Add your own ASCII arts between ###ART_START### and ###ART_END### markers\n";
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
            std::cout << "Unknown option: " << arg << "\n";
            print_help();
            return 1;
        }
    } else {
        config.show_random_art();
    }
    
    return 0;
}
