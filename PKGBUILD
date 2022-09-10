# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Jan Koppe <post@jankoppe.de>

pkgname=yarn-xdg-bin
pkgver=1.22.19
pkgrel=2
pkgdesc='Fast, reliable, and secure dependency management - with xdg basedir patches (binary version)'
arch=(any)
provides=('yarn')
conflicts=('yarn')
url='https://classic.yarnpkg.com/'
license=('BSD')
depends=('nodejs' 'gulp')
source=("https://github.com/noahvogt/yarn-build-node_modules/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('4d4d09350c7e190ca69120a4d5ec68d30226e8ef97afa792faa6002b8ab84bb3')
options=(!strip)

package() {
  cp -R "$srcdir/usr" "$pkgdir/usr"
}
