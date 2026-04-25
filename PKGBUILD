# Maintainer: Keiran <keircn@proton.me>
pkgname=seanime-bin
pkgver=3.7.0
pkgrel=1
pkgdesc="A self-hosted server that seamlessly integrates with your local anime collection with anilist integration."
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
conflicts=()
depends=()
source=("https://github.com/5rahim/seanime/releases/download/v${pkgver}/seanime-${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('133caa2b209a52aaf1b668a090f56411ad1a7eea0e41319913574999247349de')

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/seanime" "${pkgdir}/usr/bin/seanime"
}
