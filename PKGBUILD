<<<<<<< HEAD
pkgver=0.5.8.r1.g8fb21b0
<<<<<<< HEAD
source=("git+${url}.git")
sha256sums=('SKIP')
pkgver() {
  cd "$pkgname"
  git describe --long --tags --always --dirty 2>/dev/null | \
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "0.5.8.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
