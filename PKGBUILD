# Maintainer: Keiran <keircn@proton.me>
pkgname=seanime-bin
pkgver=3.6.1
pkgrel=1
pkgdesc="A self-hosted server that seamlessly integrates with your local anime collection with anilist integration."
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
conflicts=()
depends=()
source=("https://github.com/5rahim/seanime/releases/download/v${pkgver}/seanime-${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('9b993459ec4045d5de03ed8aea796356c782682fd9e208e13ec1e19b850af50a')

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/seanime" "${pkgdir}/usr/bin/seanime"
}
