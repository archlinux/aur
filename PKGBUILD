# Maintainer: uzki69 <uzakichan11224@gmail.com>
pkgname=make-jfnf
pkgver=1.0.0
pkgrel=1
pkgdesc="Make Jellyfin Name Format cli"
url="https://github.com/uzki69/MakeJFNF"
arch=('x86_64')
license=('custom')
depends=('python' 'coreutils')
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/uzki69/MakeJFNF/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('37d1bec1547d736a437c06cbcfd3c499b755f4c91f6d9195a7e3d6a78ab75117')
package() {
	install -D -m755 "${srcdir}/${pkgname}-${pkgver}/main.py" "${pkgdir}/usr/bin/jfnf"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"	
}
