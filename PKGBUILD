# Maintainer: levinit <levinit@outlook.com>
pkgname=adhosts
pkgver=1.0.1
pkgrel=1
_commit=9684071bd3b53678c96deffcd08aeeed29d73b47
pkgdesc="update blocking ads hosts.更新屏蔽广告的hosts."
arch=(any)
url="https://github.com/levinit/adhosts"
license=('LGPL3')
depends=('curl')

source=("$pkgname-$pkgver.tar.gz::https://github.com/levinit/adhosts/archive/${_commit}.tar.gz")
sha256sums=('b3062b66b463857b49aeb7be36b7a72d0cd700b7ec728d4b0811bea6dbf5bcd6')

package() {
	cd "$srcdir/$pkgname-$_commit"
	install -Dm755 $pkgname "$pkgdir/usr/bin/adhosts"
}
