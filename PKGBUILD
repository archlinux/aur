# Maintainer: Amirreza Firoozi <firoozi128 dot af at gmail dot com>
pkgname=traktor
pkgver=1.3
pkgrel=1
epoch=
pkgdesc="An automated Tor installer  "
arch=('i686' 'x86_64')
url="https://github.com/AmirrezaFiroozi/traktor/tree/ArchLinux"
license=('GPL3')
depends=('tor' 'obfsproxy' 'polipo' 'dnscrypt-proxy' )
optdepends=('tor-browser-en-ir')

install="traktor.install"
md5sums=('SKIP')
changelog=
source=("traktor_arch.sh")
noextract=()

package() {
cd "$srcdir"

    install -Dm 755 traktor_arch.sh ${pkgdir}/usr/bin/traktor_configure
}

