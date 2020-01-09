# Maintainer: Matthew McGinn <mamcgi@gmail.com>
pkgname=aisdeco2
pkgver=20161112
pkgrel=2
pkgdesc="Cross-Platform Console Software-defined radio (SDR) receiver/decoder for marine Automatic Information System (AIS) signals"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="http://xdeco.org/"
_github_url="none"
license=('custom')
depends=('rtl-sdr')
provides=('aisdeco2')
source=("LICENSE")
source_armv6h=("https://github.com/xginn8/aisdeco/raw/master/aisdeco_rpi_20140704.tgz")
source_armv7h=("https://github.com/xginn8/aisdeco/raw/master/aisdeco_rpi_20140704.tgz")
source_i686=("https://github.com/xginn8/aisdeco/raw/master/aisdeco2_i386_20150415.tgz")
source_x86_64=("https://github.com/xginn8/aisdeco/raw/master/aisdeco2_${CARCH}_20161112.tgz")

sha256sums=('943f4028cecc46eeffb5d82d2e7eac8999ba7fed1e1458888a59a3b9dbdce96b')
sha256sums_x86_64=('c458df8a0e3b04457d8ac41f1a9b74640553f85ba8b7815ebaa8695913e09162')
sha256sums_i686=('21d8153da6a544ff0bfe813494150a6dd43327a31f1c841fdc14d9e7633a78b9')
sha256sums_armv6h=('7d04bfb2a5cdc44c57c23da44f9a2f4d836ec5f87b6b751e33129b35832720d1')
sha256sums_armv7h=('7d04bfb2a5cdc44c57c23da44f9a2f4d836ec5f87b6b751e33129b35832720d1')
package() {
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
