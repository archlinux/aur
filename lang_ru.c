#include <stdio.h>
#define INVALID_ARG "Неверные аргуметы! Используйте '-h' для спраки.\n"
#define KEY_RECORD_IN_FILE "Ключ записан в файл: %s\n"
#define INCORRECT_FILE "Ошибка! Некорректный файл:'%s'\n"
#define NO_KEY_OR_KEYFILE "Отсутствует ключ или файл ключа!\n"
#define INVALID_KEY_FORMAT "Неверный формат ключа!\n"
#define FILE_NOT_FOUND "Файл '%s' отсутствует!\n"
#define DATA_DECRYPT "Данные из файла: %s успешно РАСШИФРОВАНЫ в файл: %s\n"
#define DATA_ENCRYPT "Данные из файла: %s успешно ЗАШИФРОВАНЫ в файл: %s\n"
#define FILE_DECRYPTION "Расшифровка файла...\n"
#define FILE_ENCRYPTION "Зашифровка файла...\n"
#define RECORD_DECRYPT_DATA "Запись расшифрованных данных...\n"
#define LOAD_IN_RAM "Загрузка файла '%s' в OЗУ...\n"
#define RECORD_ENCRYPT_DATA "Запись зашифрованных данных...\n"
#define MEMORY_ERROR "Файл слишком большой! Недостаточно памяти!"

void show_help()
{
    puts("Использование: \nTEAtool [входной файл] [выходной файл] [аргументы]\n");
    puts("Аргументы:"); 
    puts("-e [режим] Зашифровать файл в режиме 'speed' или 'normal'.");  
    puts("-d [режим] Расшифровать файл в режиме 'speed' или 'normal'.");   
    puts("   В режиме 'speed'(быстро), входной файл целиком загружается в ОЗУ.");
    puts("   В режиме 'normal'(нормально), входной файл загружается в ОЗУ частями.");  
    puts("-k [ключ] 128-битный ключ в шестнадцатиричном формате."); 
    puts("-K [файл ключа] Использовать ключ из файла ключа."); 
    puts("-r [ключ] [файл ключа].key Запись ключа в файл.");
    puts("-h Эта справка."); 
    puts("-a Об этой программе.\n");
}

void show_about()
{
    puts("\n");
    puts("-----------TEAtool-RUS-----------\n");
    printf("      )  (         Версия:     \n");
    printf("     (   ) )   1.7-стабильная  \n");
    printf("      ) ( (                    \n");
    printf("    _______)_      Автор:      \n");
    printf(" .-'---------|  turbocat2001   \n");
    printf("( C|/////////|                 \n");
    printf(" '-./////////| Тестер: rgimad  \n");
    printf("   '_________'                 \n");
    printf("   '-------'' Лицензия: GPLv3\n\n");
    printf("         Основано на:          \n");
    printf("  Tiny Encryption Algorithm. \n\n");
}


