# Maintainer: Sebastian Weisgerber <sweisgerber.dev@gmail.com>
pkgname=synology-note-station
pkgver=2.0.225
pkgrel=2
pkgdesc="Note Station for desktop connects you with Note Station on your Synology NAS. You can manage all the notes/to-do list offline, right from your local computer."
arch=('i686' 'x86_64')
url="https://www.synology.com/support/download/"
license=('(C) Synology: Proprietary')
depends=('gconf' 'gtk3' 'libxss' 'nss')
makedepends=('rpmextract')
options=('emptydirs')

if [[ "$CARCH" == "i686" ]]; then
    source=("https://global.download.synology.com/download/Tools/NoteStationClient/2.0.225/Fedora/i686/synology-note-station-2.0.225-linux-i386.rpm")
    md5sums=('27b34e73582e90f4eb5ae5a634a29440')
elif [[ "$CARCH" == "x86_64" ]]; then
    source=("https://global.download.synology.com/download/Tools/NoteStationClient/2.0.225/Fedora/x86_64/synology-note-station-2.0.225-linux-x86_64.rpm")
    md5sums=('e9eee6e055f11c5ec301f12c3fe1e560')
fi

package() {
    cp -rf $srcdir/opt $pkgdir/
    cp -rf $srcdir/usr $pkgdir/
}
