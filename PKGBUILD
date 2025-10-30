# Maintainer: osoite <osoite@firemail.cc>
pkgname=eyerest
pkgver=0.0.5
pkgrel=3
pkgdesc="Remind your eyes via libnotify to have a little break from the screen."
arch=('any')
url="https://git.sr.ht/~syntax/eyerest"
license=('GPL3')
depends=('bash' 'coreutils' 'libnotify')
source=("git+https://git.sr.ht/~syntax/eyerest")
sha256sums=('SKIP')
install=eyerest.install

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "usr/bin/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "etc/eyerest/config.ini" "$pkgdir/etc/$pkgname/config.ini"
    install -Dm644 "etc/eyerest/notifications.txt" "$pkgdir/etc/$pkgname/notifications.txt"
}

