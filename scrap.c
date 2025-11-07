
// --- EXPLANATION  --- //
// So like this works basicly with bunch of functions for some complexier things
// like save and load. Almost all variables are declared on the top of main loop
// the variables like x y and z are for something I didn't came up to name like
// I don't want it to be so long like golden_scrap_to_get so it's just z
// the x is for while (1) loop so its the main input so don't mess with that
// the y is for y/n when user is trying to reset for golden scraps
// other than that the variables are pretty straight forward so you shouldn't
// have problem with them. I'm trying to make the code super clean for other devs
// that like making the game themselfs. With that I'm kinda woried that the game
// would be basicly hacked with couple users seting the variables to int limits
// but I hope not also I hope you will don't use the DISCORD_TOKEN if you do than
// I'm cooked but what could happen that bad (I don't wanna even imagine it) I will
// don't make any security bout it I like when its raw and stuff so yea if you exploit
// it than fuck you but otherwise thanks for your time and I hope you will have great
// time trying to change my code. If you want personal help don't be scared of dming me
// on discord (_preclik) and you can join my discord server also if you want.



// I promise I will fix the code structure sometimes.
// Also note for future developers... If you don't wanna waste your time
// just probably dont fuck whit trying to figure it out yourself and ask
// preclik02

// with love --preclik02

// Hours spend here ~10

// Last thing done --> Made the program to create the or check the dir existing before saving ~/.scrap

//Always remember to compile with -lcurl

///////////////
///LYBRARIES///
///////////////
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <curl/curl.h>


///////////////
///Functions///
///////////////
void show_stats(char *username, int star, int scrap, double scrap_lvl, int scrap_lvl_cost, int star_cost, int gold_scrap) {
  printf("\n\nusername - %s\nstars - %d\nscrap - %d\nscrap per action - %lf\nscrap upgrade cost - %d\nstar cost - %d\ngold scrap - %d\n\n", username, star, scrap, scrap_lvl, scrap_lvl_cost, star_cost, gold_scrap);
}
void save_game(char *username, int star, int scrap, double scrap_lvl, int scrap_lvl_cost, int star_cost, int gold_scrap) {

  const char *home = getenv("HOME");

  if (!home) {
    printf("[+] Error while finding the home enviroment\n");
    return;
  }


  char path[1000];

  snprintf(path, sizeof(path), "%s/.scrap/001.txt", home);
  printf("[+] Trying to save the game\n");

  FILE *file = fopen(path, "w");

  if (!file) {
    printf("[+] Error opening file, please make sure you have folder .scrap and all needed files\n");
    return;
  }

  fprintf(file, "%s\n%d\n%d\n%lf\n%d\n%d\n%d", username, star, scrap, scrap_lvl, scrap_lvl_cost, star_cost, gold_scrap);

  fclose(file);

  printf("[+] File saved successfully\n");
}
void load_game(char *username, int *star, int *scrap, double *scrap_lvl, int *scrap_lvl_cost, int *star_cost, int *gold_scrap) {

  const char *home = getenv("HOME");

  if (!home) {
    printf("[+] Error while finding the home enviroment\n");
    return;
  }

  char path[1000];
  snprintf(path, sizeof(path), "%s/.scrap/001.txt", home);

  printf("[+] Trying to read from the save file\n");

  FILE *file = fopen(path, "r");

  if (!file) {
    printf("[+] Error while opening the save file, plese make sure you have the files as recommended\n");
    return;
  }

  fscanf(file, "%s\n%d\n%d\n%lf\n%d\n%d\n%d", username, star, scrap, scrap_lvl, scrap_lvl_cost, star_cost, gold_scrap);

  fclose(file);

  printf("[+] Save file loaded successfully\n");
}

void auto_scrap(int *scrap, double scrap_lvl) {

  int time;

  printf("[-] Time for how long will it give you scrap (per second) >> ");
  scanf("%d", &time);

  printf("[+] Starting auto scrap for %d seconds\n", time);

  for(int i = 1; i <= time; i ++) {
    printf("%d sec + %lf scrap\n\n", i, scrap_lvl);
    *scrap += scrap_lvl;
    sleep(1);
  }
  printf("[+] Time has passed, enjoy your scrap");
}

