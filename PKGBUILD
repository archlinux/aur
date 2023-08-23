# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=s5cmd-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="Parallel S3 and local filesystem execution tool"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/peak/s5cmd'
license=('MIT')
provides=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux-arm64.tar.gz")
source_armv6h=("${pkgname%-bin}-${pkgver}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux-armv6.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux-arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux-32bit.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux-64bit.tar.gz")
sha256sums_aarch64=('3b8b12cabb8d1d5ff9e7274c3e16050b3e8cda7e39fa208c8cfe163edea4320a')
sha256sums_armv6h=('400bd560c80e08227704f36c2f9a17d139f4a3239fba7de8be18b9b3c87abde4')
sha256sums_armv7h=('3b8b12cabb8d1d5ff9e7274c3e16050b3e8cda7e39fa208c8cfe163edea4320a')
sha256sums_i686=('744e67bb6485026e0a53521d7963c5cbc7bb22c3b8d76513eb8f594ac8b5add1')
sha256sums_x86_64=('e7daaa48536b686a4f1316f581b60ccdb890184e1820d41cdb9df3fedeb9633e')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}