#ifndef GAME_OBJECTS_H
#define GAME_OBJECTS_H

#include <stdint.h>

// Define dimensions for various game objects
#define DINO_H 6             // Height of the dinosaur sprite
#define DINO_W 4             // Width of the dinosaur sprite
#define ENEMY_H 5            // Height of enemy sprites
#define ENEMY_W 4            // Width of enemy sprites
#define GROUND_H 3           // Height of ground sprite
#define GROUND_W 3           // Width of ground sprite
#define CLOUD_H 3            // Height of cloud sprite
#define CLOUD_W 4            // Width of cloud sprite
#define DIGIT_H 2            // Height of digit sprites (for score)
#define DIGIT_W 1            // Width of digit sprites (for score)
#define PHASE_H 3            // Height of phase indicator sprites
#define PHASE_W 2            // Width of phase indicator sprites

// Game constants
#define ENEMY_COUNT 2         // Maximum number of enemies
#define ENEMY_TYPES 5         // Number of different enemy types
#define ENEMY_MIN_DISTANCE 10 // Minimum distance between enemies
#define CLOUD_COUNT 5         // Number of clouds in the game
#define CLOUD_MIN_DISTANCE 5  // Minimum distance between clouds
#define DAY_LIGHT_TIME 10000  // Duration of daylight in milliseconds
#define CROUCH_TIME 275       // Duration of daylight in milliseconds

// Dinosaur sprites in different states represented as bitmaps
uint32_t idle_1[DINO_H * DINO_W] = {
    0x00000000, 0x4bb80000, 0x0000c708, 0x00000000,
    0x00000000, 0xffff3b08, 0x00037fff, 0x00000000,
    0x00000000, 0xfff4e6ff, 0x19ffffff, 0x00000000,
    0x00000000, 0x00000044, 0x13ffffe0, 0x00000012,
    0x00000000, 0x00000000, 0xfffeff00, 0x0000ffff,
    0x00000000, 0x00000000, 0xc0c08000, 0x000040c0,
};
uint32_t run_1[DINO_H * DINO_W] = {
    0x00000000, 0x2f180000, 0x0000c708, 0x00000000,
    0x00000000, 0xffff3b08, 0x00037fff, 0x00000000,
    0x00000000, 0xfff4e6ff, 0x19ffffff, 0x00000000,
    0x00000000, 0x00000044, 0x13ffffe0, 0x00000012,
    0x00000000, 0x00000000, 0xfffeff00, 0x0000ffff,
    0x00000000, 0x00000000, 0xc0c08000, 0x000040c0,
};
uint32_t run_1_r[DINO_H * DINO_W] = {
    0xffffffff, 0x2f5cffff, 0xffbfc708, 0xffffffff,
    0xffffffff, 0xffff7bee, 0xffe37fff, 0xffffffff,
    0xffffffff, 0xfff5eeff, 0x99ffffff, 0xfffffffc,
    0xffffffff, 0x3fffff5d, 0x13ffffe3, 0xfffff4d2,
    0xffffffff, 0xffffffff, 0xfffeff47, 0xffffffff,
    0xffffffff, 0xc0c0c0c0, 0xc0c08040, 0xffff40c0,
};
uint32_t run_2[DINO_H * DINO_W] = {
    0x00000000, 0x4bb80000, 0x00021308, 0x00000000,
    0x00000000, 0xffff3b08, 0x00037fff, 0x00000000,
    0x00000000, 0xfff4e6ff, 0x19ffffff, 0x00000000,
    0x00000000, 0x00000044, 0x13ffffe0, 0x00000012,
    0x00000000, 0x00000000, 0xfffeff00, 0x0000ffff,
    0x00000000, 0x00000000, 0xc0c08000, 0x000040c0,
};
uint32_t run_2_r[DINO_H * DINO_W] = {
    0xffffffff, 0x6bb8ffff, 0xffead3ee, 0xffffffff,
    0xffffffff, 0xffff7bee, 0xffe37fff, 0xffffffff,
    0xffffffff, 0xfff5eeff, 0x99ffffff, 0xfffffffc,
    0xffffffff, 0x3fffff5d, 0x13ffffe3, 0xfffff4d2,
    0xffffffff, 0xffffffff, 0xfffeff47, 0xffffffff,
    0xffffffff, 0xc0c0c0c0, 0xc0c08040, 0xffff40c0,
};
uint32_t death_1[DINO_H * DINO_W] = {
    0x00000000, 0x4bb80000, 0x0000c708, 0x00000000,
    0x00000000, 0xffff3b08, 0x00037fff, 0x00000000,
    0x00000000, 0xfff4e6ff, 0x19ffffff, 0x00000000,
    0x00000000, 0x00000044, 0x1bffffe0, 0x0000091b,
    0x00000000, 0x00000000, 0xf8d0ff00, 0x0000ffff,
    0x00000000, 0x00000000, 0xc0c08000, 0x000040c0,
};
uint32_t down_1[DINO_H * DINO_W] = {
    0x4bb80000, 0x18021300, 0x00000002, 0x00000000,
    0xff3b0800, 0xffffffff, 0x2f3f3b5f, 0x0000092d,
    0xfef6f73b, 0xffffffff, 0xfffdfef6, 0x0000f7ff,
    0x00000040, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000,
};
uint32_t down_1_r[DINO_H * DINO_W] = {
    0x6bb8ffff, 0x9c62d3e6, 0xffffffe2, 0xffffffff,
    0xff3beeff, 0xffffffff, 0x2f3f7b5f, 0xffffe92d,
    0xfef6f77b, 0xffffffff, 0xfffdfef6, 0xfffff7ff,
    0x7fffbf7f, 0x3f3f3f3f, 0x3f3f7fff, 0xffffbf3f,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
};
uint32_t down_2[DINO_H * DINO_W] = {
    0x12180000, 0x18004bb8, 0x00000002, 0x00000000,
    0xffbb0800, 0xffffffff, 0x2f3f3b5f, 0x0000092d,
    0xfef6f73b, 0xffffffff, 0xfffdfef6, 0x0000f7ff,
    0x00000040, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000,
};
uint32_t down_2_r[DINO_H * DINO_W] = {
    0x6bb8ffff, 0x9c62d3e6, 0xffffffe2, 0xffffffff,
    0xff3beeff, 0xffffffff, 0x2f3f7b5f, 0xffffe92d,
    0xfef6f77b, 0xffffffff, 0xfffdfef6, 0xfffff7ff,
    0x7fffbf7f, 0x3f3f3f3f, 0x3f3f7fff, 0xffffbf3f,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
};

