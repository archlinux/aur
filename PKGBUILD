# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

# This is the package build for the tools to build nban and the shuriken
# This was originally developed for Ninja OS, but has been seperated out as
# an arch package

pkgname=mkinitcpio-nban
pkgver=1.1
pkgrel=1
pkgdesc="Ninja Boot and Nuke. A boot and nuke impleneted as a initcpio image."
url="http://ninjaos.org"
arch=('any')
license=('GPL3')
groups=('ninjaos')
depends=('mkinitcpio' 'syslinux' 'parted' 'dosfstools' 'util-linux')
optdepends=('hdparm: ATA Security erase command, future feature')
install="${pkgname}.install"
source=("${pkgname}.${pkgver}.tar.gz")
sha256sums=('880fd0b2b7609372e67d67727490494f0c9475bbc65862879c8242db8f651425')
package() {
    cd "${srcdir}/${pkgname}.${pkgver}"
    cp -ra . "${pkgdir}"
}

