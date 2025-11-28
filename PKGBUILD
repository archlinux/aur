# Maintainer: gmzr
pkgname=gde-creator-bin
_binname=gde-creator
pkgver=1.0.5
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

sha256sums=('b1e077e98e5e5903f1ba40c86d9fc2d914cc08b70e7faa7af3988a606ca9c98e')

package() {
  cd "$srcdir"

  install -Dm755 "$_binname" "$pkgdir/usr/bin/$_binname"
}
