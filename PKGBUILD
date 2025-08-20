# Maintainer: Seven Kingdoms: Ambition Team <seven-kingdoms-ambition-discuss@lists.sourceforge.net>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>

pkgname=7k-ambition-music
pkgver=3.0.0
pkgrel=1
pkgdesc="Music set for Seven Kingdoms: Ambition"
url="https://seven-kingdoms-ambition.sourceforge.io/"
arch=("any")
license=("custom")
depends=("7kaa-music")


package() {
    # MUSIC directory
    cd "${srcdir}/${pkgname}/"
    ln -s "../7kaa/MUSIC"

    # Readme and licence
    cd "${pkgdir}/usr/share/doc/${pkgname}"
    ln -s "../7kaa/README-Music.txt"
    ln -s "../7kaa/COPYING-Music.txt"
}
