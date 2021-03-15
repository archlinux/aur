# Maintainer: Marcin Nowak <marcin.j.nowak+aur AT gmail DOT com>

pkgname=fractalus
pkgver=1.0.0
pkgrel=1
pkgdesc='A fan remake of Rescue on Fractalus, a classic game developed by Lucasfilm Games originally released on Atari, Commodore 64 and other platforms in 1984.'
url=https://www.lsdwa.com/projects/fractalus/
source=(
    "http://downloads.lsdwa.com/projects/fractalus/fractalus-$pkgver-linux.tgz"
    "${pkgname}.desktop"
    "fractalus"
    )
arch=('x86_64')
sha256sums=('1581b6102f940bd07efbb4b1f829398cae59fe60862098f73664fb0e350e8a03'
            '2b6ed647553bc49888b5ad87e37e461b6cdae71c5b43ee396b52d41466a9c77d'
            '0cd092338bff018f91ebaea19cf032ede20f3c03971b713dfbe1470243d4f668')
license=("unknown")

package(){
    install -dm755 ${pkgdir}/opt
    install -dm755 ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -R * ${pkgdir}/opt/${pkgname}
    chmod 755 ${pkgdir}/opt/${pkgname}
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/"
}
