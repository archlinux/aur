# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: IIpho3nix <iipho3nix at gmail dot com>
pkgname=goshs-bin
pkgver=0.3.5
pkgrel=2
pkgdesc="A SimpleHTTPServer written in Go, enhanced with features and with a nice design"
arch=("aarch64" "armv7h" "i686" "x86_64")
url="https://hesec.de/tags/goshs/"
_githuburl="https://github.com/patrickhener/goshs"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_x86_64.tar.gz")
sha256sums_aarch64=('7d547aa0b5e2268f98fc0ef59e2b421f00762e689895274198f65f71b8eedf44')
sha256sums_armv7h=('7d547aa0b5e2268f98fc0ef59e2b421f00762e689895274198f65f71b8eedf44')
sha256sums_i686=('68fa8702cb29eb26fbbd0537be3a689746dc3bce5b93dc7ca03c3cba9c0bb40f')
sha256sums_x86_64=('81e1e008e23146fe2a82a70b881ded3173320a8edee5761412a1e2488342b615')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}