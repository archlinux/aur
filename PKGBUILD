# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=batz-converter
rpkgname=batzconverter
pkgver=2.0.0
pkgrel=1
pkgdesc="Show and convert timezone in shell"
arch=('any')
url="https://github.com/chmouel/${rpkgname}"
license=('Apache')
groups=('utils')
depends=('bash')
source=("${rpkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/${rpkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('495444bb6a513d687b4ce69e39828dbf4a030c700236006916ebf7370138aeb7c71daff52dd63b315f5b64a92a87522eb7449bc4e40d4ab7b6423c490b13d46f')


package() {
	cd "${srcdir}/${rpkgname}-${pkgver}"

    # install binary
	install -D -m0755 batz.sh "${pkgdir}/usr/bin/batz"
}

