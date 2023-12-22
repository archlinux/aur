# Maintainer: Gohny <gohny277@gmail.com>
pkgname='gem'
pkgver=0.1.0
pkgrel=1
pkgdesc="Command-line tool written in bash to backup and manage Gnome extensions and their configs"
arch=('x86_64')
url="https://github.com/gohny/gem"
license=('GPL3')
depends=('glib2')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('67c15c5ba7850ee7788c195d9a62a2e078842d8174224bfc9177bb7019938d74')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 ./gem "$pkgdir/usr/bin/gem"
}
