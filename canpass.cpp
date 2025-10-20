#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <filesystem>
#include <algorithm>
#include <iomanip>
#include <termios.h>
#include <unistd.h>
#include <map>
#include <random>
#include <regex>

namespace fs = std::filesystem;

// Terminal color codes
class Colors {
public:
    static const std::string RESET;
    static const std::string BLACK;
    static const std::string RED;
    static const std::string GREEN;
    static const std::string YELLOW;
    static const std::string BLUE;
    static const std::string MAGENTA;
    static const std::string CYAN;
    static const std::string WHITE;
    static const std::string BRIGHT_BLACK;
    static const std::string BRIGHT_RED;
    static const std::string BRIGHT_GREEN;
    static const std::string BRIGHT_YELLOW;
    static const std::string BRIGHT_BLUE;
    static const std::string BRIGHT_MAGENTA;
    static const std::string BRIGHT_CYAN;
    static const std::string BRIGHT_WHITE;
    
    static std::string colorize(const std::string& text, const std::string& color) {
        return color + text + RESET;
    }
};

const std::string Colors::RESET = "\033[0m";
const std::string Colors::BLACK = "\033[30m";
const std::string Colors::RED = "\033[31m";
const std::string Colors::GREEN = "\033[32m";
const std::string Colors::YELLOW = "\033[33m";
const std::string Colors::BLUE = "\033[34m";
const std::string Colors::MAGENTA = "\033[35m";
const std::string Colors::CYAN = "\033[36m";
const std::string Colors::WHITE = "\033[37m";
const std::string Colors::BRIGHT_BLACK = "\033[90m";
const std::string Colors::BRIGHT_RED = "\033[91m";
const std::string Colors::BRIGHT_GREEN = "\033[92m";
const std::string Colors::BRIGHT_YELLOW = "\033[93m";
const std::string Colors::BRIGHT_BLUE = "\033[94m";
const std::string Colors::BRIGHT_MAGENTA = "\033[95m";
const std::string Colors::BRIGHT_CYAN = "\033[96m";
const std::string Colors::BRIGHT_WHITE = "\033[97m";

class PasswordManager {
private:
    std::string baseDir;
    std::string masterPasswordHash;
    
    struct PasswordEntry {
        std::string service;
        std::string username;
        std::string password;
    };
    
    std::string getPasswordDir() {
        std::string homeDir = getenv("HOME");
        return homeDir + "/canpass";
    }
    
    std::string getMasterPasswordFile() {
        return getPasswordDir() + "/master.pwd";
    }
    
    bool createPasswordDir() {
        std::string dir = getPasswordDir();
        if (!fs::exists(dir)) {
            return fs::create_directories(dir);
        }
        return true;
    }
    
    std::string getServiceDir(const std::string& service) {
        std::string serviceClean = service;
        serviceClean.erase(std::remove(serviceClean.begin(), serviceClean.end(), ' '), serviceClean.end());
        return getPasswordDir() + "/" + serviceClean;
    }
    
    std::string getAccountFile(const std::string& service, const std::string& username) {
        std::string serviceClean = service;
        serviceClean.erase(std::remove(serviceClean.begin(), serviceClean.end(), ' '), serviceClean.end());
        
        std::string usernameClean = username;
        usernameClean.erase(std::remove(usernameClean.begin(), usernameClean.end(), ' '), usernameClean.end());
        
        return getServiceDir(service) + "/" + usernameClean + ".pwd";
    }
    
    // Simple hash function for demonstration
    std::string simpleHash(const std::string& input) {
        unsigned long hash = 5381;
        for (char c : input) {
            hash = ((hash << 5) + hash) + c;
        }
        return std::to_string(hash);
    }
    
    std::string encryptDecrypt(const std::string& input, const std::string& key) {
        std::string result = input;
        for (size_t i = 0; i < input.length(); ++i) {
            result[i] = input[i] ^ key[i % key.length()];
        }
        return result;
    }
    
    std::string readPassword(const std::string& prompt = "Enter password: ") {
        std::string password;
        termios oldt, newt;
        
        std::cout << Colors::BRIGHT_BLUE << prompt << Colors::RESET;
        
        tcgetattr(STDIN_FILENO, &oldt);
        newt = oldt;
        newt.c_lflag &= ~ECHO;
        tcsetattr(STDIN_FILENO, TCSANOW, &newt);
        
        std::getline(std::cin, password);
        
        tcsetattr(STDIN_FILENO, TCSANOW, &oldt);
        
        std::cout << std::endl;
        return password;
    }
    
