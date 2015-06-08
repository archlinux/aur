#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <alpm.h>
#include <alpm_list.h>
#include <curl/curl.h>
#include "cJSON.h"

#define MAX_PKGS_FROM_ARM_FOR_USER 30
#define VERSION "1.8.0-2"

#include "variables.h"
#include "Interface.h"
#include "Actions.h"
 

int main(int argc, char **argv) {
	char *package;
	int param;
	int quiet_downgrade=show_list=0, list_downgrade=0;

	if (argc==2) package = argv[1];
	else if (argc==3) package = argv[2];
	else { ShowHelpWindow(); return 0; }
	while ((param = getopt (argc, argv, "q:hl:")) != -1)
		switch (param) {
			case 'q':{ // Quiet downgrade (test option)
				quiet_downgrade = 1;
				package = optarg;
				break;
			}
			case 'l':{ // Show list of possible packages for downgrade
				show_list = 1;
				package = optarg;
				break;
			}
			case 'h':{ // help
				ShowHelpWindow();
				return 0;
			}
		}
	///////////////////////////// Show possible packages list when downgrade
	if (show_list) {
		
		int pac_num;
		printf ("\033[1;%dm Downgrade package: %s \033[0m \n", 31, package);
		show_list = show_list;
		int ret = GetChoiseForPackage(package);
		if (ret<0) { PacmanDeinit(); return 0; }
		
		if (!strcmp(package_number,"d")) pac_num = tmpint;
		else if (!strcmp(package_number,"q")) return 0;
		else pac_num = atoi(package_number);
		strcpy(install_command,"sudo pacman -U "); strcat(install_command, arm_pkgs[pac_num].link);
		system(install_command);
	}
	//////////////////////////// Downgrade single package
	else if (package) {
		int ispacmaninit = PacmanInit();
	    if (ispacmaninit) {
			if(!quiet_downgrade) printf("Pacman not initialized! Interrupted\n");
			return 1;
		}
		if(!quiet_downgrade) printf ("\033[1;%dm Downgrade package: %s \033[0m \n", 31, package);
		ret = CheckDowngradePossibility(package);
		if (ret<0) { PacmanDeinit(); return 0; }
		if (!quiet_downgrade) printf ("Installed version: %s\n",installed_pkg_ver);
		int down_result = DowngradePackage(package);
	}
	PacmanDeinit();
	return 0;	
}
