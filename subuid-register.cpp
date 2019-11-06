#include <pwd.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <cstdio>
#include <cstdint>
#include <cstdlib>
#include <cinttypes>
#include <set>
#include <string>
#include <fstream>

const uint64_t kStart = 1 << 29, kRange = 1 << 16, kNum = 1 << 14;

struct Range {
  int64_t l, len;
  bool operator<(const Range& x) const { return l < x.l; }
};

void Help(const char* name) {
  fprintf(stderr, "Usage: %s [-q]\n", name);
  exit(1);
}
void Err(const char* str) {
  perror(str);
  exit(1);
}
void ErrStr(const char* str) {
  fprintf(stderr, "%s\n", str);
  exit(1);
}

uint64_t Hash(uint64_t a, uint64_t b) {
  static const uint64_t table[3] = {0x9e3779b185ebca87, 0xc2b2ae3d27d4eb4f, 0x165667b19e3779f9};
  auto Mix = [](uint64_t a, uint64_t b) {
    a += b * table[1];
    a = (a << 31) | (a >> 33);
    return a * table[0];
  };
  uint64_t v1 = Mix(-table[0], a);
  uint64_t v2 = Mix(table[1], b);
  uint64_t ret = ((v1 << 18) | (v1 >> 46)) + ((v2 << 7) | (v2 >> 57));
  ret ^= ret >> 33;
  ret *= table[1];
  ret ^= ret >> 29;
  ret *= table[2];
  ret ^= ret >> 32;
  return ret;
}

Range LoadFile(const std::string& filename, std::set<Range>& st,
               const std::string& username, bool query) {
  std::ifstream fin(filename);
  std::string ln;
  while (std::getline(fin, ln)) {
    size_t pos1 = ln.find(':');
    if (pos1 == std::string::npos) return {-2, -2};
    size_t pos2 = ln.find(':', pos1 + 1);
    if (pos2 == std::string::npos) return {-2, -2};
    if (ln.find(':', pos2 + 1) != std::string::npos) return {-2, -2};
    Range now;
    try {
      now.l = std::stoll(ln.substr(pos1 + 1, pos2 - pos1 - 1));
      now.len = std::stoll(ln.substr(pos2 + 1));
    } catch (...) {
      return {-2, -2};
    }
    if (ln.substr(0, pos1) == username) return now;
    if (!query) st.insert(now);
  }
  return {-1, -1};
}

void CheckAndInsert(uid_t uid, const std::string& item,
                    const std::string& username, int fd) {
  std::set<Range> mp;
  Range rg = LoadFile("/etc/sub" + item, mp, username, false);
  if (rg.l == -2) ErrStr(("Parsing error in /etc/sub" + item).c_str());
  if (rg.l != -1) {
    puts(("Sub" + item + " exists").c_str());
    return;
  }
  for (uint64_t i = 0; i < kNum; i++) {
    int64_t start = (Hash(i, uid) % kNum) * kRange + kStart;
    auto it = mp.lower_bound({start, 0});
    if ((it != mp.end() && it->l < start + (int64_t)kRange) ||
        (it != mp.begin() && std::prev(it)->l + std::prev(it)->len > start)) {
      continue;
    }
    std::string range_str = username + ':' + std::to_string(start) + ':' +
        std::to_string(kRange) + '\n';
    if (write(fd, range_str.c_str(), range_str.size()) < 0) Err("write");
    close(fd);
    range_str.pop_back();
    puts(range_str.c_str());
    return;
  }
  ErrStr(("Cannot allocate sub" + item).c_str());
}

int main(int argc, char** argv) {
  if (setgid(0) < 0) Err("setgid");
  uid_t uid = getuid();
  if (setresuid(uid, uid, 0) < 0) Err("setuid");
  umask(0022);
  try {
    if (argc > 2 || (argc == 2 && std::string(argv[1]) != "-q")) Help(argv[0]);
    struct passwd* pwd = getpwuid(uid);
    if (!pwd) Err("getpwuid");
    std::string username = getpwuid(uid)->pw_name;
    if (argc == 2) {
      std::set<Range> tmp;
      Range ru = LoadFile("/etc/subuid", tmp, username, true);
      Range rg = LoadFile("/etc/subgid", tmp, username, true);
      if (ru.l == -2) ErrStr("Parsing error in /etc/subuid");
      if (rg.l == -2) ErrStr("Parsing error in /etc/subgid");
      if (ru.l == -1) puts("Subuid does not exist");
      else printf("%s:%" PRId64 ":%" PRId64 "\n", username.c_str(), ru.l, ru.len);
      if (rg.l == -1) puts("Subgid does not exist");
      else printf("%s:%" PRId64 ":%" PRId64 "\n", username.c_str(), rg.l, rg.len);
      return 0;
    }
    if (setresuid(uid, 0, 0) < 0) Err("setuid");
    int fd1 = open("/etc/subuid", O_RDWR | O_APPEND | O_CREAT | O_NOCTTY | O_NONBLOCK, 0644);
    if (fd1 < 0) Err("open");
    int fd2 = open("/etc/subgid", O_RDWR | O_APPEND | O_CREAT | O_NOCTTY | O_NONBLOCK, 0644);
    if (fd1 < 0) Err("open");
    struct flock lk;
    lk.l_type = F_WRLCK;
    lk.l_whence = SEEK_SET;
    lk.l_start = 0;
    lk.l_len = 0;
    if (fcntl(fd1, F_SETLK, &lk) < 0) Err("Get lock failed");
    if (fcntl(fd2, F_SETLK, &lk) < 0) Err("Get lock failed");
    CheckAndInsert(uid, "uid", username, fd1);
    CheckAndInsert(uid, "gid", username, fd2);
  } catch (...) {
    Err(argv[0]);
  }
}
