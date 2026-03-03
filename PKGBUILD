# Maintainer: Keiran <keircn@proton.me>
pkgname=seanime-bin
pkgver=3.5.2
pkgrel=1
pkgdesc="A self-hosted server that seamlessly integrates with your local anime collection with anilist integration."
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
conflicts=()
depends=()
source=("https://github.com/5rahim/seanime/releases/download/v${pkgver}/seanime-${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('53058a2286caccf1bed1363a8564af7cb80ede184843599c9afd4ed743b20f79')

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/seanime" "${pkgdir}/usr/bin/seanime"
}
