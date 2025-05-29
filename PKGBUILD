pkgname=wind-utils
pkgver=1.0
pkgrel=1
pkgdesc="A collection of useful TUIs for CLIs. Curently for iwd and system services."
arch=('any')
license=('MIT')
depends=('gum')
source=('iwdtui.sh' 'syssertui.sh')
md5sums=('SKIP' 'SKIP')  # or use actual checksums

package() {
    install -Dm755 "$srcdir/iwdtui.sh" "$pkgdir/usr/bin/iwdtui"
    install -Dm755 "$srcdir/syssertui.sh" "$pkgdir/usr/bin/syssertui"
}
