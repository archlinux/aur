#include <iostream>
#include <fstream>
#include <string>
#include <filesystem>
#include <map>

using namespace std;

#define RESET "\033[0m"
#define RED "\033[31m"
#define GREEN "\033[32m"
#define YELLOW "\033[33m"
#define BLUE "\033[34m"
#define MAGENTA "\033[35m"
#define CYAN "\033[36m"
#define WHITE "\033[37m"
#define ORANGE "\033[38;5;214m"
#define PINK "\033[38;5;205m"
#define PURPLE "\033[38;5;93m"
#define BROWN "\033[38;5;130m"
#define GRAY "\033[38;5;245m"
#define LIGHT_BLUE "\033[38;5;117m"
#define LIGHT_GREEN "\033[38;5;120m"

// RGB color function
string rgb_color(int r, int g, int b) {
    return "\033[38;2;" + to_string(r) + ";" + to_string(g) + ";" + to_string(b) + "m";
}

void createDefaultConfig(const string& configPath) {
    filesystem::create_directories(filesystem::path(configPath).parent_path());
    
    ofstream configFile(configPath);
    if (configFile.is_open()) {
        configFile << "tux color = white" << endl;
        configFile << "# Available colors: red, green, yellow, blue, magenta, cyan, white" << endl;
        configFile << "# Additional colors: orange, pink, purple, brown, gray, light_blue, light_green" << endl;
        configFile << "# RGB format: rgb(255,100,50)" << endl;
        configFile.close();
    }
}

string parseColor(const string& color) {
    map<string, string> colorMap = {
        {"red", RED},
        {"green", GREEN},
        {"yellow", YELLOW},
        {"blue", BLUE},
        {"magenta", MAGENTA},
        {"cyan", CYAN},
        {"white", WHITE},
        {"orange", ORANGE},
        {"pink", PINK},
        {"purple", PURPLE},
        {"brown", BROWN},
        {"gray", GRAY},
        {"light_blue", LIGHT_BLUE},
        {"light_green", LIGHT_GREEN}
    };
    
    // Check named colors
    if (colorMap.find(color) != colorMap.end()) {
        return colorMap[color];
    }
    
    // Check RGB format: rgb(255,100,50)
    if (color.find("rgb(") == 0 && color.back() == ')') {
        string rgb_values = color.substr(4, color.length() - 5);
        size_t comma1 = rgb_values.find(',');
        size_t comma2 = rgb_values.find(',', comma1 + 1);
        
        if (comma1 != string::npos && comma2 != string::npos) {
            try {
                int r = stoi(rgb_values.substr(0, comma1));
                int g = stoi(rgb_values.substr(comma1 + 1, comma2 - comma1 - 1));
                int b = stoi(rgb_values.substr(comma2 + 1));
                
                if (r >= 0 && r <= 255 && g >= 0 && g <= 255 && b >= 0 && b <= 255) {
                    return rgb_color(r, g, b);
                }
            } catch (...) {
                // If conversion fails, fall back to white
            }
        }
    }
    
    return WHITE;
}

string getTuxColor() {
    string home = getenv("HOME");
    string configPath = home + "/.config/tux/tux.conf";
    
    if (!filesystem::exists(configPath)) {
        createDefaultConfig(configPath);
    }
    
    ifstream configFile(configPath);
    if (!configFile.is_open()) {
        return WHITE;
    }
    
    string line;
    while (getline(configFile, line)) {
        // Skip comments
        if (line.empty() || line[0] == '#') continue;
        
        if (line.find("tux color") != string::npos) {
            size_t pos = line.find('=');
            if (pos != string::npos) {
                string color = line.substr(pos + 1);
                color.erase(0, color.find_first_not_of(" \t"));
                color.erase(color.find_last_not_of(" \t") + 1);
                
                return parseColor(color);
            }
        }
    }
    
    return WHITE;
}

int main() {
    string tuxColor = getTuxColor();
    
    cout << tuxColor;
    cout << "              .88888888:." << endl;
    cout << "             88888888.88888." << endl;
    cout << "           .8888888888888888." << endl;
    cout << "           888888888888888888" << endl;
    cout << "           88' _`88'_  `88888" << endl;
    cout << "           88 88 88 88  88888" << endl;
    cout << "           88_88_::_88_:88888" << endl;
    cout << "           88:::,::,:::::8888" << endl;
    cout << "           88`:::::::::'`8888" << endl;
    cout << "          .88  `::::'    8:88." << endl;
    cout << "         8888            `8:888." << endl;
    cout << "       .8888'             `888888." << endl;
    cout << "      .8888:..  .::.  ...:'8888888:." << endl;
    cout << "     .8888.'     :'     `'::`88:88888" << endl;
    cout << "    .8888        '         `.888:8888." << endl;
    cout << "   888:8         .           888:88888" << endl;
    cout << "  .888:88        .:           888:88888:" << endl;
    cout << "  8888888.       ::           88:888888" << endl;
    cout << "  `.::.888.      ::          .88888888" << endl;
    cout << " .::::::.888.    ::         :::`8888'.:." << endl;
    cout << ":::::::::.888   '         .::::::::::::" << endl;
    cout << ":::::::::::.8    '      .:8::::::::::::." << endl;
    cout << ".::::::::::::::.        .:888:::::::::::::" << endl;
    cout << "::::::::::::::88:.__..:88888:::::::::::'" << endl;
    cout << " `'.:::::::::::88888888888.88:::::::::'" << endl;
    cout << "       `':::_:' -- '' -'-' `':_::::'`" << RESET << endl;
    
    return 0;
}
