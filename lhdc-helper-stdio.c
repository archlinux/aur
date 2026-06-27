#include <dlfcn.h>
#include <errno.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

typedef int32_t (*get_mem_req_fn)(uint32_t, uint32_t *);
typedef int32_t (*get_handle_fn)(uint32_t, void *, uint32_t);
typedef int32_t (*init_encoder_fn)(void *, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t);
typedef int32_t (*get_block_size_fn)(void *, uint32_t *);
typedef int32_t (*enc_process_fn)(void *, void *, uint32_t, uint8_t *, uint32_t, uint32_t *, uint32_t *);

struct frame_header {
    uint32_t magic;
    uint32_t payload_bytes;
    uint32_t frame_count;
    uint32_t status;
};

static void *sym(void *lib, const char *name) {
    void *p = dlsym(lib, name);
    if (!p) {
        fprintf(stderr, "missing %s: %s\n", name, dlerror());
        exit(2);
    }
    return p;
}

static int read_full(int fd, void *buf, size_t len) {
    uint8_t *p = buf;
    while (len > 0) {
        ssize_t n = read(fd, p, len);
        if (n == 0)
            return 0;
        if (n < 0) {
            if (errno == EINTR)
                continue;
            return -1;
        }
        p += n;
        len -= (size_t)n;
    }
    return 1;
}

static int write_full(int fd, const void *buf, size_t len) {
    const uint8_t *p = buf;
    while (len > 0) {
        ssize_t n = write(fd, p, len);
        if (n < 0) {
            if (errno == EINTR)
                continue;
            return -1;
        }
        p += n;
        len -= (size_t)n;
    }
    return 0;
}

static uint32_t env_u32(const char *name, uint32_t fallback) {
    const char *value = getenv(name);
    if (!value || !*value)
        return fallback;
    char *end = NULL;
    unsigned long parsed = strtoul(value, &end, 0);
    if (end == value || *end != '\0')
        return fallback;
    return (uint32_t)parsed;
}

int main(int argc, char **argv) {
    const char *path = argc > 1 ? argv[1] : "liblhdcv5.so";
    void *lib = dlopen(path, RTLD_NOW);
    if (!lib) {
        fprintf(stderr, "dlopen failed: %s\n", dlerror());
        return 1;
    }

    get_mem_req_fn get_mem_req = sym(lib, "lhdcv5_util_get_mem_req");
    get_handle_fn get_handle = sym(lib, "lhdcv5_util_get_handle");
    init_encoder_fn init_encoder = sym(lib, "lhdcv5_util_init_encoder");
    get_block_size_fn get_block_size = sym(lib, "lhdcv5_util_get_block_Size");
    enc_process_fn enc_process = sym(lib, "lhdcv5_util_enc_process");

    uint32_t mem_req = 0;
    if (get_mem_req(1, &mem_req) != 0 || mem_req == 0)
        return 3;
    void *handle = calloc(1, mem_req);
    if (!handle)
        return 4;
    if (get_handle(1, handle, mem_req) != 0)
        return 5;
    uint32_t bitrate_index = env_u32("LHDCV5_BITRATE_INDEX", 7);
    uint32_t mtu = env_u32("LHDCV5_MTU", 660);
    if (init_encoder(handle, 48000, 16, bitrate_index, 50, mtu, 10, 0) != 0)
        return 6;

    uint32_t block_size = 0;
    if (get_block_size(handle, &block_size) != 0 || block_size == 0)
        return 7;

    const uint32_t pcm_bytes = block_size * 2 * 2;
    uint8_t *pcm = malloc(pcm_bytes);
    uint8_t *out = malloc(8192);
    if (!pcm || !out)
        return 8;

    for (;;) {
        int rr = read_full(STDIN_FILENO, pcm, pcm_bytes);
        if (rr == 0)
            break;
        if (rr < 0)
            return 9;

        uint32_t written = 0;
        uint32_t frames = 0;
        int32_t ret = enc_process(handle, pcm, pcm_bytes, out, 8192, &written, &frames);
        struct frame_header h = {
            .magic = 0x3543484c, /* LH C5, little endian marker */
            .payload_bytes = written,
            .frame_count = frames,
            .status = (uint32_t)ret,
        };
        if (write_full(STDOUT_FILENO, &h, sizeof(h)) != 0)
            return 10;
        if (ret == 0 && written > 0 && write_full(STDOUT_FILENO, out, written) != 0)
            return 11;
    }

    return 0;
}
