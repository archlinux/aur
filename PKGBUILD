# Maintainer: Matthew McGinn <mamcgi@gmail.com>
pkgname=aisdeco2
pkgver=20161112
pkgrel=2
pkgdesc="Cross-Platform Console Software-defined radio (SDR) receiver/decoder for marine Automatic Information System (AIS) signals"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="http://xdeco.org/"
license=('custom')
depends=('rtl-sdr')
provides=('aisdeco2')
source=("LICENSE")
source_armv6h=("https://github.com/xginn8/aisdeco/blob/master/aisdeco_rpi_20140704.tgz")
source_armv7h=("https://github.com/xginn8/aisdeco/blob/master/aisdeco_rpi_20140704.tgz")
source_i686=("https://github.com/xginn8/aisdeco/blob/master/aisdeco2_i386_20150415.tgz")
source_x86_64=("https://github.com/xginn8/aisdeco/blob/master/aisdeco2_${CARCH}_20161112.tgz")

sha256sums=('943f4028cecc46eeffb5d82d2e7eac8999ba7fed1e1458888a59a3b9dbdce96b')
sha256sums_x86_64=('01259cd65b3b56dfc3c7031c6f65996924316ba6a1f8d35122d1b4ee8b0aaf3c')
sha256sums_i686=('07182bedf98199da9db79a3e5a7a82fb0452e7e9de6390f5fb080a00562f0af0')
sha256sums_armv6h=('86fc25fa93f66264b51b9fc8b111fea023acf623cc632218214232b41df3a809')
sha256sums_armv7h=('86fc25fa93f66264b51b9fc8b111fea023acf623cc632218214232b41df3a809')
package() {
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