// Enemy sprites represented as bitmaps
uint32_t pterodactyl_1[ENEMY_H * ENEMY_W] = {
    0x18000000, 0x00000001, 0x00000000, 0x00000000,
    0xb8000000, 0x09090b7f, 0x00000001, 0x00000000,
    0xbb080000, 0xf7ffffff, 0x0002d2f6, 0x00000000,
    0xc6fffee0, 0x00c0c0c0, 0x00000000, 0x00000000,
    0x00c00000, 0x00000000, 0x00000000, 0x00000000,
};
uint32_t pterodactyl_2[ENEMY_H * ENEMY_W] = {
    0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x09090908, 0x00000001, 0x00000000,
    0x3b080000, 0xf7ffffff, 0x0002d2f6, 0x00000000,
    0xc6fffee0, 0x00e6ffff, 0x00000000, 0x00000000,
    0x38c00000, 0x000040e6, 0x00000000, 0x00000000,
};
uint32_t cactus_1[ENEMY_H * ENEMY_W] = {
    0x00ffb800, 0x00000000, 0x00000000, 0x00000000,
    0x01ffbe19, 0x00000000, 0x00000000, 0x00000000,
    0xf8ffb8f6, 0x00000007, 0x00000000, 0x00000000,
    0x80f7b000, 0x00000040, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000,
};
uint32_t cactus_2[ENEMY_H * ENEMY_W] = {
    0x00ffb800, 0x00000000, 0x00000000, 0x00000000,
    0x0bffb800, 0x00000000, 0x00000000, 0x00000000,
    0xb8fffc38, 0x00000047, 0x00000000, 0x00000000,
    0x00f7b080, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000,
};
uint32_t cactus_3[ENEMY_H * ENEMY_W] = {
    0x01ffb800, 0x00000000, 0x00000000, 0x00000000,
    0xfcfffe3b, 0x00000007, 0x00000000, 0x00000000,
    0xb8ffb8ff, 0x00000047, 0x00000000, 0x00000000,
    0x00f7b0c0, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000,
};
uint32_t cactus_4[ENEMY_H * ENEMY_W] = {
    0x00ffb800, 0x00ffb800, 0x4fff0000, 0x00000000,
    0x01ffbe19, 0x0bffb800, 0xe7ffb718, 0x0000007f,
    0xf8ffb8f6, 0xb8fffc3f, 0x47ff47ff, 0x000000ff,
    0x80f7b000, 0x00f7b0c0, 0x46fe4080, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000,
};

