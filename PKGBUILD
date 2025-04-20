pkgname=velo
pkgver=1.0.0
pkgrel=1
pkgdesc="A script to manage AUR packages and perform various package-related tasks"
arch=('x86_64')
url="https://github.com/sparksistaken/velo"
license=('GPL3')
depends=('git' 'curl' 'pacman')
source=("https://github.com/sparksistaken/velo/raw/main/velo.sh")
sha256sums=('SKIP')  # 'SKIP' for remote source

prepare() {
  return 0
}

build() {
  return 0
}

package() {
  # Install the main script to /usr/local/bin for executable scripts
  install -Dm755 "$srcdir/velo.sh" "$pkgdir/usr/local/bin/velo"
  
  # Install the script as documentation in the doc directory
  install -Dm644 "$srcdir/velo.sh" "$pkgdir/usr/share/doc/velo/velo.sh"
}
