# Maintainer: th3r00t <myoung0083@gmail.com>
pkgname=dashboard
pkgver=1.0.0
pkgrel=1
pkgdesc="A Minimal Terminal Dashboard/HackerNews Reader."
arch=('x86_64')
url="https://github.com/th3r00t/dashboard"
license=("MIT")
depends=("python" "lynx" "ncurses" "task")
makedepends=("git")
source=("git+https://github.com/th3r00t/dashboard.git")
md5sums=("SKIP")

package() {
  install -Dm755 "$srcdir/dashboard/dashboard" "$pkgdir/usr/bin/dashboard"
}
