# Maintainer: MalikHw47 <help.malicorporation@gmail.com>
pkgname=hwytvidgrabber-bin
pkgver=1.3
pkgrel=1
pkgdesc="A smol YouTube video downloader by MalikHw47 (Lightweight af)"
arch=('x86_64')
url="https://github.com/MalikHw/HwYtVidGrabber"
license=('MIT')
depends=('ffmpeg')
provides=('hwytvidgrabber')
conflicts=('hwytvidgrabber')
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/HwYtVidGrabber-Linux"
        "${pkgname}-${pkgver}.desktop::${url}/releases/download/v${pkgver}/hwytvidgrabber.desktop"
        "${pkgname}-${pkgver}.png::${url}/releases/download/v${pkgver}/icon.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
    # Install the binary
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/HwYtVidGrabber"
    
    # Install desktop file
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.desktop" "${pkgdir}/usr/share/applications/hwytvidgrabber.desktop"
    
    # Install icon
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/hwytvidgrabber.png"
}
