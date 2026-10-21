#include <winsock2.h>
#include <afunix.h>
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static const char *g_pipe;

typedef struct {
  SOCKET s;
  HANDLE h;
} pump_t;

/* pipe -> client socket */
static DWORD WINAPI up_stream(LPVOID arg) {
  pump_t *p = (pump_t *)arg;
  char buf[65536];
  DWORD n = 0;
  while (ReadFile(p->h, buf, sizeof buf, &n, NULL) && n > 0) {
    int sent = 0;
    while (sent < (int)n) {
      int r = send(p->s, buf + sent, (int)n - sent, 0);
      if (r == SOCKET_ERROR) return 0;
      sent += r;
    }
  }
  shutdown(p->s, SD_SEND);
  return 0;
}

/* one accepted client: give it its own named pipe instance */
static DWORD WINAPI handle_conn(LPVOID arg) {
  SOCKET s = (SOCKET)(ULONG_PTR)arg;
  HANDLE h = INVALID_HANDLE_VALUE;
  for (int i = 0; i < 200; i++) {
    h = CreateFileA(g_pipe, GENERIC_READ | GENERIC_WRITE, 0, NULL, OPEN_EXISTING, 0, NULL);
    if (h != INVALID_HANDLE_VALUE) break;
    WaitNamedPipeA(g_pipe, 100);
    Sleep(50);
  }
  if (h == INVALID_HANDLE_VALUE) {
    closesocket(s);
    return 0;
  }

  pump_t p;
  p.s = s;
  p.h = h;
  HANDLE up = CreateThread(NULL, 0, up_stream, &p, 0, NULL);

  char buf[65536];
  for (;;) {
    int r = recv(s, buf, sizeof buf, 0);
    if (r <= 0) break;
    DWORD written = 0;
    if (!WriteFile(h, buf, (DWORD)r, &written, NULL) || written != (DWORD)r) break;
  }

  /* closing the pipe unblocks the reader thread */
  CloseHandle(h);
  if (up) {
    WaitForSingleObject(up, 1000);
    CloseHandle(up);
  }
  closesocket(s);
  return 0;
}

int main(int argc, char **argv) {
  WSADATA w;
  if (WSAStartup(MAKEWORD(2, 2), &w) != 0) return 1;
  if (argc < 3) {
    fprintf(stderr, "usage: %s <unix_socket_path> <pipe_path>\n", argv[0]);
    return 2;
  }
  const char *sock_path = argv[1];
  g_pipe = argv[2];

  DeleteFileA(sock_path);

  SOCKET ls = socket(AF_UNIX, SOCK_STREAM, 0);
  if (ls == INVALID_SOCKET) {
    fprintf(stderr, "bridge: socket(AF_UNIX) failed err=%d\n", WSAGetLastError());
    return 3;
  }
  struct sockaddr_un a;
  memset(&a, 0, sizeof a);
  a.sun_family = AF_UNIX;
  strncpy(a.sun_path, sock_path, sizeof(a.sun_path) - 1);
  if (bind(ls, (struct sockaddr *)&a, sizeof a) != 0) {
    fprintf(stderr, "bridge: bind(%s) failed err=%d\n", sock_path, WSAGetLastError());
    return 4;
  }
  if (listen(ls, 128) != 0) {
    fprintf(stderr, "bridge: listen failed err=%d\n", WSAGetLastError());
    return 5;
  }
  fprintf(stderr, "bridge: listening on %s -> %s\n", sock_path, g_pipe);
  fflush(stderr);

  for (;;) {
    SOCKET c = accept(ls, NULL, NULL);
    if (c == INVALID_SOCKET) {
      Sleep(50);
      continue;
    }
    HANDLE t = CreateThread(NULL, 0, handle_conn, (LPVOID)(ULONG_PTR)c, 0, NULL);
    if (t) CloseHandle(t);
    else handle_conn((LPVOID)(ULONG_PTR)c);
  }
  return 0;
}
