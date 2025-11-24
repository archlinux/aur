# Maintainer: gmzr
pkgname=gde-creator-bin
_binname=gde-creator
pkgver=1.0.1
pkgrel=1
pkgdesc="GDE-Creator is a modern CLI tool that automatically search steam database, fetch name and icons and generate compliant .desktop file in your Linux system."
arch=('x86_64')

url="https://github.com/gmzr0/gde-creator"

license=('MIT')
depends=('glibc' 'zlib')
provides=("$_binname")
conflicts=("$_binname" "$_binname-git")

source=("$url/releases/download/v$pkgver/gde-creator-linux-x64.tar.gz")

sha256sums=('b5d1d8ddb98645521fb1f9f749946dcdfbefe8fd19f8e16f8c9a55a87716797d')

package() {
  cd "$srcdir"

  install -Dm755 "$_binname" "$pkgdir/usr/bin/$_binname"
}
