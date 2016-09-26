# Maintainer: lucifermstar <8bit.demoncoder@gmail.com>
pkgname=nfeh
pkgver='1.0.0'
pkgrel=2
epoch=
pkgdesc="Tiny GUI for feh"
arch=('x86_64')
url="https://github.com/fa7ad/nfeh"
license=('MIT')
groups=()
depends=('feh' 'bash')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/fa7ad/nfeh/releases/download/${pkgver}/nfeh-${pkgver}.tar.xz")
noextract=()
md5sums=('3ccc1a5a8827c0b010599db65789c5c5')
validpgpkeys=()

package() {
  tar xJf ${srcdir}/nfeh-${pkgver}.tar.xz -C ${pkgdir}/
}

post_install() {
    :
#!/bin/bash

# Link to the binary
ln -sf '/opt/nfeh/nfeh' '/usr/local/bin/nfeh'

}
post_remove() {
    :
#!/bin/bash

# Delete the link to the binary
rm -f '/usr/local/bin/nfeh'

}

# vim:set ts=2 sw=2 et:
