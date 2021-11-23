# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=batz-converter
rpkgname=batzconverter
pkgver=1.1.0
pkgrel=1
pkgdesc="Show and convert timezone in shell"
arch=('any')
url="https://github.com/chmouel/${rpkgname}"
license=('Apache')
groups=('utils')
depends=('bash')
source=("${rpkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/${rpkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('e3edf846756a22a1f366afc8d04539d0aa31385a4f501d3d50d9d5f6e500d3e45b4fe5437ba94bc58be1649482a636541a51139a4d02d3a5903137441aa803ab')


package() {
	cd "${srcdir}/${rpkgname}-${pkgver}"

    # install binary
	install -D -m0755 batz.sh "${pkgdir}/usr/bin/batz"
}

