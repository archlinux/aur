# Maintainer: HaoCheng<ch1994@outlook.com>
pkgname=stream-url-bin
_pkgname=stream-url
pkgver=0.1.2
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
sha256sums_aarch64=('23a7978a57eb55418383e0e4e3e5b580927342b989da1d70f3709e78baf46356')
sha256sums_x86_64=('1394a698147eb1d8f1b6e7c299db0017ddd77398b3a3aef2086ead59a9f3609f')

package() {
	cd ${srcdir}
	install -D -m755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}" 
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
