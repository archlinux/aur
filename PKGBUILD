# Maintainer: Christophe Van den Abbeele <christophe.vda@protonmail.com>
pkgname=tic-80-bin
pkgver=1.1.2837
pkgrel=1
pkgdesc="Fantasy computer for making, playing and sharing tiny games."
arch=("x86_64")
url="https://tic80.com/"
license=("MIT")
depends=("libglvnd")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$pkgname-$pkgver.deb::https://github.com/nesbox/TIC-80/releases/download/v1.1.2837/tic80-v1.1-linux.deb")
sha512sums=("2aae8d18b968c81953b1ab1b34b3aa20d16770cca6a70ac00f273d9f8f8f799698b00bece212152e1b8660785016d51e010cae389d617547b30abd498817eec2")

package() {
	tar xvf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
