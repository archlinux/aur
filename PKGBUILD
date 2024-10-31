# Maintainer: flaviofearn <flavioislima@gmail.com>
# Maintainer: blingus <brett@hyperplay.xyz>

pkgname=hyperplay
pkgver=0.21.2
pkgrel=1
pkgdesc="An open source Web3 gaming platform."
arch=('x86_64')
url="https://github.com/HyperPlay-Gaming/hyperplay-desktop-client"
license=('GPL3')
depends=('gawk')
_filename=hyperplay-0.21.2.pacman
source=("https://github.com/HyperPlay-Gaming/hyperplay-desktop-client/releases/download/v0.21.2/hyperplay-0.21.2.pacman")
noextract=("hyperplay-0.21.2.pacman")
md5sums=(3b0e138db1e7eaeedc26f800eb803d90)
options=(!strip)

package() {
  tar -xJv -C "$pkgdir" -f "$srcdir/$_filename" usr opt
  mkdir "$pkgdir/usr/bin"
  ln -s "/opt/HyperPlay/hyperplay" "$pkgdir/usr/bin/hyperplay"
}

# vim:set ts=2 sw=2 et: syntax=sh

