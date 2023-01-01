# Maintainer: Erwann Lagouche <popgthyrd@gmail.com>
pkgname=highflux-preview-bin
pkgver=0.7.0
pkgrel=3
epoch=
pkgdesc='Highflux preview version'
arch=('any')
url='https://www.highflux.io/'
license=('copyright')
groups=()
depends=('wget')
makedepends=()
checkdepends=()
conflicts=('highflux' 'hf')
replaces=()
backup=()
option=()
install=
changelog=
source=( 'entry.desktop'
'https://www.highflux.io/ping/dl_redirect/linux_tgz' )
noextract=()
md5sum=()
validpkgkeys=()

package() {
  tar -xf "./linux_tgz"
    mkdir -p "$pkgdir/usr/bin"
  cp "./highflux-$pkgver/hf" "$pkgdir/usr/bin/hf"
  cp "./highflux-$pkgver/highflux" "$pkgdir/usr/bin/highflux"
    mkdir -p "$pkgdir/usr/share/applications"
  cp "$srcdir/entry.desktop" "$pkgdir/usr/share/applications/highflux.desktop"
}
sha256sums=('7b346ed8a4ff76d44b77e57504406d3d56c88cd2c9770379173c374af45a0d3d'
'47028ba2e52a48aca7a888d8e8acf2c1ed6151be310fc236b1af004ac01a7547')
