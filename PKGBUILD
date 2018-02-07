# Maintainer: Jesse Bryan <jesse@winneon.moe>
pkgname=watch-with-mpv
pkgver=1.2.9
pkgrel=1
pkgdesc="The native host for the Watch with MPV Chrome extension."
arch=("any")
url="https://github.com/winneon/${pkgname}"
license=("GPL2")
conflicts=("${pkgname}-git")
depends=("mpv>=1:0.27.0" "youtube-dl>=2017.08.06")
options=("!strip") # Required to keep the packaged node binary intact.
source=("https://github.com/winneon/watch-with-mpv/releases/download/${pkgver}/native-linux.zip")
sha256sums=("6631d2f19a1a87d6da86afe5885a5ec9ad8bcfcde61b11d407dda7788ba2bccb")

package() {
    cd "${srcdir}"
    make DESTDIR="${pkgdir}" install
}
