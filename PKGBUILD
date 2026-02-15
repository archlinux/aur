# Maintainer: Keiran <keircn@proton.me>
pkgname=seanime-bin
pkgver=3.5.0
pkgrel=1
pkgdesc="A self-hosted server that seamlessly integrates with your local anime collection with anilist integration."
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
conflicts=()
depends=()
source=("https://github.com/5rahim/seanime/releases/download/v${pkgver}/seanime-${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('ddd24c888f7881c5bbdd5a26d0d88b7ffdfa676d5c175c99da01c71b54d62ab5')

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/seanime" "${pkgdir}/usr/bin/seanime"
}
