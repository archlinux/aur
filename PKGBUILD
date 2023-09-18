# flashpoint-launcher-bin

# Maintainer: LeSnake <dev.lesnake@posteo.de>

pkgname=bibox2-bin
pkgver=2.4.6
pkgrel=1
pkgdesc="Offizieller Client für Westermann Schulbücher / Official Client for school books by Westermann"
arch=('x86_64')
url="https://www.bibox.schule"
license=('custom')
depends=('gnome-keyring')
makedepends=('tar')
optdepends=()
conflicts=()
source=("https://static.bibox2.westermann.de/electron/autoUpdate/BiBox%202.0%202.4.6.deb")
sha512sums=('1996db4ec183acc3e3156a7e17a0bf0cf9d0d1f863a8b153858139c4c3e8999d3e6d6838a2336d7b8a6212e7ff57a30de1a77b3c23d2e08bfcc3a4f1744fdbec')

package(){
	# Extract package data
	tar xf data.tar.xz -C ${pkgdir}
}