// Ground sprites for generator representation as bitmaps
uint32_t ground_1[GROUND_H][GROUND_W] = {
    0x00021200, 0x00042400, 0x00000000,
    0x00021200, 0x00042400, 0x00000000,
    0xc0c0c0c0, 0x84221224, 0xc0c0c0c0,
};

// Cloud representation as bitmaps
uint32_t cloud_1[CLOUD_H * CLOUD_W] = {
    0x11010809, 0x12121212, 0x12121212, 0x1a121212,
    0x24c00000, 0x00408e14, 0x0a200000, 0x40841209,
    0x00000000, 0x60c00000, 0x40a43214, 0x00000000,
};
uint32_t cloud_1r[CLOUD_H * CLOUD_W] = {
    0xf7ffffff, 0xf6f6f6f6, 0xf6f6f6f6, 0xfef6f6f6,
    0x3fffffff, 0x00408f1f, 0x0a200000, 0xffbf1b09,
    0xffffffff, 0x7fffffff, 0xffbf3b1f, 0xffffffff,
};

// Digit representations for score display (0-9)
uint32_t digit_0[DIGIT_H * DIGIT_W] = {
    0x00000a08,
    0x0000a2a0,
};
uint32_t digit_1[DIGIT_H * DIGIT_W] = {
    0x00001800,
    0x0000b400,
};
uint32_t digit_2[DIGIT_H * DIGIT_W] = {
    0x00001218,
    0x00006210,
};
uint32_t digit_3[DIGIT_H * DIGIT_W] = {
    0x00000a10,
    0x00006290,
};
uint32_t digit_4[DIGIT_H * DIGIT_W] = {
    0x00001800,
    0x0000f0b0,
};
uint32_t digit_5[DIGIT_H * DIGIT_W] = {
    0x00000a10,
    0x000052b0,
};
uint32_t digit_6[DIGIT_H * DIGIT_W] = {
    0x00000a08,
    0x000052a0,
};
uint32_t digit_7[DIGIT_H * DIGIT_W] = {
    0x00000300,
    0x0000b210,
};
uint32_t digit_8[DIGIT_H * DIGIT_W] = {
    0x00000a08,
    0x00006220,
};
uint32_t digit_9[DIGIT_H * DIGIT_W] = {
    0x00000a10,
    0x0000e220,
};

// Moon/Sun Phase indicator representations
uint32_t phase_1[PHASE_H * PHASE_W] = {
    0x00c02718, 0x00000000,
    0x000000ff, 0x00000000,
    0x000956a0, 0x00000000,
};
uint32_t phase_2[PHASE_H * PHASE_W] = {
    0x00c43718, 0x00000000,
    0x000047ff, 0x00000000,
    0x000b76a0, 0x00000000,
};
uint32_t phase_3[PHASE_H * PHASE_W] = {
    0x00c63f18, 0x00000000,
    0x0000ffff, 0x00000000,
    0x000ff6a0, 0x00000000,
};
uint32_t phase_4[PHASE_H * PHASE_W] = {
    0xffff3f18, 0x0000033f,
    0xffffffff, 0x0000ffff,
    0xfffff6a0, 0x000044f6,
};
uint32_t phase_5[PHASE_H * PHASE_W] = {
    0xf0000000, 0x0000033f,
    0x00000000, 0x0000ffff,
    0x39000000, 0x000044f6,
};
uint32_t phase_6[PHASE_H * PHASE_W] = {
    0xe0000000, 0x0000033e,
    0x00000000, 0x0000ffb8,
    0x19000000, 0x000044b6,
};
uint32_t phase_7[PHASE_H * PHASE_W] = {
    0xc0000000, 0x0000033c,
    0x00000000, 0x0000ff00,
    0x09000000, 0x000044b2,
};

#endif //GAME_OBJECTS_H
