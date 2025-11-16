# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="edu-sync-bin"
pkgver=0.3.2
pkgrel=1
pkgdesc="A command line application for synchronizing the contents of Moodle instances to your computer."
url="http://edu-sync.org/"
license=("GPL-3.0")
arch=("x86_64")
provides=("edu-sync")
conflicts=("edu-sync" "edu-sync-git")
depends=("dbus")
source=("https://github.com/mkroening/edu-sync/releases/download/v$pkgver/edu-sync-cli-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
b2sums=('6b6a1a5f8d8ea49b4d96e30898321838c7a3f0a2c12e7d426a0745ac69257a2800ac53dacaf0548c1a7fce24112e8ee164f321761fff390c3c718de9800604a9')
options=(!strip)

package(){
 install -D -m 755 "edu-sync-cli-v$pkgver-x86_64-unknown-linux-gnu/edu-sync-cli" -t "$pkgdir/usr/bin"
}
