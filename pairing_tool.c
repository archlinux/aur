/* 
 * Copyright 2011 Benjamin Tissoires <benjamin.tissoi...@gmail.com> 
 * 
 * This program is free software: you can redistribute it and/or modify 
 * it under the terms of the GNU General Public License as published by 
 * the Free Software Foundation, either version 3 of the License, or 
 * (at your option) any later version. 
 * 
 * This program is distributed in the hope that it will be useful, 
 * but WITHOUT ANY WARRANTY; without even the implied warranty of 
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
 * GNU General Public License for more details. 
 * 
 * You should have received a copy of the GNU General Public License 
 * along with this program.  If not, see <http://www.gnu.org/licenses/>. 
 */ 
#include <linux/input.h> 
#include <linux/hidraw.h> 
#include <sys/ioctl.h> 
#include <fcntl.h> 
#include <unistd.h> 
#include <stdio.h> 
#include <errno.h> 
#define USB_VENDOR_ID_LOGITECH                  (__u32)0x046d 
#define USB_DEVICE_ID_UNIFYING_RECEIVER         (__s16)0xc52b 
#define USB_DEVICE_ID_UNIFYING_RECEIVER_2       (__s16)0xc532 
int main(int argc, char **argv) 
{ 
        int fd; 
        int res; 
        struct hidraw_devinfo info; 
        char magic_sequence[] = {0x10, 0xFF, 0x80, 0xB2, 0x01, 0x00, 0x00}; 
        if (argc == 1) { 
                errno = EINVAL; 
                perror("No hidraw device given"); 
                return 1; 
        } 
        /* Open the Device with non-blocking reads. */ 
        fd = open(argv[1], O_RDWR|O_NONBLOCK); 
        if (fd < 0) { 
                perror("Unable to open device"); 
                return 1; 
        } 
        /* Get Raw Info */ 
        res = ioctl(fd, HIDIOCGRAWINFO, &info); 
        if (res < 0) { 
                perror("error while getting info from device"); 
        } else { 
                if (info.bustype != BUS_USB || 
                    info.vendor != USB_VENDOR_ID_LOGITECH || 
                    (info.product != USB_DEVICE_ID_UNIFYING_RECEIVER && 
                     info.product != USB_DEVICE_ID_UNIFYING_RECEIVER_2)) { 
                        errno = EPERM; 
                        perror("The given device is not a Logitech " 
                                "Unifying Receiver"); 
                        return 1; 
                } 
        } 
        /* Send the magic sequence to the Device */ 
        res = write(fd, magic_sequence, sizeof(magic_sequence)); 
        if (res < 0) { 
                printf("Error: %d\n", errno); 
                perror("write"); 
        } else if (res == sizeof(magic_sequence)) { 
                printf("The receiver is ready to pair a new device.\n" 
                "Switch your device on to pair it.\n"); 
        } else { 
                errno = ENOMEM; 
                printf("write: %d were written instead of %ld.\n", res, 
                        sizeof(magic_sequence)); 
                perror("write"); 
        } 
        close(fd); 
        return 0; 
} 
