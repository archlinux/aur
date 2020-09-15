# Maintainer: John Turner <jturner.usa+au@gmail.com>

pkgname=ezzram
depends=("python-psutil")
provides=("$pkgname")
conflicts=("$pkgname")
pkgver=first_release
pkgrel=3
arch=("x86_64")

source=("https://github.com/Jturnerusa/ezzram/releases/download/first_release/ezzram.tar.zst")

sha256sums=("20bfd3d20af570c0822249eeaa3ed2c1793bd9095c441f0b2dd2202c6f2cab86")

package()
{
	install -Dm755 "$srcdir/$pkgname.py" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "$srcdir/$pkgname.conf" "$pkgdir/etc/$pkgname.conf"
}
