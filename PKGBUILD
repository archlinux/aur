# Maintainer: Steve Engledow <steve at offend dot me dot uk>
pkgname=thiy
pkgver=0.1
pkgrel=1
pkgdesc="A templating engine that uses YAML templates to produce HTML files."
arch=('i686' 'x86_64')
url=""
license=('MIT')
install=
changelog=
source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums_i686=('880dfe5b27a3af2b9789d49130a2c47a')
md5sums_x86_64=('3340557cb17e0473b39473672faee73d')
source=()
source_i686=("thiy-i686::https://github.com/stilvoid/$pkgname/releases/download/v$pkgver/$pkgname-linux-i386")
source_x86_64=("thiy-x86_64::https://github.com/stilvoid/$pkgname/releases/download/v$pkgver/$pkgname-linux-amd64")

package() {
  install -Dm 755 "${srcdir}/thiy-$CARCH" "${pkgdir}/usr/bin/thiy"
}
