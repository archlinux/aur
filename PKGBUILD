# Maintainer: flaviofearn <flavioislima@gmail.com>
# Maintainer: blingus <brett@hyperplay.xyz>

pkgname=hyperplay
pkgver=0.17.4
pkgrel=1
pkgdesc="An open source Web3 gaming platform."
arch=('x86_64')
url="https://github.com/HyperPlay-Gaming/hyperplay-desktop-client"
license=('GPL3')
depends=('gawk')
_filename=hyperplay-0.17.4.pacman
source=("https://github.com/HyperPlay-Gaming/hyperplay-desktop-client/releases/download/v0.17.4/hyperplay-0.17.4.pacman")
noextract=("hyperplay-0.17.4.pacman")
md5sums=(2c84c6af26847ca58dc64863a77ccd48)
options=(!strip)

package() {
  tar -xJv -C "$pkgdir" -f "$srcdir/$_filename" usr opt
  mkdir "$pkgdir/usr/bin"
  ln -s "/opt/HyperPlay/hyperplay" "$pkgdir/usr/bin/hyperplay"
}

# vim:set ts=2 sw=2 et: syntax=sh

