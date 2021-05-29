# Maintainer:   Daniel Menelkir <menelkir@itroll.org>

pkgname=ananicy-cpp-runit
pkgver=20210529
pkgrel=2
pkgdesc="Ananicy Cpp is a full rewrite of Ananicy in C++, featuring lower CPU and RAM usage."
arch=('any')
url="https://gitlab.com/ananicy-cpp/ananicy-cpp/"
license=('BSD')
depends=('ananicy-cpp-nosystemd' 'runit' 'bash' 'schedtool')
makedepends=('git' 'make')
source=("ananicy-cpp-runit.finish"
        "ananicy-cpp-runit.run"
        "ananicy-cpp-runit.start")
b2sums=('SKIP'
        'SKIP'
        'SKIP')
install=ananicy-cpp-runit.install

package() {

  mkdir -p "$pkgdir/etc/runit/sv/ananicy-cpp"
  cp "ananicy-cpp-runit.finish" $pkgdir/etc/runit/sv/ananicy-cpp/finish
  cp "ananicy-cpp-runit.run" $pkgdir/etc/runit/sv/ananicy-cpp/run
  cp "ananicy-cpp-runit.start" $pkgdir/etc/runit/sv/ananicy-cpp/start
  install=ananicy-cpp-runit.install
}

