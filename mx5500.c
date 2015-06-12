/*  mx5500-set
 *  Tool to control the extra features of the Logitech MX 5500 bluetooth keyboard in hci mod based on Hidraw
 *
 *  Copyright (c) 2013 Julian Sparber <julian@sparber.net>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */

#include "mx5500.h"

int main(int argc, char *argv[]){
	int fd;
	/* Open the Device. In real life,
	don't use a hard coded path; use libudev instead. */
  printf("Used device: %s\n",argv[argc-1]);
	fd = open(argv[argc-1], O_RDWR);
	/*if (!open_device(fd)){*/
	if (!open_device(fd)){
		if ( argc > 1 ){
			switch (*(argv[1]+1)){
				case 't':
						printf("Set time...\n");
						set_time(fd);
						printf("Done.\n");
						break;
				case 'b':
						printf("Send beep cmd...\n");
						beep(fd);
						printf("Done.\n");
						break;
				case 'u':
						printf("Set Temp Unit and Time Mode...\n");
						if ( argc > 3 &&
						(*argv[2] == 'c' || *argv[2] == 'f' ) &&
						(*argv[3] == 'h' || *argv[3] == 'H' )){
							set_temp_unit(fd, *(argv[2]), *(argv[3]));
							printf("Done.\n");
						}
						else{
							no_arg();
						}	
						break;
				default:
						no_arg();
						break;
			}
		}
		else {
			no_arg();
		}
		close(fd);
	}
	else
		no_arg();
	return 0;
}

/* Send a Report to the Device */
/* Report Number is always the first element*/

/*Sends beep comand to the keyboard*/
int beep(int fd){
	int res;
	/*const char beep1[] = { 0x10, 0x01, 0x81, 0x50, 0x00, 0x00, 0x00 };*/
	const char beep2[] = { 0x10, 0x01, 0x80, 0x50, 0x02, 0x00, 0x00 };
	
	res = write(fd, beep2, 7);
	if (res < 0) {
		printf("Error: %d\n", errno);
		   	
		perror("write");
	}
	return res;
}


/*changes temp and Time unit*/
int set_temp_unit(int fd, char unit, char mode){
	int res;
	/*char tempunit1[] = { 0x10, 0x01, 0x81, 0x30, 0x00, 0x00, 0x00 };*/
	char time_temp[] = { 0x10, 0x01, 0x80, 0x30, 0xDC, 0x00, 0x00 };

	/* 0x00 for °C and 0x01 for °F*/
	if ( unit != 'f' )
		time_temp[6] = 0x00;
	else
		time_temp[6] = 0x01;
	
	/* 0xDC for 24h and 0xDB for 12h*/
	if ( mode != 'h' )
		time_temp[4] = 0xDC;
	else
		time_temp[4] = 0xDB;
		
	res = write(fd, time_temp, 7);
	if (res < 0) {
		printf("Error: %d\n", errno);
		perror("write");
	}
	return res;
}

/*set time to system time*/
int set_time(int fd){
	int res;
														/*mday  mon*/
	char daymonth[] = 	{ 0x10, 0x01, 0x80, 0x32, 0x00, 0x00, 0x00 };
														/*min hour*/
	char hourminute[] = { 0x10, 0x01, 0x80, 0x31, 0x19, 0x00, 0x00 };
												 /*year 0x00 is 2000*/
	char year[] = 		{ 0x10, 0x01, 0x80, 0x33, 0x00, 0x00, 0x00 };

	time_t mytime = 0;
	struct tm mytm;
	mytime = time(NULL);
	localtime_r(&mytime, &mytm);

	 /*Day*/
	daymonth[5] = mytm.tm_mday;
	/*Month*/
	daymonth[6] = mytm.tm_mon;
	/*year*/
	year[4] = mytm.tm_year - 100; /*y3k bug*/
	/*min*/
	hourminute[5] = mytm.tm_min;;
	/*hours*/
	hourminute[6] = mytm.tm_hour;
	/*Write to keyboard*/
	res = write(fd, daymonth, 7);
	res += write(fd, hourminute, 7);
	res += write(fd, year, 7);
  	
  	return res;
}

/*Open the device*/
int open_device(int fd){
	int res;
	char buf[256];
	struct hidraw_report_descriptor rpt_desc;
	struct hidraw_devinfo info;

	if (fd < 0) {
		perror("Unable to open device");
		res = 1;
	}
	else {
		memset(&rpt_desc, 0x0, sizeof(rpt_desc));
		memset(&info, 0x0, sizeof(info));
		memset(buf, 0x0, sizeof(buf));

		/* Get Raw Name */
		res = ioctl(fd, HIDIOCGRAWNAME(256), buf);
		if (res < 0)
			perror("HIDIOCGRAWNAME");
		else
			printf("Raw Name: %s\n", buf);

		/* Get Physical Location */
		res = ioctl(fd, HIDIOCGRAWPHYS(256), buf);
		if (res < 0)
			perror("HIDIOCGRAWPHYS");
		else
			printf("Raw Phys: %s\n", buf);

		/* Get Raw Info */
		res = ioctl(fd, HIDIOCGRAWINFO, &info);
		if (res < 0) {
			perror("HIDIOCGRAWINFO");
		}
		else {
			printf("Raw Info:\n");
			printf("\tbustype: %d (%s)\n",
			        info.bustype, bus_str(info.bustype));
			printf("\tvendor: 0x%04hx\n", info.vendor);
			printf("\tproduct: 0x%04hx\n", info.product);
		}
		res = 0;
	}
	return res;
}

const char *bus_str(int bus){
	switch (bus) {
	case BUS_USB:
		    return "USB";
		    break;
	case BUS_HIL:
		    return "HIL";
		    break;
	case BUS_BLUETOOTH:
		    return "Bluetooth";
		    break;
	case BUS_VIRTUAL:
		    return "Virtual";
		    break;
	default:
		    return "Other";
		    break;
	}
}

int no_arg(){
	printf("You have to enter as last argument the device (like /dev/hidraw1)\nOperation argument:\n\t-b -> for beep\n\t-t -> sets time to localtime\n\t-u -> set Temp Unit (<f> or <c>) and Time Mode (<h> or <H>)\n\tExample: -u c H /dev/hidraw1\n");
	return 0;
}
