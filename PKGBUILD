# Maintainer: Keiran <keircn@proton.me>
pkgname=seanime-bin
pkgver=3.8.1
pkgrel=1
pkgdesc="A self-hosted server that seamlessly integrates with your local anime collection with anilist integration."
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
conflicts=()
depends=()
source=("https://github.com/5rahim/seanime/releases/download/v${pkgver}/seanime-${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('911b3dc3ceb75ab6fd4c14e193cee80055719bccc7e1fb5ea7afc4137a3cb7e3')

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/seanime" "${pkgdir}/usr/bin/seanime"
}
