#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <filesystem>
#include <algorithm>
#include <iomanip>
#include <termios.h>
#include <unistd.h>
#include <random>
#include <regex>
#include <sstream>
#include <cctype>
#include <ctime>

namespace fs = std::filesystem;

class Colors {
public:
    static const std::string RESET;
    static const std::string GREEN;
    static const std::string RED;
    static const std::string YELLOW;
    static const std::string BLUE;
    static const std::string MAGENTA;
    static const std::string CYAN;
    static const std::string BRIGHT_GREEN;
    static const std::string BRIGHT_RED;
    static const std::string BRIGHT_YELLOW;
    static const std::string BRIGHT_BLUE;
    static const std::string BRIGHT_MAGENTA;
    static const std::string BRIGHT_CYAN;
    static const std::string BRIGHT_WHITE;
};

const std::string Colors::RESET = "\033[0m";
const std::string Colors::GREEN = "\033[32m";
const std::string Colors::RED = "\033[31m";
const std::string Colors::YELLOW = "\033[33m";
const std::string Colors::BLUE = "\033[34m";
const std::string Colors::MAGENTA = "\033[35m";
const std::string Colors::CYAN = "\033[36m";
const std::string Colors::BRIGHT_GREEN = "\033[92m";
const std::string Colors::BRIGHT_RED = "\033[91m";
const std::string Colors::BRIGHT_YELLOW = "\033[93m";
const std::string Colors::BRIGHT_BLUE = "\033[94m";
const std::string Colors::BRIGHT_MAGENTA = "\033[95m";
const std::string Colors::BRIGHT_CYAN = "\033[96m";
const std::string Colors::BRIGHT_WHITE = "\033[97m";

class PasswordManager {
private:
    std::string baseDir;
    std::string masterPasswordHash;
    std::string encryptionKey;
    
    struct PasswordEntry {
        std::string service;
        std::string username;
        std::string password;
        std::string notes;
    };
    
    struct ImportResult {
        int totalFound;
        int successfullyImported;
        int skipped;
        std::vector<std::string> errors;
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
        std::replace_if(serviceClean.begin(), serviceClean.end(), 
                       [](char c) { return !std::isalnum(c) && c != '-' && c != '_'; }, '_');
        return getPasswordDir() + "/" + serviceClean;
    }
    
    std::string getAccountFile(const std::string& service, const std::string& username) {
        std::string serviceClean = service;
        std::replace_if(serviceClean.begin(), serviceClean.end(), 
                       [](char c) { return !std::isalnum(c) && c != '-' && c != '_'; }, '_');
        
        std::string usernameClean = username;
        std::replace_if(usernameClean.begin(), usernameClean.end(), 
                       [](char c) { return !std::isalnum(c) && c != '-' && c != '_' && c != '@' && c != '.'; }, '_');
        
        return getServiceDir(service) + "/" + usernameClean + ".pwd";
    }
    
    std::string generateSalt(size_t length = 32) {
        const std::string chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        std::random_device rd;
        std::mt19937 generator(rd());
        std::uniform_int_distribution<> distribution(0, chars.size() - 1);
        
        std::string salt;
        for (size_t i = 0; i < length; ++i) {
            salt += chars[distribution(generator)];
        }
        return salt;
    }
    
    std::string simpleHash(const std::string& password, const std::string& salt) {
        std::string data = password + salt;
        std::hash<std::string> hasher;
        size_t hash1 = hasher(data);
        size_t hash2 = hasher(data + std::to_string(hash1));
        
        std::stringstream ss;
        ss << std::hex << hash1 << hash2;
        std::string hashStr = ss.str();
        
        return salt + hashStr;
    }
    
    bool verifyPassword(const std::string& password, const std::string& storedHash) {
        if (storedHash.length() <= 32) {
            return false;
        }
        
        std::string salt = storedHash.substr(0, 32);
        std::string storedHashOnly = storedHash.substr(32);
        
        std::string computedHash = simpleHash(password, salt);
        std::string computedHashOnly = computedHash.substr(32);
        
        return storedHashOnly == computedHashOnly;
    }
    
    std::string deriveEncryptionKey(const std::string& password, const std::string& salt) {
        std::string data = password + salt + "encryption-key";
        std::hash<std::string> hasher;
        size_t hash = hasher(data);
        
        std::stringstream ss;
        ss << std::hex << hash;
        std::string key = ss.str();
        
        while (key.length() < 32) {
            key += key;
        }
        return key.substr(0, 32);
    }
    