void flex(char *username, int star, int scrap, double scrap_lvl, int gold_scrap) {

  printf("\n[+] Flexing is that you will flex your stats on Discord\n");

  char MESSAGE[500];

  const char *WEBHOOK = "https://discord.com/api/webhooks/1434289688855842856/PglCXsQ5LMETyasgYH5GFoQLoW6lrWGCvKEJiVqMCE34o2zVwZwGVfdGKZ2bf0uw8DSH";

  printf("\nUsername --> %s", username);
  printf("\nStar(s) --> %d", star);
  printf("\nScrap --> %d", scrap);
  printf("\nSPA --> %lf", scrap_lvl);
  printf("\nGolden scrap(s) --> %d\n\n", gold_scrap);

  snprintf(MESSAGE, sizeof(MESSAGE), "{\"content\": \"\\nUsername --> %s\\nStar(s) --> %d\\nScrap --> %d\\nSPA --> %lf\\nGolden scrap(s) --> %d\"}", username, star, scrap, scrap_lvl, gold_scrap);

  CURL *curl = curl_easy_init();
  if (!curl) {
    fprintf(stderr, "\n[!] curl initialization failed\n");
    return;
  }

  struct curl_slist *headers = NULL;
  headers = curl_slist_append(headers, "Content-Type: application/json");

  curl_easy_setopt(curl, CURLOPT_URL, WEBHOOK);
  curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
  curl_easy_setopt(curl, CURLOPT_POSTFIELDS, MESSAGE);
  curl_easy_setopt(curl, CURLOPT_USERAGENT, "NullFlex/1.0");

  CURLcode res = curl_easy_perform(curl);
  if (res != CURLE_OK)
    fprintf(stderr, "[!] curl error: %s\n", curl_easy_strerror(res));
  else
    printf("\n[+] Stats sent successfully!\n");

  curl_slist_free_all(headers);
  curl_easy_cleanup(curl);
}

///////////////
///Main loop///
///////////////
int main() {

  char x[256];
  char username[256] = {0};

  double scrap_lvl = 1.0;

  int star = 0;
  int star_cost = 1000;
  int scrap = 0;
  int scrap_lvl_cost = 10;
  int gold_scrap = 0;


  while (1) {

    if (username[0] == '\0') {
      printf("\n[-] Username >> ");
      scanf("%255s", username);
    }

    printf("[-] Action >> ");
    scanf("%99s", x);

    if (strcmp(x, "help") == 0) {
      printf("\n\n[+] help\nscrap\nupgrades\nstats\nquit\nsave/load\nauto-scrap\nflex\nrestart\n\n[+] Read documentation for important info about commands\n\n");
    }

    else if (strcmp(x, "scrap") == 0) {
      printf("[+] +%lf scrap\n\n", scrap_lvl);
      scrap += scrap_lvl;
    }

    else if (strcmp(x, "upgrades") == 0) {

      char y[256];

      printf("[-] Upgrade (+1 scrap [scrap] - %d | +1 star [star] - %d) >> ", scrap_lvl_cost, star_cost);
      scanf("%99s", y);

      if (strcmp(y, "scrap") == 0) {

        if (scrap >= scrap_lvl_cost) {
          printf("[+] Sucessfully bought more scrap\n\n");
          scrap -= scrap_lvl_cost;
          scrap_lvl += 1;
          scrap_lvl_cost += 25;
        }

        else {
          printf("[+] You dont have enough scrap for upgrade\n\n");
        }
      }

      else if (strcmp(y, "star") == 0) {

        if (scrap >= star_cost) {
          printf("[+] sucessfully bought star\n\n");
          star += 1;
          scrap -= star_cost;
          star_cost += 1000;
          scrap_lvl *= 1.2;
        }

        else {
          printf("[+] Not enough scrap for a star\n\n");
        }
      }
    }
    else if (strcmp(x, "restart") == 0) {

      char y[10];

      int z = scrap / 5;

      printf("\n[+] By reseting your scrap will be 0 again\n");
      printf("[-] Do you want to reset (y/n) >> ");
      scanf("%9s", y);

      if (strcmp(y, "y") == 0) {
        scrap = 0;
        gold_scrap += z;
        printf("\n[+] Sucessfully got +%d gs enjoy\n", z);
      }

      else if (strcmp(y, "n") == 0) {
        printf("\n[+] Alright\n");
      }

      else {
        printf("\n[+] Wrong input\n");
      }
    }

    else if (strcmp(x, "auto-scrap") == 0) {
      auto_scrap(&scrap, scrap_lvl);
    }

    else if (strcmp(x, "stats") == 0) {
      show_stats(username, star, scrap, scrap_lvl, scrap_lvl_cost, star_cost, gold_scrap);
    }

    else if (strcmp(x, "save") == 0) {
      save_game(username, star, scrap, scrap_lvl, scrap_lvl_cost, star_cost, gold_scrap);
    }

    else if (strcmp(x, "load") == 0) {
      load_game(username, &star, &scrap, &scrap_lvl, &scrap_lvl_cost, &star_cost, &gold_scrap);
    }

    else if (strcmp(x, "flex") == 0) {
      flex(username, star, scrap, scrap_lvl, gold_scrap);
    }




    else if (strcmp(x, "quit") == 0) {
      printf("[+] Hope you saved it :D ");
      break;

    }
  }

  return 0;
}
