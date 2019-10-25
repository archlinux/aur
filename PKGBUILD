# Maintainer: stardust95
# Contributor: stardust95
pkgname=key-tools
pkgver=0.1
pkgrel=1
pkgdesc='Tools to automatically analyse and tag the key of music files.'
arch=('i686' 'x86_64')
url="http://www.pogo.org.uk/~mark/${pkgname}/"
license=('GPL3')
source=("http://www.pogo.org.uk/~mark/${pkgname}/releases/${pkgname}-${pkgver}.tar.gz")
sha512sums=('749bb71ed9e4343ca5b8ba3586b1855a6ca134ba6375a57451b4f5cfe6bebbdc6970263f5f54df7baaf12ada1eaf7034ddc0889c689e2751423b1081d9e561bd')

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make install PREFIX=/usr DESTDIR="${pkgdir}"
}

