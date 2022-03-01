# Maintainer: Sara Chan <aur.dc7dn@simplelogin.co>
pkgname=steuern2021
pkgver=1.0.5
pkgrel=17
pkgdesc="Steuersoftware 2021 für den Kanton Schaffhausen"
arch=("x86_64")
url="https://sh.ch/"
license=('unknown')

source=(https://steuern.sh.ch/Software/NP/2021/$pkgname-$pkgver-$pkgrel.$arch.rpm)

sha256sums=('26b05e9ce0211fd65f57ff985fb1f53104a18d5f9d788c12f0d74ba6d2fd2353')

package() {
	mkdir -p "${pkgdir}/usr"
	cp -r "${srcdir}/usr/share/" "${pkgdir}/usr/"
}
