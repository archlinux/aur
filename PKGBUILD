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
source=("https://github.com/xginn8/aisdeco/blob/master/LICENSE")
source_armv6h=("https://github.com/xginn8/aisdeco/blob/master/aisdeco_rpi_20140704.tgz")
source_armv7h=("https://github.com/xginn8/aisdeco/blob/master/aisdeco_rpi_20140704.tgz")
source_i686=("https://github.com/xginn8/aisdeco/blob/master/aisdeco2_i386_20150415.tgz")
source_x86_64=("https://github.com/xginn8/aisdeco/blob/master/aisdeco2_${CARCH}_20161112.tgz")

sha256sums=('0f37f38e0e340c09ec723b588aaaf142e2d05909ae0d891e4703a9ae70087968')
sha256sums_x86_64=('1b0a21ca6a9d71fb6a9f2da0e5063e0cd654ca868c6bbeb1cf43efcbac4e9e5b')
sha256sums_i686=('21b788c11188fae8830dc1dbcc2dd19ac4ab73116b3e5892cc314273f3138de8')
sha256sums_armv6h=('53a44d4aae30bb2b596f380a84b7fd75b4664f33b3f1bff94fa10be0934bb084')
sha256sums_armv7h=('53a44d4aae30bb2b596f380a84b7fd75b4664f33b3f1bff94fa10be0934bb084')
package() {
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
