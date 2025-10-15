#include <iostream>
#include <fstream>
#include <string>
#include <filesystem>

using namespace std;

#define RESET "\033[0m"
#define RED "\033[31m"
#define GREEN "\033[32m"
#define YELLOW "\033[33m"
#define BLUE "\033[34m"
#define MAGENTA "\033[35m"
#define CYAN "\033[36m"
#define WHITE "\033[37m"

void createDefaultConfig(const string& configPath) {
    filesystem::create_directories(filesystem::path(configPath).parent_path());
    
    ofstream configFile(configPath);
    if (configFile.is_open()) {
        configFile << "tux color = white" << endl;
        configFile.close();
    }
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
        if (line.find("tux color") != string::npos) {
            size_t pos = line.find('=');
            if (pos != string::npos) {
                string color = line.substr(pos + 1);
                color.erase(0, color.find_first_not_of(" \t"));
                color.erase(color.find_last_not_of(" \t") + 1);
                
                if (color == "red") return RED;
                if (color == "green") return GREEN;
                if (color == "yellow") return YELLOW;
                if (color == "blue") return BLUE;
                if (color == "magenta") return MAGENTA;
                if (color == "cyan") return CYAN;
                if (color == "white") return WHITE;
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
