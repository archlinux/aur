#include <new>

extern "C++" {
  __attribute__((visibility("default"))) void operator delete(void * ptr, std::size_t) noexcept {
    ::operator delete(ptr);
  }
}
