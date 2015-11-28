# Maintainer: Gerald Nunn <gerald dot b dot nunn at gmail dot com>

pkgname=visual-grep
pkgver=0.21
pkgrel=1
pkgdesc="A GTK 3 based GUI for grep"
arch=('x86_64')
url="http://github.com/gnunn1/vgrep"
license=('MPL')
depends=('gtk3')
source_x86_64=(https://github.com/gnunn1/vgrep/releases/download/$pkgver/vgrep.zip)
md5sums_x86_64=('3ba187abf9fd60d8a218a1006ab5b875')

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  install -Dm755 vgrep "$pkgdir/usr/bin/vgrep"
  install -Dm755 vgrep.desktop "$pkgdir/usr/share/applications"
}
