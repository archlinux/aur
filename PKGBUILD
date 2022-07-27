# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=batz-converter
rpkgname=batzconverter
pkgver=2.1.0
pkgrel=1
pkgdesc="Show and convert timezone in shell"
arch=('any')
url="https://github.com/chmouel/${rpkgname}"
license=('Apache')
groups=('utils')
depends=('bash')
source=("${rpkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/${rpkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('7af53ad684a00d6a1657c05dadf8b753783a9ef4adc79c6e3ef4f3795cd56df9f2e086c0c82a13249f3514e31c87c855d6017507cb6269da678b7d703f8dcc62')


package() {
	cd "${srcdir}/${rpkgname}-${pkgver}"

    # install binary
	install -D -m0755 batz.sh "${pkgdir}/usr/bin/batz"
}