    bool masterPasswordExists() {
        return fs::exists(getMasterPasswordFile());
    }
    
    void createMasterPassword() {
        std::cout << Colors::BRIGHT_CYAN << "=== Create Master Password ===" << Colors::RESET << std::endl;
        std::string password1, password2;
        
        while (true) {
            password1 = readPassword("Create master password: ");
            password2 = readPassword("Repeat master password: ");
            
            if (password1 == password2) {
                if (password1.length() >= 6) {
                    masterPasswordHash = simpleHash(password1);
                    std::ofstream file(getMasterPasswordFile());
                    if (file.is_open()) {
                        file << masterPasswordHash;
                        std::cout << Colors::BRIGHT_GREEN << "✓ Master password created successfully!" << Colors::RESET << std::endl;
                    }
                    break;
                } else {
                    std::cout << Colors::BRIGHT_RED << "✗ Password must be at least 6 characters!" << Colors::RESET << std::endl;
                }
            } else {
                std::cout << Colors::BRIGHT_RED << "✗ Passwords don't match! Try again." << Colors::RESET << std::endl;
            }
        }
    }
    
    bool verifyMasterPassword() {
        std::string password = readPassword("Enter master password: ");
        return simpleHash(password) == masterPasswordHash;
    }
    
    void loadMasterPassword() {
        std::ifstream file(getMasterPasswordFile());
        if (file.is_open()) {
            std::getline(file, masterPasswordHash);
        }
    }
    
    // Password generator
    std::string generatePassword(int length = 16, bool useUpper = true, bool useLower = true, 
                                bool useNumbers = true, bool useSymbols = true) {
        std::string characters;
        
        if (useLower) characters += "abcdefghijklmnopqrstuvwxyz";
        if (useUpper) characters += "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        if (useNumbers) characters += "0123456789";
        if (useSymbols) characters += "!@#$%^&*()_+-=[]{}|;:,.<>?";
        
        if (characters.empty()) {
            return "password123"; // fallback
        }
        
        std::random_device rd;
        std::mt19937 generator(rd());
        std::uniform_int_distribution<int> distribution(0, characters.length() - 1);
        
        std::string password;
        for (int i = 0; i < length; ++i) {
            password += characters[distribution(generator)];
        }
        
        return password;
    }
    
    // Search passwords
    std::vector<PasswordEntry> searchPasswords(const std::string& query) {
        std::vector<PasswordEntry> results;
        std::string dir = getPasswordDir();
        
        if (!fs::exists(dir)) {
            return results;
        }
        
        std::regex pattern(".*" + query + ".*", std::regex_constants::icase);
        
        for (const auto& serviceEntry : fs::directory_iterator(dir)) {
            if (serviceEntry.is_directory() && serviceEntry.path().filename() != "." && serviceEntry.path().filename() != "..") {
                std::string service = serviceEntry.path().filename().string();
                
                // Search by service name
                if (std::regex_search(service, pattern)) {
                    // Add all accounts from this service
                    for (const auto& accountEntry : fs::directory_iterator(serviceEntry.path())) {
                        if (accountEntry.path().extension() == ".pwd") {
                            std::string username = accountEntry.path().stem().string();
                            std::string filePath = accountEntry.path().string();
                            
                            std::ifstream file(filePath);
                            if (file.is_open()) {
                                std::string encryptedPassword;
                                std::getline(file, encryptedPassword);
                                std::string password = encryptDecrypt(encryptedPassword, masterPasswordHash);
                                
                                results.push_back({service, username, password});
                            }
                        }
                    }
                } else {
                    // Search by usernames
                    for (const auto& accountEntry : fs::directory_iterator(serviceEntry.path())) {
                        if (accountEntry.path().extension() == ".pwd") {
                            std::string username = accountEntry.path().stem().string();
                            
                            if (std::regex_search(username, pattern)) {
                                std::string filePath = accountEntry.path().string();
                                std::ifstream file(filePath);
                                
                                if (file.is_open()) {
                                    std::string encryptedPassword;
                                    std::getline(file, encryptedPassword);
                                    std::string password = encryptDecrypt(encryptedPassword, masterPasswordHash);
                                    
                                    results.push_back({service, username, password});
                                }
                            }
                        }
                    }
                }
            }
        }
        
        return results;
    }
    
