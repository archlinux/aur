#include <iostream>

int main() {
    system("lsblk");
    std::string name;
    std::cout << "Enter the device name: ";
    std::cin >> name;
    name = "/dev/" + name;

    int choice;
    std::cout << "Select file system:\n";
    std::cout << "1. FAT32\n";
    std::cout << "2. ext4\n";
    std::cout << "Enter choice (1-4): ";
    std::cin >> choice;

    system(("sudo umount " + name).c_str());

    switch(choice) {
        case 1:
            system(("sudo mkfs.fat -F32 " + name + " -I").c_str());
            break;
        case 2:
            system(("sudo mkfs.ext4 " + name).c_str());
            break;
        default:
            std::cout << "Invalid choice!\n";
    }
}
