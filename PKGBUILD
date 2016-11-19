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
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
changelog=
source=("traktor_arch.sh" "traktor_tunnel" "traktor_untunnel" "traktor_torrc-update")
noextract=()

package() {
cd "$srcdir"
    
    install -Dm 755 traktor_tunnel ${pkgdir}/usr/bin/traktor_tunnel
    install -Dm 755 traktor_arch.sh ${pkgdir}/usr/bin/traktor_configure
    install -Dm 755 traktor_untunnel ${pkgdir}/usr/bin/traktor_untunnel
    install -Dm 755 traktor_torrc-update ${pkgdir}/usr/bin/traktor_torrc-update
}

