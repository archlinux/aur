# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=fipolate-custom
pkgver=2017.1.7
pkgrel=1
pkgdesc="Interpolate text files with variables through a fifo via user prompts."
arch=("any")
license=("GPL2")
url="https://github.com/djmattyg007/fipolate-custom"
depends=("python" "python-pyinotify")
provides=("fipolate")
conflicts=("fipolate")
source=("https://github.com/djmattyg007/fipolate-custom/archive/${pkgver}.tar.gz")
sha256sums=("572d7378ead2cd743c3ef7149c380d494f8250b5a2ef30e0d360cb65e6aa40c2")

package () {
    install -Dm755 "fipolate-custom-${pkgver}/fipolate" "${pkgdir}/usr/bin/fipolate"
}
