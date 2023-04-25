# Maintainer: IIpho3nix <iipho3nix at gmail dot com>
pkgname=goshs-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A SimpleHTTPServer written in Go, enhanced with features and with a nice design"
arch=("x86_64" "i386" "arm64")
url="https://hesec.de/tags/goshs/"
_githuburl="https://github.com/patrickhener/goshs"
license=("MIT")
provides=()
conflicts=("goshs")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_${CARCH}.tar.gz")
sha256sums=('SKIP')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}