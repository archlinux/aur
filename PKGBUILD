# Maintainer: éclairevoyant
# Contributor: Fredrick Brennan <copypaste at kittens dot ph>

pkgname=bdf2psf-debian
pkgver=1.215
pkgrel=1
pkgdesc='Bitmap font conversion utility'
arch=('any')
url="https://packages.debian.org/unstable/bdf2psf"
depends=('perl')
provides=('bdf2psf')
conflicts=('bdf2psf')
license=('GPL2')
source=("https://deb.debian.org/debian/pool/main/c/console-setup/bdf2psf_${pkgver}_all.deb")
b2sums=('746743d77d6609f551ef298a5a6c7ee6eb96c4586c85d30fa705b72c28e16580430e9481303c76bc21823583bf2bb154f7c69668b5c5c5edf4815be4b8a72505')

package() {
	tar -xvf data.tar.xz -C "$pkgdir"
}