    // Safe number input (fixes arrow key issue)
    int getNumberInput() {
        std::string input;
        std::getline(std::cin, input);
        
        try {
            return std::stoi(input);
        } catch (const std::exception& e) {
            return -1; // Invalid input
        }
    }

    // Save password to file
    bool savePasswordToFile(const std::string& service, const std::string& username, const std::string& password) {
        std::string serviceDir = getServiceDir(service);
        if (!fs::exists(serviceDir)) {
            fs::create_directories(serviceDir);
        }
        
        std::string filePath = getAccountFile(service, username);
        
        // Check if entry already exists
        if (fs::exists(filePath)) {
            std::cout << Colors::BRIGHT_RED << "⚠ Password for '" << username << "' in service '" << service << "' already exists!" << Colors::RESET << std::endl;
            std::cout << Colors::YELLOW << "Overwrite? (y/N): " << Colors::RESET;
            std::string overwrite;
            std::getline(std::cin, overwrite);
            
            if (overwrite != "y" && overwrite != "Y") {
                std::cout << Colors::YELLOW << "✓ Save cancelled." << Colors::RESET << std::endl;
                return false;
            }
        }
        
        std::ofstream file(filePath);
        if (file.is_open()) {
            std::string encryptedPassword = encryptDecrypt(password, masterPasswordHash);
            file << encryptedPassword;
            std::cout << Colors::BRIGHT_GREEN << "✓ Password for '" << username << "' in service '" << service << "' saved successfully!" << Colors::RESET << std::endl;
            return true;
        } else {
            std::cout << Colors::BRIGHT_RED << "✗ Error: Could not save password!" << Colors::RESET << std::endl;
            return false;
        }
    }

    // Generate password with options
    std::string generatePasswordWithOptions() {
        std::cout << Colors::BRIGHT_CYAN << "\n=== Password Generator ===" << Colors::RESET << std::endl;
        
        int length = 16;
        std::cout << Colors::BRIGHT_BLUE << "Password length (8-64) [16]: " << Colors::RESET;
        std::string lengthInput;
        std::getline(std::cin, lengthInput);
        
        if (!lengthInput.empty()) {
            try {
                length = std::stoi(lengthInput);
                if (length < 8) length = 8;
                if (length > 64) length = 64;
            } catch (...) {
                // Use default value
            }
        }
        
        std::cout << Colors::YELLOW << "Use uppercase letters? (Y/n): " << Colors::RESET;
        std::string useUpper;
        std::getline(std::cin, useUpper);
        
        std::cout << Colors::YELLOW << "Use lowercase letters? (Y/n): " << Colors::RESET;
        std::string useLower;
        std::getline(std::cin, useLower);
        
        std::cout << Colors::YELLOW << "Use numbers? (Y/n): " << Colors::RESET;
        std::string useNumbers;
        std::getline(std::cin, useNumbers);
        
        std::cout << Colors::YELLOW << "Use special symbols? (Y/n): " << Colors::RESET;
        std::string useSymbols;
        std::getline(std::cin, useSymbols);
        
        bool upper = useUpper != "n" && useUpper != "N";
        bool lower = useLower != "n" && useLower != "N";
        bool numbers = useNumbers != "n" && useNumbers != "N";
        bool symbols = useSymbols != "n" && useSymbols != "N";
        
        // Generate password
        std::string password = generatePassword(length, upper, lower, numbers, symbols);
        
        std::cout << Colors::BRIGHT_GREEN << "\n🎉 Generated password: " << Colors::BRIGHT_WHITE << password << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_CYAN << "──────────────────────────────────────────────" << Colors::RESET << std::endl;
        
        return password;
    }

public:
    PasswordManager() {
        baseDir = getPasswordDir();
        createPasswordDir();
        
        if (!masterPasswordExists()) {
            createMasterPassword();
        } else {
            loadMasterPassword();
        }
        
        // Verify master password on startup
        int attempts = 3;
        while (attempts > 0) {
            if (verifyMasterPassword()) {
                std::cout << Colors::BRIGHT_GREEN << "✓ Access granted!" << Colors::RESET << std::endl;
                break;
            } else {
                attempts--;
                if (attempts > 0) {
                    std::cout << Colors::BRIGHT_RED << "✗ Wrong password! Attempts left: " << attempts << Colors::RESET << std::endl;
                } else {
                    std::cout << Colors::BRIGHT_RED << "✗ Too many failed attempts. Exiting." << Colors::RESET << std::endl;
                    exit(1);
                }
            }
        }
    }
    
