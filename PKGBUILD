# Maintainer: BlucherSKK <blucher1937@proton.me>
pkgname=nymphalis-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="Console downloader for booru sites, manga readers and Patreon"
arch=('x86_64')
url="https://github.com/BlucherSKK/nymphalis"
license=('MIT')
depends=('sqlite')
provides=('nymphalis')
conflicts=('nymphalis')
source_x86_64=("nymphalis-${pkgver}::https://github.com/BlucherSKK/nymphalis/releases/download/v${pkgver}/nymphalis-linux-amd64")
sha256sums_x86_64=('SKIP')

package() {
    install -Dm755 "${srcdir}/nymphalis-${pkgver}" "${pkgdir}/usr/bin/nymphalis"
}
