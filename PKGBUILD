# Maintainer: Sebastian Weisgerber <sweisgerber.dev@gmail.com>
pkgname=synology-note-station
pkgver=2.1.2_241
pkgrel=1
pkgdesc="Note Station for desktop connects you with Note Station on your Synology NAS. You can manage all the notes/to-do list offline, right from your local computer."
arch=('i686' 'x86_64')
url="https://www.synology.com/support/download/"
license=('(C) Synology: Proprietary')
depends=('gconf' 'gtk3' 'libxss' 'nss')
makedepends=('rpmextract')
options=('emptydirs')

if [[ ${CARCH} == "i686" ]]; then
    source=("https://global.download.synology.com/download/Tools/NoteStationClient/2.1.2-241/Fedora/i686/synology-note-station-2.1.2-241-linux-i386.rpm")
    md5sums=('7ff0757a3562ab94a07a3c44c34f6022')
elif [[ ${CARCH} == "x86_64" ]]; then
    source=("https://global.download.synology.com/download/Tools/NoteStationClient/2.1.2-241/Fedora/x86_64/synology-note-station-2.1.2-241-linux-x86_64.rpm")
    md5sums=('9abb955ab7ab2b31685e59a1fd5a3094')
fi

package() {
    cp -rf $srcdir/opt $pkgdir/
    cp -rf $srcdir/usr $pkgdir/
}
