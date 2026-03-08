# Maintainer: Dasun P
pkgname=bolt-dm-bin
pkgver=0.3.0_beta
pkgrel=1
pkgdesc="Fast multi-segment download manager"
arch=('x86_64')
url="https://github.com/dasunNimantha/bolt"
license=('MIT')
depends=('gtk3' 'openssl' 'fontconfig')
provides=('bolt-dm')
conflicts=('bolt-dm')
source=("${url}/releases/download/v${pkgver//_/-}/bolt-linux-x86_64"
        "bolt.desktop"
        "bolt.svg")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
    install -Dm755 "${srcdir}/bolt-linux-x86_64" "${pkgdir}/usr/bin/bolt"
    install -Dm644 "${srcdir}/bolt.desktop" "${pkgdir}/usr/share/applications/bolt.desktop"
    install -Dm644 "${srcdir}/bolt.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/bolt.svg"
}
