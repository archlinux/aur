# Maintainer: Hyper-KVM <hyperkvmx86@gmail.com>

pkgname=foldingathome-openrc
pkgver=20200319
pkgrel=1
pkgdesc="OpenRC script for folding@home daemon"
arch=('any')
url="https://foldingathome.org/"
license=('CUSTOM')
provides=('foldingathome-openrc')
source=("foldingathome.init")
sha256sums=('0039215c0b7fa2fd950f966f0e832e782c629acf948915f8192feb266266fa59')

package(){

	install="foldingathome.install"
	install -Dm755 ${srcdir}/foldingathome.init ${pkgdir}/etc/init.d/foldingathome
}
