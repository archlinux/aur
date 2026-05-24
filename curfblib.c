#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"

#include "curfblib.h"

#include <fcntl.h>
#include <linux/fb.h>
#include <pthread.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <unistd.h>

/* =========================
   STATE
========================= */

static int fb_fd = -1;
static int mouse_fd = -1;

static struct fb_var_screeninfo vinfo;
static struct fb_fix_screeninfo finfo;

static unsigned char *fbp = NULL;

static volatile int running = 1;

/* cursor position */
float x = 300.0f;
float y = 200.0f;

static int last_x = 300;
static int last_y = 200;

/* smoothed */
static float sx = 300.0f;
static float sy = 200.0f;

/* image */
static unsigned char *cursor_img = NULL;
static int cursor_w, cursor_h, cursor_channels;

/* scale */
static float scale = 0.05f;
static int sw, sh;

/* backup buffer */
static unsigned int *backup = NULL;

/* sync */
static pthread_mutex_t input_lock = PTHREAD_MUTEX_INITIALIZER;
static pthread_mutex_t render_lock = PTHREAD_MUTEX_INITIALIZER;

/* =========================
   SIGNAL
========================= */

static void sig_handler(int sig) {
    (void)sig;
    running = 0;
}

/* =========================
   PIXEL
========================= */

static inline void put_pixel(int px, int py, unsigned int color) {

    if (px < 0 || py < 0 ||
        px >= (int)vinfo.xres || py >= (int)vinfo.yres)
        return;

    long loc =
        (px + vinfo.xoffset) * 4 +
        (py + vinfo.yoffset) * finfo.line_length;

    *(unsigned int *)(fbp + loc) = color;
}

/* =========================
   CURSOR DRAW
========================= */

static void draw_cursor(int cx, int cy) {

    for (int py = 0; py < sh; py++) {
        for (int px = 0; px < sw; px++) {

            int src_x = (int)(px / scale);
            int src_y = (int)(py / scale);

            int i = (src_y * cursor_w + src_x) * 4;

            unsigned char r = cursor_img[i + 0];
            unsigned char g = cursor_img[i + 1];
            unsigned char b = cursor_img[i + 2];
            unsigned char a = cursor_img[i + 3];

            if (a < 10)
                continue;

            unsigned int color =
                (r << 16) | (g << 8) | b;

            put_pixel(cx + px, cy + py, color);
        }
    }
}

/* =========================
   BACKUP / RESTORE
========================= */

static void save_area(int cx, int cy) {

    for (int py = 0; py < sh; py++) {
        for (int px = 0; px < sw; px++) {

            int sxp = cx + px;
            int syp = cy + py;

            long loc =
                (sxp + vinfo.xoffset) * 4 +
                (syp + vinfo.yoffset) * finfo.line_length;

            backup[py * sw + px] =
                *(unsigned int *)(fbp + loc);
        }
    }
}

static void restore_area(int cx, int cy) {

    for (int py = 0; py < sh; py++) {
        for (int px = 0; px < sw; px++) {

            int sxp = cx + px;
            int syp = cy + py;

            long loc =
                (sxp + vinfo.xoffset) * 4 +
                (syp + vinfo.yoffset) * finfo.line_length;

            *(unsigned int *)(fbp + loc) =
                backup[py * sw + px];
        }
    }
}

/* =========================
   INPUT THREAD
========================= */

static void *mouse_loop(void *arg) {

    (void)arg;

    unsigned char data[3];
    const float alpha = 0.25f;

    while (running) {

        if (read(mouse_fd, data, 3) > 0) {

            float dx = (signed char)data[1];
            float dy = (signed char)data[2];

            pthread_mutex_lock(&input_lock);

            x += dx;
            y -= dy;

            sx = sx * (1.0f - alpha) + x * alpha;
            sy = sy * (1.0f - alpha) + y * alpha;

            x = sx;
            y = sy;

            pthread_mutex_unlock(&input_lock);
        }
    }

    return NULL;
}

/* =========================
   INIT
========================= */

int curfb_init() {

    signal(SIGINT, sig_handler);
    signal(SIGTERM, sig_handler);

    fb_fd = open("/dev/fb0", O_RDWR);
    if (fb_fd < 0) {
        perror("fb0");
        return -1;
    }

    mouse_fd = open("/dev/input/mice", O_RDONLY);
    if (mouse_fd < 0) {
        perror("mouse");
        return -1;
    }

    ioctl(fb_fd, FBIOGET_VSCREENINFO, &vinfo);
    ioctl(fb_fd, FBIOGET_FSCREENINFO, &finfo);

    fbp = mmap(NULL,
               finfo.smem_len,
               PROT_READ | PROT_WRITE,
               MAP_SHARED,
               fb_fd,
               0);

    if (fbp == MAP_FAILED)
        return -1;

    char path[512];
    snprintf(path, sizeof(path),
         "/usr/share/cursorfb/cursor.png");

    cursor_img = stbi_load(path,
                           &cursor_w,
                           &cursor_h,
                           &cursor_channels,
                           4);

    if (!cursor_img) {
        printf("cursorfb: failed to load cursor.png\n");
        return -1;
    }

    sw = (int)(cursor_w * scale);
    sh = (int)(cursor_h * scale);

    backup = malloc(sw * sh * sizeof(unsigned int));

    return 0;
}

/* =========================
   LOOP (FIXED ATOMIC FRAME)
========================= */

void curfb_loop() {

    pthread_t t;
    pthread_create(&t, NULL, mouse_loop, NULL);

    float px, py;
    float nx, ny;

    pthread_mutex_lock(&input_lock);
    px = x;
    py = y;
    pthread_mutex_unlock(&input_lock);

    save_area((int)px, (int)py);

    while (running) {

        pthread_mutex_lock(&input_lock);
        nx = x;
        ny = y;
        pthread_mutex_unlock(&input_lock);

        last_x = (int)px;
        last_y = (int)py;

        /* clamp */
        if (nx < 0) nx = 0;
        if (ny < 0) ny = 0;
        if (nx > vinfo.xres - sw) nx = vinfo.xres - sw;
        if (ny > vinfo.yres - sh) ny = vinfo.yres - sh;

        pthread_mutex_lock(&render_lock);

        restore_area((int)px, (int)py);

        px = nx;
        py = ny;

        save_area((int)px, (int)py);
        draw_cursor((int)px, (int)py);

        pthread_mutex_unlock(&render_lock);

        usleep(3000);
    }

    restore_area((int)px, (int)py);

    pthread_join(t, NULL);
}

/* =========================
   SHUTDOWN
========================= */

void curfb_shutdown() {

    if (backup)
        free(backup);

    if (cursor_img)
        stbi_image_free(cursor_img);

    if (fbp && fbp != MAP_FAILED)
        munmap(fbp, finfo.smem_len);

    if (fb_fd >= 0)
        close(fb_fd);

    if (mouse_fd >= 0)
        close(mouse_fd);
}

/* =========================
    CLEAR
========================= */

void curfb_clear() {
    restore_area(last_x, last_y);
    cursor_shutdown();
    return 0;
}