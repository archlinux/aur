# Maintainer: Vyacheslav Levit <dev@vlevit.org>
pkgname=xatk
pkgver=0.2.2
pkgrel=1
pkgdesc="xatk is a window switcher which assigns keybindings to windows dynamically"
arch=('any')
url="https://github.com/vlevit/xatk"
license=('GPL2')
depends=('python2-xlib')
source=("https://github.com/vlevit/$pkgname/archive/$pkgname-$pkgver.tar.gz")
md5sums=('071a740a0c9b3120970d14d40b2e56ec')

package() {
	cd "$pkgname-$pkgname-$pkgver"
    install -Dm0755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -dm755 "${pkgdir}/usr/share/doc/$pkgname"
    install -m644 README.rst Changelog docs/*.rst "${pkgdir}/usr/share/doc/$pkgname"
}
