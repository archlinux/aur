#include <iostream>
#include <string>
#include <sstream>
#include <vector>
#include <algorithm>

class TuxSay {
private:
    std::string message;
    int maxLineLength;

    std::vector<std::string> wrapText(const std::string& text, int width) {
        std::vector<std::string> lines;
        std::istringstream words(text);
        std::string word;
        std::string currentLine;
        
        while (words >> word) {
            if (currentLine.length() + word.length() + 1 > width) {
                if (!currentLine.empty()) {
                    lines.push_back(currentLine);
                    currentLine.clear();
                }
            }
            if (!currentLine.empty()) {
                currentLine += " ";
            }
            currentLine += word;
        }
        
        if (!currentLine.empty()) {
            lines.push_back(currentLine);
        }
        
        return lines;
    }

public:
    TuxSay(const std::string& msg, int maxLen = 40) : message(msg), maxLineLength(maxLen) {}
    
    void say() {
        if (message.empty()) {
            std::cout << "Usage: tuxsay \"your message here\"" << std::endl;
            return;
        }
        
        auto lines = wrapText(message, maxLineLength);
        
        // Find the longest line for bubble width
        int bubbleWidth = 0;
        for (const auto& line : lines) {
            if (line.length() > bubbleWidth) {
                bubbleWidth = line.length();
            }
        }
        
        // Print speech bubble top
        std::cout << " ";
        for (int i = 0; i < bubbleWidth + 2; i++) {
            std::cout << "_";
        }
        std::cout << std::endl;
        
        // Print text with proper padding
        if (lines.size() == 1) {
            std::cout << "< " << lines[0];
            for (int i = lines[0].length(); i < bubbleWidth; i++) {
                std::cout << " ";
            }
            std::cout << " >" << std::endl;
        } else {
            // First line
            std::cout << "/ " << lines[0];
            for (int i = lines[0].length(); i < bubbleWidth; i++) {
                std::cout << " ";
            }
            std::cout << " \\" << std::endl;
            
            // Middle lines
            for (size_t i = 1; i < lines.size() - 1; i++) {
                std::cout << "| " << lines[i];
                for (int j = lines[i].length(); j < bubbleWidth; j++) {
                    std::cout << " ";
                }
                std::cout << " |" << std::endl;
            }
            
            // Last line
            std::cout << "\\ " << lines.back();
            for (int i = lines.back().length(); i < bubbleWidth; i++) {
                std::cout << " ";
            }
            std::cout << " /" << std::endl;
        }
        
        // Print speech bubble bottom
        std::cout << " ";
        for (int i = 0; i < bubbleWidth + 2; i++) {
            std::cout << "-";
        }
        std::cout << std::endl;
        
        // Print the "tail" connecting Tux to the bubble
        std::cout << "    \\" << std::endl;
        std::cout << "     \\" << std::endl;
        
        // Print Tux
        std::cout << "    .--." << std::endl;
        std::cout << "   |o_o |" << std::endl;
        std::cout << "   |:_/ |" << std::endl;
        std::cout << "  //   \\ \\" << std::endl;
        std::cout << " (|     | )" << std::endl;
        std::cout << "/'\\_   _/`\\" << std::endl;
        std::cout << "\\___)=(___/" << std::endl;
    }
};

int main(int argc, char* argv[]) {
    std::string message;
    
    if (argc > 1) {
        // Combine all arguments into one message
        for (int i = 1; i < argc; i++) {
            if (i > 1) message += " ";
            message += argv[i];
        }
    }
    
    TuxSay tux(message);
    tux.say();
    
    return 0;
}
