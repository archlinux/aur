# Maintainer: JaydenDev <jdev0894@gmail.com>
pkgname=jdutils-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Basic coreutils alternative written in rust, all programs included do one thing and does that one thing well."
arch=('any')
url="https://github.com/JaydenDev/jd-utils-rust"
license=('x86_64')
provides=("$pkgname")
source=("https://github.com/JaydenDev/jd-utils-rust/releases/download/v0.2.0/jd-utils-0.2.0.tar")
md5sums=("SKIP")

package() {
  install -Dm755 "$srcdir/bin/list" "$pkgdir/usr/bin/list"
  install -Dm755 "$srcdir/bin/rf" "$pkgdir/usr/bin/rf"
  install -Dm755 "$srcdir/bin/no" "$pkgdir/usr/bin/no"
}