    void addPassword() {
        std::string service, username, password;
        
        std::cout << Colors::BRIGHT_CYAN << "=== Add Password ===" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_BLUE << "Enter service name: " << Colors::RESET;
        std::getline(std::cin, service);
        
        if (service.empty()) {
            std::cout << Colors::BRIGHT_RED << "✗ Error: Service name cannot be empty!" << Colors::RESET << std::endl;
            return;
        }
        
        std::cout << Colors::BRIGHT_BLUE << "Enter username: " << Colors::RESET;
        std::getline(std::cin, username);
        
        std::cout << Colors::YELLOW << "1. Enter password manually" << std::endl;
        std::cout << "2. Generate password" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_BLUE << "Choose option: " << Colors::RESET;
        
        std::string choice;
        std::getline(std::cin, choice);
        
        if (choice == "2") {
            // Generate password first
            password = generatePasswordWithOptions();
            
            // Then ask if user wants to save it
            std::cout << Colors::YELLOW << "\nDo you want to save this password? (y/N): " << Colors::RESET;
            std::string saveChoice;
            std::getline(std::cin, saveChoice);
            
            if (saveChoice != "y" && saveChoice != "Y") {
                std::cout << Colors::YELLOW << "✓ Password not saved." << Colors::RESET << std::endl;
                return;
            }
        } else {
            password = readPassword("Enter password: ");
        }
        
        // Save the password
        savePasswordToFile(service, username, password);
    }
    
    void generateAndSavePassword() {
        // Generate password first
        std::string password = generatePasswordWithOptions();
        
        // Then ask if user wants to save it
        std::cout << Colors::YELLOW << "\nDo you want to save this password? (y/N): " << Colors::RESET;
        std::string saveChoice;
        std::getline(std::cin, saveChoice);
        
        if (saveChoice != "y" && saveChoice != "Y") {
            std::cout << Colors::YELLOW << "✓ Password not saved. You can use it manually." << Colors::RESET << std::endl;
            return;
        }
        
        // Ask for service and username to save
        std::string service, username;
        
        std::cout << Colors::BRIGHT_BLUE << "\nEnter service name: " << Colors::RESET;
        std::getline(std::cin, service);
        
        if (service.empty()) {
            std::cout << Colors::BRIGHT_RED << "✗ Error: Service name cannot be empty!" << Colors::RESET << std::endl;
            return;
        }
        
        std::cout << Colors::BRIGHT_BLUE << "Enter username: " << Colors::RESET;
        std::getline(std::cin, username);
        
        // Save the password
        savePasswordToFile(service, username, password);
    }
    
    void getPassword() {
        std::string service, username;
        
        std::cout << Colors::BRIGHT_CYAN << "=== Get Password ===" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_BLUE << "Enter service name: " << Colors::RESET;
        std::getline(std::cin, service);
        
        std::cout << Colors::BRIGHT_BLUE << "Enter username: " << Colors::RESET;
        std::getline(std::cin, username);
        
        std::string filePath = getAccountFile(service, username);
        std::ifstream file(filePath);
        
        if (file.is_open()) {
            std::string encryptedPassword;
            std::getline(file, encryptedPassword);
            
            std::string password = encryptDecrypt(encryptedPassword, masterPasswordHash);
            
            std::cout << Colors::BRIGHT_CYAN << "\n--- Account Data ---" << Colors::RESET << std::endl;
            std::cout << Colors::BRIGHT_BLUE << "Service: " << Colors::BRIGHT_WHITE << service << Colors::RESET << std::endl;
            std::cout << Colors::BRIGHT_BLUE << "Username: " << Colors::BRIGHT_WHITE << username << Colors::RESET << std::endl;
            std::cout << Colors::BRIGHT_BLUE << "Password: " << Colors::BRIGHT_GREEN << password << Colors::RESET << std::endl;
            std::cout << Colors::BRIGHT_CYAN << "-----------------------" << Colors::RESET << std::endl;
        } else {
            std::cout << Colors::BRIGHT_RED << "✗ Error: Password for '" << username << "' in service '" << service << "' not found!" << Colors::RESET << std::endl;
        }
    }
    
