# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: David Avedissian <avedissian.david@gmail.com>
# Contributor: Callum Moffat <callum90ish@gmail.com>
# Modified by redneckdrow 12/6/14 3:17 PM EST
# Modified by SerialVelocity 12/9/15 9:52 AM BST

pkgname=mint-cinnamon-themes
_pkgname=cinnamon-themes
pkgver=2015.11.06
pkgrel=1
pkgdesc='A collection of the best themes available for Cinnamon.'
arch=('any')
license=('GPL')
url='http://linuxmint.com'
source=("https://ftp.fau.de/mint/packages/pool/main/c/${_pkgname}/${_pkgname}_${pkgver}.tar.gz")
sha256sums=('652b274ef82c101420a91694bb792a40561f849694de7c0567bfbba30eb5b69f')
 
package() {
	cd "${srcdir}/${_pkgname}"
	cp -dr --no-preserve=ownership "./usr" "${pkgdir}/"
}
