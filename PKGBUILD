# Maintainer: Aman Kumar Sinha

pkgname=load-tester-bin
_pkgname=load-tester
pkgver=0.1.1
pkgrel=1
pkgdesc='A simple command-line tool for load testing of HTTP servers.'
arch=('x86_64')
url='https://github.com/Perniciosius/load-tester.git'
depends=('openssl' 'gcc-libs' 'glibc')
license=('Apache')

source=("$_pkgname-$pkgver::https://github.com/Perniciosius/${_pkgname}/releases/download/v${pkgver}/${_pkgname}")
sha256sums=('e60bcfaf2cfa8f7f2675104075789ce9c01736927f5419a21059bde970e341c7')

package() {
  install -D $srcdir/load-tester-$pkgver $pkgdir/usr/bin/load-tester
}
