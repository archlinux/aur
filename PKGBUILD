# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: David Avedissian <avedissian.david@gmail.com>
# Contributor: Callum Moffat <callum90ish@gmail.com>
# Modified by redneckdrow 12/6/14 3:17 PM EST
# Modified by SerialVelocity 12/9/15 9:52 AM BST

_pkgname=cinnamon-themes
pkgname=mint-${_pkgname}
pkgver=2016.04.22
pkgrel=1
pkgdesc='A collection of the best themes available for Cinnamon.'
arch=('any')
license=('GPL')
url='http://linuxmint.com'
source=("https://ftp.fau.de/mint/packages/pool/main/c/${_pkgname}/${_pkgname}_${pkgver}.tar.xz")
sha256sums=('4174f6c223c540fa525247c1d60b081c417d6a972a1bddff2a281551bd7262f1')
 
package() {
	cd "${srcdir}/${_pkgname}"
	cp -dr --no-preserve=ownership "./usr" "${pkgdir}/"
}