    void listServices() {
        std::string dir = getPasswordDir();
        
        if (!fs::exists(dir)) {
            std::cout << Colors::BRIGHT_RED << "✗ Password directory doesn't exist!" << Colors::RESET << std::endl;
            return;
        }
        
        std::cout << Colors::BRIGHT_CYAN << "=== Services List ===" << Colors::RESET << std::endl;
        
        int totalAccounts = 0;
        for (const auto& entry : fs::directory_iterator(dir)) {
            if (entry.is_directory() && entry.path().filename() != "." && entry.path().filename() != "..") {
                std::string service = entry.path().filename().string();
                std::cout << Colors::BRIGHT_MAGENTA << "\n📱 Service: " << Colors::BRIGHT_WHITE << service << Colors::RESET << std::endl;
                std::cout << Colors::BRIGHT_BLUE << "👤 Accounts:" << Colors::RESET << std::endl;
                
                int accountCount = 0;
                for (const auto& accountEntry : fs::directory_iterator(entry.path())) {
                    if (accountEntry.path().extension() == ".pwd") {
                        std::string username = accountEntry.path().stem().string();
                        std::cout << Colors::GREEN << "  ✓ " << Colors::BRIGHT_WHITE << username << Colors::RESET << std::endl;
                        accountCount++;
                        totalAccounts++;
                    }
                }
                
                if (accountCount == 0) {
                    std::cout << Colors::YELLOW << "  (no accounts)" << Colors::RESET << std::endl;
                }
            }
        }
        
        std::cout << Colors::BRIGHT_CYAN << "\n📊 Total: " << totalAccounts << " accounts" << Colors::RESET << std::endl;
    }
    
    void deletePassword() {
        std::string service, username;
        
        std::cout << Colors::BRIGHT_CYAN << "=== Delete Password ===" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_BLUE << "Enter service name: " << Colors::RESET;
        std::getline(std::cin, service);
        
        std::cout << Colors::BRIGHT_BLUE << "Enter username: " << Colors::RESET;
        std::getline(std::cin, username);
        
        std::string filePath = getAccountFile(service, username);
        
        if (fs::exists(filePath)) {
            std::cout << Colors::BRIGHT_RED << "⚠ Are you sure you want to delete password for '" << username << "' in service '" << service << "'? (y/N): " << Colors::RESET;
            std::string confirmation;
            std::getline(std::cin, confirmation);
            
            if (confirmation == "y" || confirmation == "Y") {
                if (fs::remove(filePath)) {
                    std::cout << Colors::BRIGHT_GREEN << "✓ Password deleted successfully!" << Colors::RESET << std::endl;
                    
                    // Remove service directory if empty
                    std::string serviceDir = getServiceDir(service);
                    if (fs::exists(serviceDir) && fs::is_empty(serviceDir)) {
                        fs::remove(serviceDir);
                    }
                } else {
                    std::cout << Colors::BRIGHT_RED << "✗ Error: Could not delete password!" << Colors::RESET << std::endl;
                }
            } else {
                std::cout << Colors::YELLOW << "✓ Deletion cancelled." << Colors::RESET << std::endl;
            }
        } else {
            std::cout << Colors::BRIGHT_RED << "✗ Error: Password for '" << username << "' in service '" << service << "' not found!" << Colors::RESET << std::endl;
        }
    }
    
