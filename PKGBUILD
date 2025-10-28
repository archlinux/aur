# Maintainer: osoite <osoite@firemail.cc>
pkgname=eyerest
pkgver=0.0.3
pkgrel=2
pkgdesc="Script to remind your eyes to have a little break from the screen."
arch=('any')
url="https://git.sr.ht/~syntax/eyerest"
license=('GPL3')
depends=('bash' 'coreutils' 'libnotify')
source=("git+https://git.sr.ht/~syntax/eyerest")
sha256sums=('SKIP')
install=eyerest.install

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "script/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "config/conf" "$pkgdir/etc/$pkgname/conf"
    install -Dm644 "config/messages" "$pkgdir/etc/$pkgname/messages"
}

