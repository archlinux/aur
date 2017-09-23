# Maintainer: Jesse Bryan <jesse@winneon.moe>
pkgname=watch-with-mpv
pkgver=1.2.8
pkgrel=2
pkgdesc="The native host for the Watch with MPV Chrome extension."
arch=("any")
url="https://github.com/winneon/${pkgname}"
license=("GPL2")
conflicts=("${pkgname}-git")
depends=("mpv>=1:0.27.0" "youtube-dl>=2017.08.06")
options=("!strip") # Required to keep the packaged node binary intact.
source=("https://github.com/winneon/watch-with-mpv/releases/download/${pkgver}/native-linux.zip")
sha256sums=("27132545e548b447f21f1ec0a5bdfd959a8b0584770545492d8eb13211343216")

package() {
    cd "${srcdir}"
    make DESTDIR="${pkgdir}" install
}
