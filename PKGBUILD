# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=deadbeef-plugin-jack
pkgname=$_pkgname-bin
pkgver=20200322.62d1e6a
pkgrel=1
pkgdesc="JACK output plugin for DeaDBeeF music player (binary release)"
url="https://github.com/DeaDBeeF-Player/jack"
url2="http://deadbeef.sourceforge.net/plugins.html"
arch=('x86_64')
license=('MIT')
depends=('deadbeef' 'jack')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("http://sourceforge.net/projects/deadbeef/files/plugins/x86_64/jack-62d1e6a-x86_64.zip"
        "$url/raw/62d1e6ac0452b7baa92fcc75b59bcb960df06da8/COPYING")
sha256sums=('68e3d94ec22f197d632a6475d6afa5c3b3ee186d901b082ff2a7a0b489ba9804'
            'e7892882e2e334c920626aede9aec9b397e55771eb1aea2a763cd02763e66412')

package() {
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 plugins/jack.so -t "$pkgdir/usr/lib/deadbeef"
}
