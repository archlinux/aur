/*
 * Google T-Rex Console Game - Main game logic
 * -----------------
 * A console-based game inspired by the Google Chrome T-Rex runner game.
 * Written in C, it uses multithreading to capture input and display game
 * visuals. This program involves a dinosaur character navigating obstacles
 * while tracking score, day/night cycle, and player actions.
 *
 * Dependencies:
 * - Requires POSIX-compliant libraries for terminal manipulation and multithreading.
 * - Must be run in a terminal that supports UTF-8 encoding and ANSI escape codes.
 *
 * Controls:
 * - Space/Enter/Arrow Up: Jump
 * - Arrow Down: Crouch
 * - R: Restart after game over in spectator
 *
 * Program Structure:
 * - Input Handling: A thread to capture user key presses in non-canonical mode.
 * - Game Rendering: Draws the ground, dinosaur, enemies, and other game elements.
 * - Game Logic: Controls movement, collision detection, and scoring.
 *
 * Note:
 * This game is for educational and entertainment purposes. 
 * Console-based display limitations may vary depending on the terminal used.
 * 
 * Author: Sanzhar Zhanalin
 * Date: 02.11.2024
 * Version: 1.0
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <locale.h>
#include <wchar.h>
#include <termios.h>
#include <pthread.h>
#include <sys/ioctl.h>
#include <stdint.h>
#include <string.h>
#include <sys/time.h>
#include "game_objects.h"
#include <math.h>
#include <signal.h>

// Global variables for game control and shared key handling
volatile uint8_t running = 1;       // Controls the main game loop
volatile uint8_t last_key = '\0';   // Stores the last key pressed
pthread_mutex_t key_mutex;          // Mutex for synchronizing key access
struct winsize w;                   // Terminal window size

// Enum for different enemy types
typedef enum {
    pterodactyl_type = 1,
    cactus_type_1 = 2,
    cactus_type_2 = 3,
    cactus_type_3 = 4,
    cactus_type_4 = 5,
} enemy_type;

// Enum for different game states
typedef enum {
    state_start = 0,
    state_running = 1,
    state_death = 2,
} game_states;

// Structure for the game state and data
struct game_t {
    // Screen and game variables
    int32_t height;            // Screen height
    int32_t weight;            // Screen width
    uint64_t size;             // Screen buffer size

    game_states state;         // Current game state
    uint64_t time_start;       // Game start time

    uint8_t space;             // Jump control
    uint8_t crouch;            // Crouch control

    uint64_t score;            // Player's score
    double_t speed;            // Game speed

    double_t x;                // Horizontal position of the player
    double_t y;                // Vertical position of the player
    int32_t dy;                // Vertical velocity

    uint64_t jump_stamp;       // Time jump_stamp for tracking jumps
    uint64_t crouch_stamp;     // Time jump_stamp for tracking crouchs

    uint64_t dn_new;           // Day-night transition flag
    uint8_t dn_mask;           // Mask for day-night effect
    uint64_t day_night;        // Timer for day-night cycle
    uint8_t moon_phase;        // Current moon phase

    uint8_t *screen;           // Screen buffer
    uint32_t *ground;          // Ground buffer
    uint64_t ground_size;      // Ground buffer size

    // Enemy data
    struct enemy_st {
        enemy_type e_type;     // Type of enemy
        double_t e_x;          // Enemy's x position
        int32_t e_y;           // Enemy's y position
    } enemies[ENEMY_COUNT];

    // Cloud data
    struct cloud_st {
        uint8_t c_type;        // Type of cloud
        double_t c_x;          // Cloud's x position
        int32_t c_y;           // Cloud's y position
        double_t c_speed;      // Cloud's speed
    } clouds[CLOUD_COUNT];
} game;


// Input thread to capture key presses
// Input thread to capture key presses
void *input_thread(void *_) {
    struct termios oldt, newt;
    tcgetattr(STDIN_FILENO, &oldt);           // Get current terminal settings
    newt = oldt;
    newt.c_lflag &= ~(ICANON | ECHO);         // Disable canonical mode and echo
    tcsetattr(STDIN_FILENO, TCSANOW, &newt);  // Apply new settings
    while (running) {
        const int32_t ch = getchar();         // Capture key press
        if (ch == EOF) continue;

        pthread_mutex_lock(&key_mutex);       // Lock mutex to update last_key
        last_key = ch;
        pthread_mutex_unlock(&key_mutex);
    }

    tcsetattr(STDIN_FILENO, TCSANOW, &oldt);  // Restore original settings
    return NULL;
}

// Function to get the current time in milliseconds
uint64_t get_time() {
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return tv.tv_sec * 1000 + tv.tv_usec / 1000;
}

// Function to render the game screen in the terminal
void print_dina() {
    system("clear");
    for (int y = game.height - 1; y >= 0; --y) {
        const uint8_t *screen_raw = game.screen + y * game.weight;
        for (int x = 0; x < w.ws_col; ++x) {
            wprintf(L"%lc", 0x2800 | (game.dn_mask ^ screen_raw[x]));
        }
        wprintf(L"\n");
    }
}

// Function to handle keyboard inputs and update game state
void keyboard_handler() {
    pthread_mutex_lock(&key_mutex);
    const uint8_t c = last_key;               // Get the last key pressed
    last_key = '\0';
    pthread_mutex_unlock(&key_mutex);

    uint8_t space = 0;
    uint8_t crouch = 0;

    // Map keys to actions
    switch (c) {
        case 10: case 32: case 65: space = 1; break;   // Jump
        case 66: crouch = 1; break;                    // Crouch
        case 114: game.state = state_start;            // Restart
        default: ;
    }
    if (game.state != state_running && (space || crouch)) {
        game.state = state_running;
        game.time_start = get_time();

        const int32_t center_x = game.weight - 1;
        const int32_t center_y = game.height - 1;
        game.day_night = (uint64_t) ((double) get_time() - sqrt(center_x * center_x + center_y * center_y) * 4);
        game.dn_new = 0;
        game.dn_mask = 0xFF;
        for (int e = 0; e < ENEMY_COUNT; ++e)
            game.enemies[e].e_type = 0;
    }
    game.space = space;
    game.crouch = crouch;
}

// Function to update the player's position and handle jumping logic
void player_movement() {
    const uint64_t score = (get_time() - game.time_start) / 50;
    double_t speed = 3.0 + (double_t) score / 600.0;
    if (speed > 7) speed = 7;

    if (game.state == state_start) speed = 3;
    if (game.state == state_death) {
        game.score = 0;
        game.speed = 0;
        return;
    }

    // Jump Calculations
    if (game.jump_stamp != 0) {
        double_t dt = (double_t) (score - game.jump_stamp) / 2.0;
        dt = (-dt + 8) * dt;
        game.y = dt > 0 ? dt : 0;
        if (game.crouch) game.jump_stamp -= 2;
    }

    // Crouch Calculations
    if (get_time() - game.crouch_stamp <= CROUCH_TIME) game.crouch = 1;
    else if (game.crouch_stamp == 0 && game.crouch) game.crouch_stamp = get_time();
    else game.crouch_stamp = 0;

    if (game.y == 0) game.jump_stamp = game.space ? score - 2 : 0;
    game.score = score;
    game.speed = speed;
}

void drawing_back(int32_t x, int32_t y, int32_t w, int32_t h, const uint32_t *background) {
    if (x >= game.weight || y >= game.height) return;
    if (w * 4 + x < 0 || h * 4 + y < 0) return;
    int p_x = 0;
    if (x < 0) {
        p_x = -x;
        x = 0;
    }
    register uint32_t d_y = game.height - y;
    register uint32_t d_x = game.weight - x;
    if (d_y > h) d_y = h;
    if (d_x > w * 4) d_x = w * 4;
    d_x -= p_x;

    const register uint32_t byx = d_x >> 2;
    const register uint32_t bix = byx << 2;
    d_x &= 3;
    for (register uint32_t _y = 0; _y < d_y; ++_y) {
        uint8_t *screen_raw = game.screen + (_y + y) * game.weight + x;
        const uint8_t *object_raw = (uint8_t *)(background + _y * w) + p_x;

        for (register uint32_t _x = 0; _x < byx; ++_x)
            ((uint32_t *)screen_raw)[_x] &= ((uint32_t *)object_raw)[_x];

        if (!d_x) continue;
        screen_raw += bix;
        object_raw += bix;
        for (register uint32_t _x = 0; _x < d_x; ++_x)
            screen_raw[_x] &= object_raw[_x];
    }
}
void drawing_objects(int32_t x, int32_t y, int32_t w, int32_t h, const uint32_t *object) {
    if (x >= game.weight || y >= game.height) return;
    if (w * 4 + x < 0 || h * 4 + y < 0) return;
    int p_x = 0;
    if (x < 0) {
        p_x = -x;
        x = 0;
    }
    register uint32_t d_y = game.height - y;
    register uint32_t d_x = game.weight - x;
    if (d_y > h) d_y = h;
    if (d_x > w * 4) d_x = w * 4;
    d_x -= p_x;

    const register uint32_t byx = d_x >> 2;
    const register uint32_t bix = byx << 2;
    d_x &= 3;
    for (register uint32_t _y = 0; _y < d_y; ++_y) {
        uint8_t *screen_raw = game.screen + (_y + y) * game.weight + x;
        const uint8_t *object_raw = (uint8_t *)(object + _y * w) + p_x;

        for (register uint32_t _x = 0; _x < byx; ++_x)
            ((uint32_t *)screen_raw)[_x] |= ((uint32_t *)object_raw)[_x];

        if (!d_x) continue;
        screen_raw += bix;
        object_raw += bix;
        for (register uint32_t _x = 0; _x < d_x; ++_x)
            screen_raw[_x] |= object_raw[_x];
    }
}


void draw_ground() {
    const uint64_t size = game.weight / 2 + (game.weight % 2 != 0) + 1;
    if (size > game.ground_size) {
        game.ground_size = size;
        game.ground = malloc(GROUND_H * size * sizeof(uint32_t));
        memset(game.ground, 0, GROUND_H * size * sizeof(uint32_t));
        for (int y = 0; y < GROUND_H; ++y) {
            uint32_t *_ground_raw = &game.ground[y * size];
            for (int x = 0; x < size; ++x) {
                _ground_raw[x] = ground_1[y][(rand() & 0x07) == 0x07 ? rand() & 1 : 2];  // NOLINT(*-msc50-cpp)
            }
        }
    }

    for (int y = 0; y < GROUND_H; ++y) {
        uint32_t *_ground_raw = &game.ground[y * size];
        const uint8_t *ground_raw = (uint8_t *)_ground_raw;
        uint8_t *screen_raw = game.screen + y * game.weight;

        for (int x = 0; x < size * 4 && x < game.weight; ++x) {
            screen_raw[x] |= ground_raw[(int32_t)(x + game.x) % (size * 4)];
        }
        _ground_raw[(int32_t)((double_t) size - 1 + game.x / 4) % size] = ground_1[y][(rand() & 0x07) == 0x07 ? rand() & 1 : 2];  // NOLINT(*-msc50-cpp)
    }
    game.x = (int32_t) ((int32_t)(game.x + game.speed) % (size * 4));
}
void draw_player() {
    const uint32_t *tile_dino = NULL;
    const uint32_t *tile_back = NULL;
    if (game.state != state_death) {
        if (game.crouch) tile_dino = game.score & 2 ? down_1 : down_2;
        else tile_dino = game.score & 2 ? run_1 : run_2;
        if (game.crouch) tile_back = game.score & 2 ? down_1_r : down_2_r;
        else tile_back = game.score & 2 ? run_1_r : run_2_r;
    } else tile_dino = death_1;

    if (tile_back != NULL) drawing_back(0, 1 + game.y, DINO_W, DINO_H, tile_back);
    drawing_objects(0, 1 + game.y, DINO_W, DINO_H, tile_dino);

}
uint32_t *get_enemy(const enemy_type type, const uint64_t step) {
    switch (type) {
        case pterodactyl_type:
            return step? pterodactyl_1 : pterodactyl_2;
        case cactus_type_1:
            return cactus_1;
        case cactus_type_2:
            return cactus_2;
        case cactus_type_3:
            return cactus_3;
        case cactus_type_4:
            return cactus_4;
        default: return NULL;
    }
}
void draw_enemy() {
    double_t mx = 0;
    for (int e = 0; e < ENEMY_COUNT; ++e)
        if (mx < game.enemies[e].e_x) mx = game.enemies[e].e_x;

    for (int e = 0; e < ENEMY_COUNT; ++e) {
        struct enemy_st *enemy = &game.enemies[e];
        if (enemy->e_type == 0) {
            const int32_t min_distance = (game.speed) * (ENEMY_MIN_DISTANCE + rand() % 25); // NOLINT(*-narrowing-conversions, *-msc50-cpp)
            enemy->e_type = rand() % ENEMY_TYPES + 1;  // NOLINT(*-msc50-cpp)
            enemy->e_x = game.weight;
            if (enemy->e_x < min_distance + mx) enemy->e_x = min_distance + mx;
            if (mx < enemy->e_x) mx = enemy->e_x;
            enemy->e_y = rand() & 1 && enemy->e_type == pterodactyl_type ? 5 : 1; // NOLINT(*-msc50-cpp)
        }

        const uint32_t *enemy_tile = get_enemy(enemy->e_type, game.score & 2);
        if (enemy_tile == NULL) return;

        drawing_objects(enemy->e_x, enemy->e_y, ENEMY_W, ENEMY_H, enemy_tile);
        enemy->e_x -= game.speed;
        if (enemy->e_x + ENEMY_W < 0) enemy->e_type = 0;
    }
}
void check_death() {
    if (game.state == state_start) return;
    const uint32_t *tile_dino = NULL;
    if (game.crouch) tile_dino = game.score & 2 ? down_1 : down_2;
    else tile_dino = game.score & 2 ? run_1 : run_2;

    for (int y = 0; y < DINO_H && y + 1 + game.y < game.height; ++y) {
        const uint32_t *dino_raw = &tile_dino[y * DINO_W];
        const uint32_t *screen_raw = (uint32_t *) (game.screen + (uint32_t)(y + game.y + 1) * game.weight);
        for (int x = 0; x < DINO_W; ++x) {
            if (screen_raw[x] & dino_raw[x]) {
                game.state = state_death;
                return;
            }
        }
    }
}
void draw_sky() {
    const uint32_t day_night = (get_time() - game.day_night) / 4;

    const int32_t center_x = game.weight - 1;
    const int32_t center_y = game.height - 1;

    if (sqrt(center_x * center_x + center_y * center_y) < day_night) {
        if (game.dn_new) game.dn_mask ^= 0xFF;
        if (game.dn_new && !game.dn_mask) game.moon_phase = (game.moon_phase + 1) % 7;
        game.dn_new = 0;
        return;
    }

    for (int32_t y = center_y; y >= 0; --y) {
        const int32_t dy = (center_y - y) * (center_y - y);
        uint8_t *screen_raw = game.screen + y * game.weight;
        for (int32_t x = center_x; x >= 0; --x) {
            if (sqrt((center_x - x) * (center_x - x) + dy) > day_night) break;
            screen_raw[x] ^= 0xFF;
        }
    }
}
void draw_clouds() {
    double_t mx = 0;
    for (int e = 0; e < CLOUD_COUNT; ++e)
        if (mx < game.clouds[e].c_x) mx = game.clouds[e].c_x;

    for (int e = 0; e < CLOUD_COUNT; ++e) {
        struct cloud_st *cloud = &game.clouds[e];
        if (cloud->c_type == 0) {
            const int32_t min_distance = game.speed * (CLOUD_MIN_DISTANCE + rand() % 10); // NOLINT(*-narrowing-conversions, *-msc50-cpp)
            cloud->c_type = 1;
            cloud->c_x = (float_t) game.weight;
            if (cloud->c_x < (float_t) min_distance + mx) cloud->c_x = (float_t) min_distance + mx;
            if (mx < cloud->c_x) mx = cloud->c_x;
	    if (game.height - CLOUD_H - 10 == 0) cloud->c_y = 10; 
            else cloud->c_y = 10 + rand() % (game.height - CLOUD_H - 10); // NOLINT(*-msc50-cpp)
            cloud->c_speed = 0.1 + rand() % 15 / 10.0; // NOLINT(*-msc50-cpp)
        }
        drawing_back(cloud->c_x, cloud->c_y, CLOUD_W, CLOUD_H, cloud_1r);
        drawing_objects(cloud->c_x, cloud->c_y, CLOUD_W, CLOUD_H, cloud_1);
        cloud->c_x -= cloud->c_speed;
        if (cloud->c_x + CLOUD_W * 4 < 1) cloud->c_type = 0;
    }
}
uint32_t *get_digit(const int type) {
    switch (type) {
        case 0:
            return digit_0;
        case 1:
            return digit_1;
        case 2:
            return digit_2;
        case 3:
            return digit_3;
        case 4:
            return digit_4;
        case 5:
            return digit_5;
        case 6:
            return digit_6;
        case 7:
            return digit_7;
        case 8:
            return digit_8;
        case 9:
            return digit_9;
        default: return NULL;
    }
}
void draw_score() {
    if (game.state == state_start) return;
    int32_t score = game.score;
    uint32_t X = game.weight - 4;
    while(score) {
        const uint32_t *tile = get_digit(score % 10);
        for (int y = 0; y < DIGIT_H; ++y) {
            uint16_t *screen_raw = (uint16_t *) (game.screen + (game.height - DIGIT_H + y) * game.weight);
            screen_raw[X / 2] |= tile[y * DIGIT_W];
        }
        X -= DIGIT_W * 2;
        score /= 10;
    }
}
uint32_t *get_phase(const int type) {
    switch (type) {
        case 0:
            return phase_1;
        case 1:
            return phase_2;
        case 2:
            return phase_3;
        case 3:
            return phase_4;
        case 4:
            return phase_5;
        case 5:
            return phase_6;
        case 6:
            return phase_7;
        default: return phase_4;
    }
}
void draw_sun_moon() {
    if ((get_time() - game.day_night) / 4 > DAY_LIGHT_TIME) {
        game.day_night = get_time();
        game.dn_new = 1;
    }
    const uint32_t dx = game.weight * (double_t)(get_time() - game.day_night) / DAY_LIGHT_TIME / 4;

    const uint32_t *phase = phase_4;
    if (!game.dn_mask) phase = get_phase(game.moon_phase);

    drawing_objects(game.weight - dx, game.height - PHASE_H - 2, PHASE_W, PHASE_H, phase);
}

void update_console_events() {
    // Get the current size of the terminal window
    if (ioctl(STDOUT_FILENO, TIOCGWINSZ, &w) == -1) return; // Handle potential error in ioctl
    if (w.ws_col == 0) return; // Avoid processing if no columns are available

    // Set game height and width based on terminal size, capping height at 25
    game.height = w.ws_row > 25 ? 25 : w.ws_row;
    game.weight = w.ws_col < 16 ? 16 : w.ws_col;
    game.height = game.height < 6 ? 6 : game.height;

    // Check if the new screen size exceeds the allocated size
    if (game.weight * game.height > game.size) {
        if (game.screen != NULL) free(game.screen); // Free previous screen buffer if it exists
        game.size = game.weight * game.height; // Update the game size to the new dimensions
        game.screen = malloc(game.size); // Allocate new memory for the screen buffer
    }
    
    // Initialize the screen buffer to zero
    memset(game.screen, 0, game.size);

    // Handle keyboard input from the player
    keyboard_handler();
    
    // Update player movement based on input
    player_movement();
    
    // Draw the enemy on the screen
    draw_enemy();
    
    // Check for player death conditions
    check_death();
    
    // Draw the ground on the screen
    draw_ground();
    
    // Draw the sun and moon (if applicable) on the screen
    draw_sun_moon();
    
    // Draw clouds on the screen
    draw_clouds();
    
    // Draw the player character on the screen
    draw_player();
    
    // Draw the current score on the screen
    draw_score();
    
    // Draw the background sky on the screen
    draw_sky();
}


// Drawing thread to simulate console drawing and game logic
void drawing_thread() {
    while (running) {
        usleep(32000);
        update_console_events();
        print_dina();
    }
}

// Show cursor when program is closed
void show_cursor(int signal) {
    wprintf(L"\e[?25h");
    running = 0;
}

// Main game loop and initialization
int main() {
    setlocale(LC_CTYPE, "");                    // Enable Unicode for the console
    
    signal(SIGINT, show_cursor);
    signal(SIGTERM, show_cursor);
    
    wprintf(L"\e[?25l");                        // Hide cursor in the terminal
    pthread_t input_tid;
    pthread_mutex_init(&key_mutex, NULL);

    pthread_create(&input_tid, NULL, input_thread, NULL); // Start input capture thread
    drawing_thread();                            // Start main game loop and drawing

    pthread_join(input_tid, NULL);               // Wait for the input thread to finish

    pthread_mutex_destroy(&key_mutex);           // Clean up mutex
    printf("Program exited.\n");
    return 0;
}
