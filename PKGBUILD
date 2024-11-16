# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="edu-sync-bin"
pkgver=0.2.3
pkgrel=1
pkgdesc="A command line application for synchronizing the contents of Moodle instances to your computer."
url="http://edu-sync.org/"
license=("GPL-3.0")
arch=("x86_64")
provides=("edu-sync")
conflicts=("edu-sync" "edu-sync-git")
depends=("dbus")
source=("https://github.com/mkroening/edu-sync/releases/download/v$pkgver/edu-sync-cli-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
b2sums=('73cbb0ab6e9fad642c3c4f3c516cfd3c1e36d5b4b3eddfcca05e27a95cc79d65498cdfce1e5d3c92ee9ff3bc3644215a5b3858d06daeb0b331012636879fdd7e')
options=(!strip)

package(){
 install -D -m 755 "edu-sync-cli-v$pkgver-x86_64-unknown-linux-gnu/edu-sync-cli" -t "$pkgdir/usr/bin"
}
