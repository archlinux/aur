# Contributor: IIpho3nix <iipho3nix at gmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=goshs-bin
pkgver=0.3.2
pkgrel=2
pkgdesc="A SimpleHTTPServer written in Go, enhanced with features and with a nice design"
arch=("x86_64" "i386" "arm64")
url="https://hesec.de/tags/goshs/"
_githuburl="https://github.com/patrickhener/goshs"
license=("MIT")
provides=()
conflicts=("goshs")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_${CARCH}.tar.gz")
sha256sums=('993e0650dff6c0d6e5eef2cfa34ca63be7479112493fb325c3abc5ba12401492')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}