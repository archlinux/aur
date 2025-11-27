# Maintainer: gmzr
pkgname=gde-creator-bin
_binname=gde-creator
pkgver=1.0.4
pkgrel=1
pkgdesc="GDE-Creator is a modern CLI tool that automatically search steam database, fetch name and icons and generate compliant .desktop file in your Linux system."
arch=('x86_64')

url="https://github.com/gmzr0/gde-creator"

license=('MIT')
depends=('glibc' 'zlib')
provides=("$_binname")
conflicts=("$_binname" "$_binname-git")

options=('!strip')

source=("$url/releases/download/v$pkgver/gde-creator-linux-x64.tar.gz")

sha256sums=('79c7012ebd61ab40dac2e4f1a3fb3df43453acf71df380a2a5fb5589746abfd0')

package() {
  cd "$srcdir"

  install -Dm755 "$_binname" "$pkgdir/usr/bin/$_binname"
}
