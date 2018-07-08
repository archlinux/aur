## Package Maintainer: Karl-K

pkgname=extip
pkgver=1.0
pkgrel=1
pkgdesc="A simple curl one-liner to get your external IP address"
arch=('any')
license=('MIT/X')
url="https://github.com/karl-k/extip"
depends=('curl')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/karl-k/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('8423d636805156af6077cdf30f75d234dce0a7904b1555ee41f247c4c706da6658678101eec1c44b079480044b665aadbca8eac809e647e8cdeada587bbaaf45')


package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

mkdir -p "${pkgdir}/usr/bin/"
install -D -m755 "extip" "${pkgdir}/usr/bin/"
}
