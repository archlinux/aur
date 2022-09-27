# Maintainer: HaoCheng<ch1994@outlook.com>
pkgname=stream-url-bin
_pkgname=stream-url
pkgver=0.1.3
pkgrel=1
pkgdesc="A command line tool to get stream urls written in rust."
arch=('aarch64' 'x86_64')
url="https://github.com/tkit1994/stream-url"
license=('MIT')
provides=('stream-url')
depends=('gcc-libs')
source=("https://raw.githubusercontent.com/tkit1994/${_pkgname}/v${pkgver}/LICENSE")
source_aarch64=("https://github.com/tkit1994/stream-url/releases/download/v${pkgver}/stream-url-v${pkgver}.aarch64-unknown-linux-gnu.tar.gz")
source_x86_64=("https://github.com/tkit1994/stream-url/releases/download/v${pkgver}/stream-url-v${pkgver}.x86_64-unknown-linux-gnu.tar.gz")


sha256sums=('2239a38786b9429cc41539f3fe7972b09cbbaa538250d53c2fdcc01e0b6172be')
sha256sums_aarch64=('39f6008dce222df36322eb6e86db6617520f2ba2c33e07bab770019df6eaec2e')
sha256sums_x86_64=('3f5e0251271d8b43bc2bab8c0bf51e5d1a3f52c35b3ad0741f30259c8b12e753')

package() {
	cd ${srcdir}
	install -D -m755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}" 
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
