# Maintainer: flaviofearn <flavioislima@gmail.com>
# Maintainer: blingus <brett@hyperplay.xyz>

pkgname=hyperplay
pkgver=0.18.0
pkgrel=1
pkgdesc="An open source Web3 gaming platform."
arch=('x86_64')
url="https://github.com/HyperPlay-Gaming/hyperplay-desktop-client"
license=('GPL3')
depends=('gawk')
_filename=hyperplay-0.18.0.pacman
source=("https://github.com/HyperPlay-Gaming/hyperplay-desktop-client/releases/download/v0.18.0/hyperplay-0.18.0.pacman")
noextract=("hyperplay-0.18.0.pacman")
md5sums=(02c54cce3d3acdd887020aaa217fbd9b)
options=(!strip)

package() {
  tar -xJv -C "$pkgdir" -f "$srcdir/$_filename" usr opt
  mkdir "$pkgdir/usr/bin"
  ln -s "/opt/HyperPlay/hyperplay" "$pkgdir/usr/bin/hyperplay"
}

# vim:set ts=2 sw=2 et: syntax=sh

