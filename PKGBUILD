pkgname=('windutils')
pkgver=1.0
pkgrel=1
arch=('any')
license=('MIT')
source=('iwdtui.sh' 'syssertui.sh')
md5sums=('SKIP' 'SKIP')  # or use actual checksums

package() {
    pkgdesc="A collection of TUIs made with gum for popular CLIs. Currently providing TUIs for: iwd, systemctl"
    depends=('gum' 'iwd')
    install -Dm755 "$srcdir/iwdtui.sh" "$pkgdir/usr/bin/iwdtui"
    install -Dm755 "$srcdir/syssertui.sh" "$pkgdir/usr/bin/syssertui"
}