    void changePassword() {
        std::string service, username, newPassword;
        
        std::cout << Colors::BRIGHT_CYAN << "=== Change Password ===" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_BLUE << "Enter service name: " << Colors::RESET;
        std::getline(std::cin, service);
        
        std::cout << Colors::BRIGHT_BLUE << "Enter username: " << Colors::RESET;
        std::getline(std::cin, username);
        
        std::string filePath = getAccountFile(service, username);
        
        if (!fs::exists(filePath)) {
            std::cout << Colors::BRIGHT_RED << "✗ Error: Password for '" << username << "' in service '" << service << "' not found!" << Colors::RESET << std::endl;
            return;
        }
        
        std::cout << Colors::YELLOW << "1. Enter new password manually" << std::endl;
        std::cout << "2. Generate new password" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_BLUE << "Choose option: " << Colors::RESET;
        
        std::string choice;
        std::getline(std::cin, choice);
        
        if (choice == "2") {
            // Generate password first
            newPassword = generatePasswordWithOptions();
            
            // Then ask if user wants to save it
            std::cout << Colors::YELLOW << "\nDo you want to use this password? (y/N): " << Colors::RESET;
            std::string saveChoice;
            std::getline(std::cin, saveChoice);
            
            if (saveChoice != "y" && saveChoice != "Y") {
                std::cout << Colors::YELLOW << "✓ Password change cancelled." << Colors::RESET << std::endl;
                return;
            }
        } else {
            newPassword = readPassword("Enter new password: ");
        }
        
        std::ofstream file(filePath);
        if (file.is_open()) {
            std::string encryptedPassword = encryptDecrypt(newPassword, masterPasswordHash);
            file << encryptedPassword;
            std::cout << Colors::BRIGHT_GREEN << "✓ Password changed successfully!" << Colors::RESET << std::endl;
        } else {
            std::cout << Colors::BRIGHT_RED << "✗ Error: Could not change password!" << Colors::RESET << std::endl;
        }
    }
    
    void searchPasswords() {
        std::string query;
        
        std::cout << Colors::BRIGHT_CYAN << "=== Search Passwords ===" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_BLUE << "Enter search query: " << Colors::RESET;
        std::getline(std::cin, query);
        
        if (query.empty()) {
            std::cout << Colors::BRIGHT_RED << "✗ Query cannot be empty!" << Colors::RESET << std::endl;
            return;
        }
        
        std::vector<PasswordEntry> results = searchPasswords(query);
        
        if (results.empty()) {
            std::cout << Colors::YELLOW << "🔍 Nothing found for query '" << query << "'." << Colors::RESET << std::endl;
        } else {
            std::cout << Colors::BRIGHT_GREEN << "🔍 Found " << results.size() << " results:" << Colors::RESET << std::endl;
            
            for (size_t i = 0; i < results.size(); ++i) {
                const auto& entry = results[i];
                std::cout << Colors::BRIGHT_CYAN << "\n--- Result " << (i + 1) << " ---" << Colors::RESET << std::endl;
                std::cout << Colors::BRIGHT_BLUE << "Service: " << Colors::BRIGHT_WHITE << entry.service << Colors::RESET << std::endl;
                std::cout << Colors::BRIGHT_BLUE << "Username: " << Colors::BRIGHT_WHITE << entry.username << Colors::RESET << std::endl;
                std::cout << Colors::BRIGHT_BLUE << "Password: " << Colors::BRIGHT_GREEN << entry.password << Colors::RESET << std::endl;
            }
        }
    }
    
    void showMenu() {
        std::cout << Colors::BRIGHT_MAGENTA << "\n✨ === Password Manager ===" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "1. " << Colors::BRIGHT_WHITE << "Add Password" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "2. " << Colors::BRIGHT_WHITE << "Get Password" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "3. " << Colors::BRIGHT_WHITE << "Services and Accounts List" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "4. " << Colors::BRIGHT_WHITE << "Delete Password" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "5. " << Colors::BRIGHT_WHITE << "Change Password" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "6. " << Colors::BRIGHT_WHITE << "Search Passwords" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "7. " << Colors::BRIGHT_WHITE << "Password Generator" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "8. " << Colors::BRIGHT_WHITE << "Exit" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_BLUE << "Choose action: " << Colors::RESET;
    }
    
    void run() {
        while (true) {
            showMenu();
            
            // Use safe input (fixes arrow key issue)
            int choice = getNumberInput();
            
            switch (choice) {
                case 1:
                    addPassword();
                    break;
                case 2:
                    getPassword();
                    break;
                case 3:
                    listServices();
                    break;
                case 4:
                    deletePassword();
                    break;
                case 5:
                    changePassword();
                    break;
                case 6:
                    searchPasswords();
                    break;
                case 7:
                    generateAndSavePassword();
                    break;
                case 8:
                    std::cout << Colors::BRIGHT_CYAN << "👋 Goodbye!" << Colors::RESET << std::endl;
                    return;
                default:
                    std::cout << Colors::BRIGHT_RED << "✗ Invalid choice! Try again." << Colors::RESET << std::endl;
                    break;
            }
        }
    }
};

int main() {
    PasswordManager pm;
    pm.run();
    return 0;
}