    std::string encryptDecrypt(const std::string& input, const std::string& key) {
        if (input.empty()) return input;
        
        std::string result = input;
        for (size_t i = 0; i < input.length(); ++i) {
            result[i] = input[i] ^ key[i % key.length()];
        }
        return result;
    }
    
    std::string toHex(const std::string& input) {
        std::stringstream ss;
        for (unsigned char c : input) {
            ss << std::hex << std::setw(2) << std::setfill('0') << (int)c;
        }
        return ss.str();
    }
    
    std::string fromHex(const std::string& hex) {
        std::string result;
        for (size_t i = 0; i < hex.length(); i += 2) {
            std::string byteString = hex.substr(i, 2);
            char byte = (char)strtol(byteString.c_str(), nullptr, 16);
            result.push_back(byte);
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
                    std::string salt = generateSalt(32);
                    masterPasswordHash = simpleHash(password1, salt);
                    encryptionKey = deriveEncryptionKey(password1, salt);
                    
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
        
        std::ifstream file(getMasterPasswordFile());
        if (!file.is_open()) {
            return false;
        }
        
        std::string savedHash;
        std::getline(file, savedHash);
        
        if (savedHash.empty()) {
            return false;
        }
        
        if (!verifyPassword(password, savedHash)) {
            return false;
        }
        
        std::string salt = savedHash.substr(0, 32);
        encryptionKey = deriveEncryptionKey(password, salt);
        masterPasswordHash = savedHash;
        
        return true;
    }
    
    void loadMasterPassword() {
        std::ifstream file(getMasterPasswordFile());
        if (file.is_open()) {
            std::getline(file, masterPasswordHash);
        }
    }
    
    std::string generatePassword(int length = 16, bool useUpper = true, bool useLower = true, 
                                bool useNumbers = true, bool useSymbols = true) {
        std::string characters;
        
        if (useLower) characters += "abcdefghijklmnopqrstuvwxyz";
        if (useUpper) characters += "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        if (useNumbers) characters += "0123456789";
        if (useSymbols) characters += "!@#$%^&*()_+-=[]{}|;:,.<>?";
        
        if (characters.empty()) {
            return "password123";
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
                
                if (std::regex_search(service, pattern)) {
                    for (const auto& accountEntry : fs::directory_iterator(serviceEntry.path())) {
                        if (accountEntry.path().extension() == ".pwd") {
                            std::string username = accountEntry.path().stem().string();
                            std::string filePath = accountEntry.path().string();
                            
                            std::ifstream file(filePath);
                            if (file.is_open()) {
                                std::string encryptedPasswordHex;
                                std::getline(file, encryptedPasswordHex);
                                try {
                                    std::string encryptedPassword = fromHex(encryptedPasswordHex);
                                    std::string password = encryptDecrypt(encryptedPassword, encryptionKey);
                                    
                                    results.push_back({service, username, password});
                                } catch (const std::exception& e) {
                                    std::cout << Colors::BRIGHT_RED << "✗ Error decrypting password for " << username << Colors::RESET << std::endl;
                                }
                            }
                        }
                    }
                } else {
                    for (const auto& accountEntry : fs::directory_iterator(serviceEntry.path())) {
                        if (accountEntry.path().extension() == ".pwd") {
                            std::string username = accountEntry.path().stem().string();
                            
                            if (std::regex_search(username, pattern)) {
                                std::string filePath = accountEntry.path().string();
                                std::ifstream file(filePath);
                                
                                if (file.is_open()) {
                                    std::string encryptedPasswordHex;
                                    std::getline(file, encryptedPasswordHex);
                                    try {
                                        std::string encryptedPassword = fromHex(encryptedPasswordHex);
                                        std::string password = encryptDecrypt(encryptedPassword, encryptionKey);
                                        
                                        results.push_back({service, username, password});
                                    } catch (const std::exception& e) {
                                        std::cout << Colors::BRIGHT_RED << "✗ Error decrypting password for " << username << Colors::RESET << std::endl;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        return results;
    }
    
    int getNumberInput() {
        std::string input;
        std::getline(std::cin, input);
        
        try {
            return std::stoi(input);
        } catch (const std::exception& e) {
            return -1;
        }
    }

    bool savePasswordForImport(const std::string& service, const std::string& username, const std::string& password, const std::string& notes = "") {
        std::string serviceDir = getServiceDir(service);
        if (!fs::exists(serviceDir)) {
            fs::create_directories(serviceDir);
        }
        
        std::string filePath = getAccountFile(service, username);
        
        std::ofstream file(filePath);
        if (file.is_open()) {
            try {
                std::string encryptedPassword = encryptDecrypt(password, encryptionKey);
                file << toHex(encryptedPassword);
                return true;
            } catch (const std::exception& e) {
                std::cout << Colors::BRIGHT_RED << "✗ Error encrypting password: " << e.what() << Colors::RESET << std::endl;
                return false;
            }
        }
        return false;
    }

    bool savePasswordToFile(const std::string& service, const std::string& username, const std::string& password, const std::string& notes = "") {
        std::string serviceDir = getServiceDir(service);
        if (!fs::exists(serviceDir)) {
            fs::create_directories(serviceDir);
        }
        
        std::string filePath = getAccountFile(service, username);
        
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
            try {
                std::string encryptedPassword = encryptDecrypt(password, encryptionKey);
                file << toHex(encryptedPassword);
                std::cout << Colors::BRIGHT_GREEN << "✓ Password for '" << username << "' in service '" << service << "' saved successfully!" << Colors::RESET << std::endl;
                return true;
            } catch (const std::exception& e) {
                std::cout << Colors::BRIGHT_RED << "✗ Error encrypting password: " << e.what() << Colors::RESET << std::endl;
                return false;
            }
        } else {
            std::cout << Colors::BRIGHT_RED << "✗ Error: Could not save password!" << Colors::RESET << std::endl;
            return false;
        }
    }

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
        
        std::string password = generatePassword(length, upper, lower, numbers, symbols);
        
        std::cout << Colors::BRIGHT_GREEN << "\n🎉 Generated password: " << Colors::BRIGHT_WHITE << password << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_CYAN << "──────────────────────────────────────────────" << Colors::RESET << std::endl;
        
        return password;
    }

    std::string trim(const std::string& str) {
        if (str.empty()) return "";
        
        size_t start = str.find_first_not_of(" \t\n\r\"");
        size_t end = str.find_last_not_of(" \t\n\r\"");
        
        if (start == std::string::npos) return "";
        return str.substr(start, end - start + 1);
    }

    std::string getCurrentTimestamp() {
        auto now = std::time(nullptr);
        auto tm = *std::localtime(&now);
        std::stringstream ss;
        ss << std::put_time(&tm, "%Y-%m-%d %H:%M:%S");
        return ss.str();
    }

    std::string toLower(const std::string& str) {
        std::string result = str;
        std::transform(result.begin(), result.end(), result.begin(), 
                      [](unsigned char c){ return std::tolower(c); });
        return result;
    }

    std::vector<std::string> parseCSVLine(const std::string& line) {
        std::vector<std::string> parts;
        bool inQuotes = false;
        std::string field;
        
        for (char c : line) {
            if (c == '"') {
                inQuotes = !inQuotes;
            } else if (c == ',' && !inQuotes) {
                parts.push_back(trim(field));
                field.clear();
            } else {
                field += c;
            }
        }
        parts.push_back(trim(field));
        
        return parts;
    }

    ImportResult importFromCSV(const std::string& filename) {
        ImportResult result;
        fs::path csvPath = filename;
        
        if (!fs::exists(csvPath)) {
            result.errors.push_back("File " + filename + " does not exist");
            return result;
        }

        std::ifstream file(csvPath);
        if (!file.is_open()) {
            result.errors.push_back("Cannot open file: " + filename);
            return result;
        }

        std::string line;
        int lineNumber = 0;
        
        if (std::getline(file, line)) {
            lineNumber++;
            std::vector<std::string> headers = parseCSVLine(line);
            
            bool hasHeader = false;
            for (const auto& header : headers) {
                std::string headerLower = toLower(header);
                if (headerLower.find("service") != std::string::npos || 
                    headerLower.find("username") != std::string::npos ||
                    headerLower.find("password") != std::string::npos) {
                    hasHeader = true;
                    break;
                }
            }
            
            if (!hasHeader) {
                file.clear();
                file.seekg(0);
                lineNumber = 0;
            } else {
                std::cout << Colors::BRIGHT_BLUE << "📋 Detected CSV header, skipping first line" << Colors::RESET << std::endl;
            }
        }
        
        while (std::getline(file, line)) {
            lineNumber++;
            if (line.empty()) continue;
            
            std::vector<std::string> parts = parseCSVLine(line);
            
            if (parts.size() >= 3) {
                std::string service = parts[0];
                std::string username = parts.size() > 1 ? parts[1] : "";
                std::string password = parts.size() > 2 ? parts[2] : "";
                std::string notes = parts.size() > 3 ? parts[3] : "";
                
                if (service.empty()) {
                    service = "Imported_Service_" + std::to_string(lineNumber);
                }
                
                if (username.empty()) {
                    result.errors.push_back("Line " + std::to_string(lineNumber) + ": Empty username");
                    continue;
                }
                
                if (password.empty()) {
                    result.errors.push_back("Line " + std::to_string(lineNumber) + ": Empty password");
                    continue;
                }
                
                result.totalFound++;
                
                if (savePasswordForImport(service, username, password, notes)) {
                    result.successfullyImported++;
                    std::cout << Colors::GREEN << "✓ " << service << " - " << username << Colors::RESET << std::endl;
                } else {
                    result.skipped++;
                    result.errors.push_back("Line " + std::to_string(lineNumber) + ": Failed to save");
                }
            } else {
                result.errors.push_back("Line " + std::to_string(lineNumber) + ": Not enough columns (" + std::to_string(parts.size()) + ")");
            }
        }
        
        file.close();
        return result;
    }
    
    ImportResult importFromTXT(const std::string& filename) {
        ImportResult result;
        std::ifstream file(filename);
        
        if (!file.is_open()) {
            result.errors.push_back("Cannot open file: " + filename);
            return result;
        }
        
        std::string line;
        int lineNumber = 0;
        
        while (std::getline(file, line)) {
            lineNumber++;
            
            line = trim(line);
            if (line.empty() || line[0] == '#') continue;
            
            std::vector<std::string> parts;
            size_t pos = 0;
            
            if (line.find(":::") != std::string::npos) {
                while ((pos = line.find(":::")) != std::string::npos) {
                    parts.push_back(line.substr(0, pos));
                    line.erase(0, pos + 3);
                }
                parts.push_back(line);
            }
            else if (line.find(':') != std::string::npos) {
                while ((pos = line.find(':')) != std::string::npos) {
                    parts.push_back(line.substr(0, pos));
                    line.erase(0, pos + 1);
                }
                parts.push_back(line);
            }
            else if (line.find('|') != std::string::npos) {
                while ((pos = line.find('|')) != std::string::npos) {
                    parts.push_back(line.substr(0, pos));
                    line.erase(0, pos + 1);
                }
                parts.push_back(line);
            }
            
            if (parts.size() >= 3) {
                std::string service = trim(parts[0]);
                std::string username = trim(parts[1]);
                std::string password = trim(parts[2]);
                std::string notes = parts.size() > 3 ? trim(parts[3]) : "";
                
                if (!service.empty() && !username.empty() && !password.empty()) {
                    result.totalFound++;
                    if (savePasswordForImport(service, username, password, notes)) {
                        result.successfullyImported++;
                        std::cout << Colors::GREEN << "✓ Imported: " << service << " - " << username << Colors::RESET << std::endl;
                    } else {
                        result.skipped++;
                    }
                }
            }
        }
        
        return result;
    }
    
    void showImportMenu() {
        std::cout << Colors::BRIGHT_CYAN << "\n=== Import Passwords ===" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "1. " << Colors::BRIGHT_WHITE << "CSV File" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "2. " << Colors::BRIGHT_WHITE << "Text File" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "3. " << Colors::BRIGHT_WHITE << "Back to Main Menu" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_BLUE << "Choose format: " << Colors::RESET;
    }
    
    void importPasswords() {
        showImportMenu();
        
        int choice = getNumberInput();
        
        if (choice == 3) return;
        
        std::cout << Colors::BRIGHT_BLUE << "Enter file path: " << Colors::RESET;
        std::string filename;
        std::getline(std::cin, filename);
        
        if (!fs::exists(filename)) {
            std::cout << Colors::BRIGHT_RED << "✗ File not found: " << filename << Colors::RESET << std::endl;
            return;
        }
        
        ImportResult result;
        
        switch (choice) {
            case 1:
                result = importFromCSV(filename);
                break;
            case 2:
                result = importFromTXT(filename);
                break;
            default:
                std::cout << Colors::BRIGHT_RED << "✗ Invalid choice!" << Colors::RESET << std::endl;
                return;
        }
        
        std::cout << Colors::BRIGHT_CYAN << "\n=== Import Results ===" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "✓ Total found: " << result.totalFound << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "✓ Successfully imported: " << result.successfullyImported << Colors::RESET << std::endl;
        std::cout << Colors::YELLOW << "⚠ Skipped: " << result.skipped << Colors::RESET << std::endl;
        
        if (!result.errors.empty()) {
            std::cout << Colors::BRIGHT_RED << "✗ Errors: " << result.errors.size() << Colors::RESET << std::endl;
            for (const auto& error : result.errors) {
                std::cout << Colors::RED << "  - " << error << Colors::RESET << std::endl;
            }
        }
        
        if (result.successfullyImported > 0) {
            std::cout << Colors::BRIGHT_GREEN << "\n🎉 Import completed successfully!" << Colors::RESET << std::endl;
        }
    }

    void exportToCSV(const std::string& filename) {
        std::string dir = getPasswordDir();
        
        if (!fs::exists(dir)) {
            std::cout << Colors::BRIGHT_RED << "✗ Password directory doesn't exist!" << Colors::RESET << std::endl;
            return;
        }
        
        fs::path csvPath = filename;
        std::ofstream file(csvPath);
        
        if (!file.is_open()) {
            std::cout << Colors::BRIGHT_RED << "✗ Cannot open file for writing: " << filename << Colors::RESET << std::endl;
            return;
        }
        
        file << "Service,Username,Password,Timestamp\n";
        
        int exportedCount = 0;
        for (const auto& serviceEntry : fs::directory_iterator(dir)) {
            if (serviceEntry.is_directory() && serviceEntry.path().filename() != "." && serviceEntry.path().filename() != "..") {
                std::string service = serviceEntry.path().filename().string();
                
                for (const auto& accountEntry : fs::directory_iterator(serviceEntry.path())) {
                    if (accountEntry.path().extension() == ".pwd") {
                        std::string username = accountEntry.path().stem().string();
                        std::string filePath = accountEntry.path().string();
                        
                        std::ifstream accountFile(filePath);
                        if (accountFile.is_open()) {
                            std::string encryptedPasswordHex;
                            std::getline(accountFile, encryptedPasswordHex);
                            try {
                                std::string encryptedPassword = fromHex(encryptedPasswordHex);
                                std::string password = encryptDecrypt(encryptedPassword, encryptionKey);
                                
                                auto escapeCSV = [](const std::string& str) {
                                    if (str.find(',') != std::string::npos || str.find('"') != std::string::npos || str.find('\n') != std::string::npos) {
                                        return "\"" + std::regex_replace(str, std::regex("\""), "\"\"") + "\"";
                                    }
                                    return str;
                                };
                                
                                file << escapeCSV(service) << ","
                                     << escapeCSV(username) << ","
                                     << escapeCSV(password) << ","
                                     << "\"" << getCurrentTimestamp() << "\"\n";
                                
                                exportedCount++;
                            } catch (const std::exception& e) {
                                std::cout << Colors::BRIGHT_RED << "✗ Error decrypting password for " << username << Colors::RESET << std::endl;
                            }
                        }
                    }
                }
            }
        }
        
        file.close();
        std::cout << Colors::BRIGHT_GREEN << "✓ Exported " << exportedCount << " passwords to " << filename << Colors::RESET << std::endl;
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
        std::string service, username, password, notes;
        
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
            password = generatePasswordWithOptions();
            
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
        
        std::cout << Colors::BRIGHT_BLUE << "Enter notes (optional): " << Colors::RESET;
        std::getline(std::cin, notes);
        
        savePasswordToFile(service, username, password, notes);
    }
    
    void generateAndSavePassword() {
        std::string password = generatePasswordWithOptions();
        
        std::cout << Colors::YELLOW << "\nDo you want to save this password? (y/N): " << Colors::RESET;
        std::string saveChoice;
        std::getline(std::cin, saveChoice);
        
        if (saveChoice != "y" && saveChoice != "Y") {
            std::cout << Colors::YELLOW << "✓ Password not saved. You can use it manually." << Colors::RESET << std::endl;
            return;
        }
        
        std::string service, username, notes;
        
        std::cout << Colors::BRIGHT_BLUE << "\nEnter service name: " << Colors::RESET;
        std::getline(std::cin, service);
        
        if (service.empty()) {
            std::cout << Colors::BRIGHT_RED << "✗ Error: Service name cannot be empty!" << Colors::RESET << std::endl;
            return;
        }
        
        std::cout << Colors::BRIGHT_BLUE << "Enter username: " << Colors::RESET;
        std::getline(std::cin, username);
        
        std::cout << Colors::BRIGHT_BLUE << "Enter notes (optional): " << Colors::RESET;
        std::getline(std::cin, notes);
        
        savePasswordToFile(service, username, password, notes);
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
            std::string encryptedPasswordHex;
            std::getline(file, encryptedPasswordHex);
            
            try {
                std::string encryptedPassword = fromHex(encryptedPasswordHex);
                std::string password = encryptDecrypt(encryptedPassword, encryptionKey);
                
                std::cout << Colors::BRIGHT_CYAN << "\n--- Account Data ---" << Colors::RESET << std::endl;
                std::cout << Colors::BRIGHT_BLUE << "Service: " << Colors::BRIGHT_WHITE << service << Colors::RESET << std::endl;
                std::cout << Colors::BRIGHT_BLUE << "Username: " << Colors::BRIGHT_WHITE << username << Colors::RESET << std::endl;
                std::cout << Colors::BRIGHT_BLUE << "Password: " << Colors::BRIGHT_GREEN << password << Colors::RESET << std::endl;
                std::cout << Colors::BRIGHT_CYAN << "-----------------------" << Colors::RESET << std::endl;
            } catch (const std::exception& e) {
                std::cout << Colors::BRIGHT_RED << "✗ Error decrypting password: " << e.what() << Colors::RESET << std::endl;
            }
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
        std::string service, username, newPassword, notes;
        
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
            newPassword = generatePasswordWithOptions();
            
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
        
        std::cout << Colors::BRIGHT_BLUE << "Enter notes (optional): " << Colors::RESET;
        std::getline(std::cin, notes);
        
        std::ofstream file(filePath);
        if (file.is_open()) {
            try {
                std::string encryptedPassword = encryptDecrypt(newPassword, encryptionKey);
                file << toHex(encryptedPassword);
                std::cout << Colors::BRIGHT_GREEN << "✓ Password changed successfully!" << Colors::RESET << std::endl;
            } catch (const std::exception& e) {
                std::cout << Colors::BRIGHT_RED << "✗ Error encrypting password: " << e.what() << Colors::RESET << std::endl;
            }
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
    
    void exportPasswords() {
        std::string filename;
        std::cout << Colors::BRIGHT_BLUE << "Enter CSV filename for export (default: export.csv): " << Colors::RESET;
        std::getline(std::cin, filename);
        
        if (filename.empty()) {
            filename = "export.csv";
        }
        
        exportToCSV(filename);
    }
    
    void showMenu() {
        std::cout << Colors::BRIGHT_BLUE << "\n ====== CanPass ======" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "1. " << Colors::BRIGHT_WHITE << "Add Password" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "2. " << Colors::BRIGHT_WHITE << "Get Password" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "3. " << Colors::BRIGHT_WHITE << "Services and Accounts List" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "4. " << Colors::BRIGHT_WHITE << "Delete Password" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "5. " << Colors::BRIGHT_WHITE << "Change Password" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "6. " << Colors::BRIGHT_WHITE << "Search Passwords" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "7. " << Colors::BRIGHT_WHITE << "Password Generator" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "8. " << Colors::BRIGHT_WHITE << "Import Passwords" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "9. " << Colors::BRIGHT_WHITE << "Export Passwords" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "10. " << Colors::BRIGHT_WHITE << "Exit" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_GREEN << "11. " << Colors::BRIGHT_WHITE << "Clear terminal" << Colors::RESET << std::endl;
        std::cout << Colors::BRIGHT_BLUE << "Choose action: " << Colors::RESET;
    }
    
    void run() {
        while (true) {
            showMenu();
            
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
                    importPasswords();
                    break;
                case 9:
                    exportPasswords();
                    break;
                case 10:
                    std::cout << Colors::BRIGHT_CYAN << "👋 Goodbye!" << Colors::RESET << std::endl;
                    return;
                case 11:
					system("clear");
                    break;

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
