# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Ghost of Kendo <ghostofkendo at gmail dot com>

pkgname=ispin
pkgver=1.1.4
pkgrel=2
pkgdesc='New Tcl/Tk GUI for Spin replacing xSpin'
arch=('any')
url='http://spinroot.com/'
license=('custom:SPIN')
depends=('spin>=6.0' 'tk>=8.5' 'gcc')
optdepends=('graphviz: recommended, provides dot tool for automata view'
            'curl: for version check information')
source=(ispin.tcl
	      LICENSE.txt)
sha512sums=('46fb13f01d91d072d671dc88cb6bf976e26e8a0b1023b4c8e84f16ae4ad7f67b9f58522329672e4b013ffb4f8e2ced47af6d0e7bdbf52a5ca4a42916c63f6e21'
            'a5b63fc7136a2631c9a27619953abe2e9d6cab179042dd56bb76afbffe1966ad7edb41a131af5d6663f3cdbf77128833232e9174c0ef817b8522bfd978add595')

package() {
  cd "${srcdir}"
  install -Dm755 "${pkgname}.tcl" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
