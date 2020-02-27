# Maintainer: kvaps <kvapss@gmail.com>
pkgname=i3lock-multimonitor
pkgver=b6aca0b4079c2771df8ceb5965d02b19e5ec5fa9
pkgrel=1
pkgdesc="Custom image lock screen for i3lock with multimonitor support "
arch=('any')
url="https://github.com/ShikherVerma/i3lock-multimonitor"
license=('MIT')
depends=('coreutils' 'bash' 'imagemagick' 'i3lock')
provides=('i3lock-multimonitor')
source=("https://github.com/ShikherVerma/$pkgname/archive/$pkgver.tar.gz")
md5sums=('SKIP')

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    install -m 0755 -d "$pkgdir/usr/bin"
    install -m 0755 -d "$pkgdir/usr/share/i3lock-multimonitor/img"
    install -m 0755 "lock" "$pkgdir/usr/bin/i3lock-multimonitor"
    install -m 0644 "img/background.png" "$pkgdir/usr/share/i3lock-multimonitor/img/background.png"
}
