# Maintainer: Quirky1869 <quirky1869@users.noreply.github.com>
pkgname=glideftp-bin
pkgver=1.7.8
pkgrel=1
pkgdesc="Desktop FTP/SFTP client"
arch=('x86_64')
url="https://github.com/Quirky1869/GlideFTP"
license=('MIT')
depends=('webkit2gtk-4.1')
provides=('glideftp')
conflicts=('glideftp')

# The Linux archive contains: GlideFTP (binary), glideftp.desktop, glideftp.png, README.md
source_x86_64=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/Quirky1869/GlideFTP/releases/download/v${pkgver}/GlideFTP-Linux-v${pkgver}.tar.gz"
)
sha256sums_x86_64=('b7db19eedd7cf2de2871d2cf519b043282b57fc5ed1f1828b3a2a6c0a7f10414')

package() {
    install -Dm755 "${srcdir}/GlideFTP"           "${pkgdir}/usr/bin/glideftp"
    install -Dm644 "${srcdir}/glideftp.desktop"   "${pkgdir}/usr/share/applications/glideftp.desktop"
    install -Dm644 "${srcdir}/glideftp.png"       "${pkgdir}/usr/share/icons/hicolor/256x256/apps/glideftp.png"
}
