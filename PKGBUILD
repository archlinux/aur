# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=batz-converter
rpkgname=batzconverter
pkgver=1.2.0
pkgrel=1
pkgdesc="Show and convert timezone in shell"
arch=('any')
url="https://github.com/chmouel/${rpkgname}"
license=('Apache')
groups=('utils')
depends=('bash')
source=("${rpkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/${rpkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('44d83018d5c838d651cac447814da992f6342268e603245c8b8885a9f524991db58984e2628de918f36e742a0d07987c9367d88c3ac2e405a2077515caf680b7')


package() {
	cd "${srcdir}/${rpkgname}-${pkgver}"

    # install binary
	install -D -m0755 batz.sh "${pkgdir}/usr/bin/batz"
}

