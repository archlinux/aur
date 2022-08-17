# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=distro-grub-themes-arch
pkgver=2.8
pkgrel=1
epoch=
pkgdesc="A GRUB2 theme for Arch Linux"
arch=('any')
url="https://github.com/AdisonCavani/distro-grub-themes"
license=('GPL3')
groups=()
depends=('grub')
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

_theme_distro="arch"

source=("https://github.com/AdisonCavani/distro-grub-themes/releases/download/v${pkgver}/${_theme_distro}.tar")
noextract=("${_theme_distro}.tar")
sha256sums=('b6fab2d52d263e672d6bdc29635afd0a30889d428e2b5962c2cdb9d400be978a')
validpgpkeys=()

# example:
# https://github.com/archlinux/svntogit-packages/blob/packages/breeze-grub/trunk/PKGBUILD
package() {
	install -d "$pkgdir"/usr/share/grub/themes/${_theme_distro}
	bsdtar --cd "$pkgdir"/usr/share/grub/themes/${_theme_distro} -xf "$srcdir"/${_theme_distro}.tar
}
