# Maintainer: fiatjaf <fiatjaf@gmail.com>

pkgname="nwiki-bin"
pkgver="0.3.0"
pkgrel="1"
pkgdesc="Command line tool for interacting with Nostr wiki articles"
arch=("x86_64")
url="https://github.com/fiatjaf/nwiki"
license=("Unlicense")
depends=()
provides=("nwiki")
conflicts=("nwiki")
source=("nwiki::https://github.com/fiatjaf/nwiki/releases/download/v0.3.0/nwiki_linux_amd64")
sha256sums=('2046385bc1a30bc947f9951a6ba901fee722345acf4e10caa0b34f3c09ec5212')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s nwiki "$pkgdir/usr/bin/nwiki"
    install -m755 nwiki "$pkgdir/usr/bin"
}
