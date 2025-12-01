#include <iostream>
#include <cstdlib>

int main() {
    system("lsblk");
    
    std::string name;
    std::cout << "Enter the device name (e.g., sdb, sdc): ";
    std::cin >> name;
    name = "/dev/" + name;
    
    std::cout << "\nSelect operation:\n";
    std::cout << "1. Format only\n";
    std::cout << "2. Write image with formatting\n";
    std::cout << "Enter choice (1-2): ";
    
    int operation;
    std::cin >> operation;
    
    system(("sudo umount " + name + "* 2>/dev/null").c_str());
    
    if (operation == 1) {
        std::cout << "\nSelect file system:\n";
        std::cout << "1. FAT32\n";
        std::cout << "2. ext4\n";
        std::cout << "Enter choice (1-2): ";
        
        int fs_choice;
        std::cin >> fs_choice;
        
        switch(fs_choice) {
            case 1:
                system(("sudo mkfs.fat -F32 " + name + " -I").c_str());
                std::cout << "Formatted as FAT32\n";
                break;
            case 2:
                system(("sudo mkfs.ext4 " + name).c_str());
                std::cout << "Formatted as ext4\n";
                break;
            default:
                std::cout << "Invalid choice!\n";
                return 1;
        }
    }
    else if (operation == 2) {
        std::string image_path;
        std::cout << "Enter the full path to image file: ";
        std::cin.ignore();
        std::getline(std::cin, image_path);
        
        std::cout << "\nSelect file system for formatting before writing:\n";
        std::cout << "1. FAT32\n";
        std::cout << "2. ext4\n";
        std::cout << "Enter choice (1-2): ";
        
        int fs_choice;
        std::cin >> fs_choice;
        
        std::cout << "\nFormatting device...\n";
        switch(fs_choice) {
            case 1:
                system(("sudo mkfs.fat -F32 " + name + " -I").c_str());
                break;
            case 2:
                system(("sudo mkfs.ext4 " + name).c_str());
                break;
            default:
                std::cout << "Invalid choice!\n";
                return 1;
        }
        
        std::cout << "\nWriting image to device...\n";
        std::cout << "WARNING: This will overwrite all data on " << name << "!\n";
        std::cout << "Type 'yes' to confirm: ";
        
        std::string confirmation;
        std::cin >> confirmation;
        
        if (confirmation == "yes" || confirmation == "YES" || confirmation == "Yes") {
            std::string dd_command = "sudo dd if=" + image_path + " of=" + name + 
                                    " bs=4M status=progress oflag=sync";
            std::cout << "Executing: " << dd_command << "\n";
            system(dd_command.c_str());
            std::cout << "\nImage writing completed!\n";
            
            system("sync");
        } else {
            std::cout << "Operation cancelled.\n";
        }
    }
    else {
        std::cout << "Invalid operation choice!\n";
        return 1;
    }
    
    return 0;
}
