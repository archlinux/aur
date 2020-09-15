# Maintainer: John Turner <jturner.usa+au@gmail.com>

pkgname=ezzram
depends=("python-psutil")
provides=("$pkgname")
conflicts=("$pkgname")
pkgver=first_release
pkgrel=2
arch=("x86_64")

source=("https://github.com/Jturnerusa/ezzram.git")

sha256sums=("SKIP")

package()
{
	install -Dm755 "$srcdir/$pkgname.py" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "$srcdir/$pkgname.conf" "$pkgdir/etc/$pkgname.conf"
}
