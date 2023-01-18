# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="edu-sync-bin"
pkgver=0.1.2
pkgrel=1
pkgdesc="A command line application for synchronizing the contents of Moodle instances to your computer."
url="http://edu-sync.org/"
license=("GPL3")
arch=("x86_64")
provides=("edu-sync")
conflicts=("edu-sync" "edu-sync-git")
depends=("dbus")
source=("https://github.com/mkroening/edu-sync/releases/download/v$pkgver/edu-sync-cli-v$pkgver-linux.tar.gz")
sha256sums=('6d81486e635ec797606ed2fd9632d9923fe37381f5d17d3195822e4d108b54f8')
options=(!strip)

package(){
 install -D -m 755 "edu-sync-cli-v$pkgver-linux/edu-sync-cli" -t "$pkgdir/usr/bin"
}
