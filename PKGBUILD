# Contributor: IIpho3nix <iipho3nix at gmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=goshs-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A SimpleHTTPServer written in Go, enhanced with features and with a nice design"
arch=("x86_64" "i386" "arm64")
url="https://hesec.de/tags/goshs/"
_githuburl="https://github.com/patrickhener/goshs"
license=("MIT")
provides=()
conflicts=("goshs")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_${CARCH}.tar.gz")
sha256sums=('33ff521fe5cbda09d4bc085cf08408e7216351dc2839034ed3e4d0c1d3dca90f')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
