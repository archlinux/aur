# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Sabart Otto <seberm at gmail dot com>

pkgname=adminer
pkgver=5.5.1
pkgrel=1
pkgdesc="A full-featured MySQL management tool written in PHP"
arch=(any)
license=(Apache-2.0 GPL-2.0-only)
depends=(php-interpreter)
optdepends=(apache elasticsearch mariadb mongodb mysql postgresql sqlite)
url=https://www.adminer.org
install=adminer.install
source=("https://github.com/vrana/adminer/releases/download/v${pkgver}/adminer-${pkgver}.php")
sha256sums=('f2c70c6403a042d554be1dd8d69b6f6270a97e5b40d2fb7626f46aad821e9a18')

package() {
  install -Dm0644 "${pkgname}-${pkgver}.php" \
    "$pkgdir/usr/share/webapps/$pkgname/index.php"
}

# vim: set ts=2 sw=2 et:
