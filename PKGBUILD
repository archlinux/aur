# Contributor: IIpho3nix <iipho3nix at gmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=goshs-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="A SimpleHTTPServer written in Go, enhanced with features and with a nice design"
arch=("x86_64" "i386" "arm64")
url="https://hesec.de/tags/goshs/"
_githuburl="https://github.com/patrickhener/goshs"
license=("MIT")
provides=()
conflicts=("goshs")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_amd64.tar.gz")
sha256sums=('756e98f80d4d2c6794da44473bcf441c2175f35d310a20329640e17e7ad674a5')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}