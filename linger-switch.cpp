#include <pwd.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <cstdio>
#include <cstdlib>
#include <string>

void Help(const char* name) {
  fprintf(stderr, "Usage: %s [enable/disable]\n", name);
  exit(1);
}
void Err(const char* str) {
  perror(str);
  exit(1);
}

int main(int argc, char** argv) {
  if (setgid(0) < 0) Err("setgid");
  uid_t uid = getuid();
  if (setresuid(uid, uid, 0) < 0) Err("setuid");
  umask(0022);
  bool del = false, flag = false;
  if (argv == 0) Help("linger-switch");
  else if (argc != 2) Help(argv[0]);
  try {
    std::string mode_str(argv[1]);
    if (mode_str == "enable") {
      del = false;
    } else if (mode_str == "disable") {
      del = true;
    } else {
      Help(argv[0]);
    }
    struct passwd* pwd = getpwuid(uid);
    if (!pwd) Err("getpwuid");
    std::string path = std::string("/var/lib/systemd/linger/") + getpwuid(uid)->pw_name;
    if (setresuid(uid, 0, 0) < 0) Err("setuid");
    if (del) {
      unlink(path.c_str());
    } else {
      int fd = open(path.c_str(), O_WRONLY | O_CREAT | O_NOCTTY | O_NONBLOCK, 0644);
      if (fd >= 0) futimens(fd, nullptr);
      close(fd);
    }
  } catch (...) { Err(argv[0]); }
}
