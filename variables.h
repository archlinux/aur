	int PacmanInit();
	int PacmanDeinit();
	int IsPackageInstalled(char *);
	int IsPackageInCache(char *);
	int IsPackageInAur(char *);
	int CheckDowngradePossibility(char *);
	void ReadPacmanLog();
	int ReadArm(char *);
	int IsPackageInArm(char *, char *);
	int DowngradePackage(char *);
	int GetChoiseForPackage(char *);
 
	alpm_handle_t *alpm_handle;
	alpm_db_t *db_local;
	alpm_pkg_t *pkg;
	char *dbpath, *tmpchar;
	char tmp_string[200], package_number[2];
	char install_command[300]; // Команда для установки
	char install_version[30]; // Версия пакета для установки
	const char *installed_pkg_ver;  // Текущая установленная версия
	long int pacmanlog_length;
	FILE *pFile, *pFile2;

	struct packs{ // -- Действия с пакетами из логов пакмана
		char name[40]; // название пакета
		char date[10]; // дата операции
		char time[20]; // время операции
		char action[20]; // название операции (upgraded, installed, removed)
		char cur_version[50]; // предыдущая версия
		char prev_version[50]; // предыдущая версия
	} *pkgs;
	//struct packs *pkgs;

	struct arm_packs{ // -- список пакетов в ARM для вывода юзеру
		char full_path[300]; // полный адрес до пакета
		char version[50]; // Version of package
		char name[50]; // Name of package
		char repository[20]; // Repository of package
		char link[100]; //Link for download
		char pkg_release[5]; //Package release
	} *arm_pkgs;
	//struct arm_packs *arm_pkgs;

	struct curl_MemoryStruct {
		char *memory;
		size_t size;
	};
	struct curl_MemoryStruct chunk;
	CURL *curl;
	CURLcode result;

	int pkg_never_upgraded, ret, loglines_counter;
	int pkgs_in_arm, tmpint;
	int debug, show_list, quiet_downgrade;
