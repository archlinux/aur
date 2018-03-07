# Maintainer: Marcos Ferreira <merkkp at gmail dot com>

pkgname="phpbrew"
pkgver=1.23.1
pkgrel=1
pkgdesc="Brew & manage PHP versions in pure PHP at HOME"
arch=("any")
url="http://phpbrew.github.io/phpbrew/"
license=("MIT")
depends=("php>=5.3" "curl" "gcc" "binutils" "autoconf" "libxml2" "zlib" "readline")
makedepends=("git")
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/${pkgname}/${pkgname}/raw/${pkgver}/phpbrew")
md5sums=('0f7892fdb513d6a0d4f4975883813286')

package() {
  install -Dm755 phpbrew "${pkgdir}/usr/bin/phpbrew"
}

# vim:set ts=2 sw=2 et:
