# Maintainer: Ben Lönnqvist (silentnoodle) <lonnqvistben at gmail dot com>
pkgname="kingmakercharactereditor"
pkgver=1.0.3
pkgrel=1
pkgdesc="Character editor for Pathfinder: Kingmaker by Owlcat Games."
arch=("x86_64")
url="https://github.com/ericfitzgerald/KingmakerCharacterEditor"
license=("GPL3")
source=("https://github.com/ericfitzgerald/KingmakerCharacterEditor/releases/download/v${pkgver}/${pkgname}-linux-x64.zip")
md5sums=('d0403bab18f65cda1e9b234434dbb707')

package() {
    install -d $pkgdir/{opt/$pkgname,usr/bin}
    cp -dr "$srcdir/${pkgname}-linux-x64/." "$pkgdir/opt/${pkgname}/"
    ln -s /opt/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
    chmod -R ugo+rx $pkgdir/opt/$pkgname/$pkgname
}
