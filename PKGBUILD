# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=batz-converter
rpkgname=batzconverter
pkgver=2.2.0
pkgrel=1
pkgdesc="Show and convert timezone in shell"
arch=('any')
url="https://github.com/chmouel/${rpkgname}"
license=('Apache')
groups=('utils')
depends=('bash')
source=("${rpkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/${rpkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('6e1097027d3211462c05faf6ded04b0ced6b7c1d64450fa90c6e7864c916f280f620e235369856701292037dbd13c539dd607cb3f4d216a8bf8669886d630c0d')


package() {
	cd "${srcdir}/${rpkgname}-${pkgver}"

    # install binary
	install -D -m0755 batz.sh "${pkgdir}/usr/bin/batz"
}

