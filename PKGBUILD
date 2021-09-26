# flashpoint-launcher-bin

# Maintainer: LeSnake <dev.lesnake@posteo.de>

pkgname=bibox2-bin
pkgver=2.1.0
pkgrel=2
pkgdesc="Offizieller Client für Westermann Schulbücher / Official Client for german school books from Westermann"
arch=('x86_64')
url="https://www.bibox.schule"
license=('custom')
depends=('gnome-keyring')
optdepends=()
conflicts=()
source=("https://static.bibox2.westermann.de/electron/autoUpdate/BiBox%202.0%202.1.0.deb")
sha512sums=('a19ddc43c5251bed713c420a69ecaba4ee08f725b52121ee500b82e9a81705e18c55d2e80222475ba2f9334462480c637cb5301b8309f5d84c94ad6b5b613160')

package(){
	# Extract package data
	tar xf data.tar.xz -C ${pkgdir}
}
