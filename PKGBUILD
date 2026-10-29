# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="edu-sync-bin"
pkgver=0.3.3
pkgrel=1
pkgdesc="A command line application for synchronizing the contents of Moodle instances to your computer."
url="http://edu-sync.org/"
license=("GPL-3.0")
arch=("x86_64")
provides=("edu-sync")
conflicts=("edu-sync" "edu-sync-git")
depends=("dbus")
source=("https://github.com/mkroening/edu-sync/releases/download/v$pkgver/edu-sync-cli-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
b2sums=('2cdce298c8c1bb13dbc2d817596f0414ad902203b0d56f61ff67d9e5fa031a6f5fdfe393c672c726465d53e5de2768fd44c42b9580714738f2dfa8abb1a6e99e')
options=(!strip)

package(){
 install -D -m 755 "edu-sync-cli-v$pkgver-x86_64-unknown-linux-gnu/edu-sync-cli" -t "$pkgdir/usr/bin"
}
