# Maintainer: gmzr
pkgname=gde-creator-bin
_binname=gde-creator
pkgver=1.0.2
pkgrel=2
pkgdesc="GDE-Creator is a modern CLI tool that automatically search steam database, fetch name and icons and generate compliant .desktop file in your Linux system."
arch=('x86_64')

url="https://github.com/gmzr0/gde-creator"

license=('MIT')
depends=('glibc' 'zlib')
provides=("$_binname")
conflicts=("$_binname" "$_binname-git")

options=('!strip')

source=("$url/releases/download/v$pkgver/gde-creator-linux-x64.tar.gz")

sha256sums=('3a3b02d6514e9ef1a483d2511613419a1aaf4da2a7560f1c79110b0bb771bb3d')

package() {
  cd "$srcdir"

  install -Dm755 "$_binname" "$pkgdir/usr/bin/$_binname"
}
