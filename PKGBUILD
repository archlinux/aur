# Maintainer: Alyxia Sother <nylkvn@evfrhc.arg(rot13)>

_pkgname=blahaj
pkgname=$_pkgname-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Gay sharks at your local terminal - lolcat-like CLI tool"
provides=('blahaj')
conflicts=('blahaj' 'blahaj-git')
url="https://github.com/GeopJr/BLAHAJ"
arch=('x86_64')
license=('BSD-2-Clause')

source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64-static.zip")
sha256sums=("b544e13db79d40ed31c98c9b26c7ddc21535a908016f23aa3d78d39d9b3a1057")

package() {
    chmod +x blahaj
    chmod 755 blahaj
    install -D blahaj "${pkgdir}/usr/bin/blahaj"
    # # Move files to right directories
    # install -d "$pkgdir"/opt/armcord
    # cp -a * "$pkgdir"/opt/armcord
    #
    # # Set up the executables
    # install -d "$pkgdir"/usr/bin
    # ln -s /opt/armcord/armcord "$pkgdir"/usr/bin/armcord
    #
    # # Correct permissions
    # chmod +x -R "$pkgdir"/opt/armcord/*
    # chmod 755 "$pkgdir"/opt/armcord/armcord
    #
    # install -Dm644 "${srcdir}/armcord.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    # install -Dm644 "${srcdir}/armcord.png" "${pkgdir}/usr/share/pixmaps/armcord.png"
}
