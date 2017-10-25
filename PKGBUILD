# Maintainer: Garrett <floft.net/contact>
pkgname=spinach
pkgver=0.5.15
pkgrel=1
pkgdesc="Another AUR helper written in Bash"
arch=('any')
url="https://github.com/floft/spinach"
license=('ISC')
depends=('expac' 'jshon')
makedepends=('git')
backup=('etc/spinach.conf')
source=("$pkgname::git+https://github.com/floft/spinach")
md5sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 "${pkgname}"  "$pkgdir/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.1" "$pkgdir/usr/share/man/man1/${pkgname}.1"
    install -Dm644 config "$pkgdir/etc/${pkgname}.conf"
}
