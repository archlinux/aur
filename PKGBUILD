# Maintainer: gkmcd <g at dramati dot cc>
# Contributor: Wyatt J. Brown <sushidudeteam at gmail dot com>

pkgname=prettyping
pkgver=1.0.1
pkgrel=2
epoch=1 # stuck with this for now
pkgdesc='A ping wrapper making the output prettier, more colorful, more compact, and easier to read.'
arch=('any')
url='https://github.com/denilsonsa/prettyping'
license=('MIT')
source=("https://github.com/denilsonsa/prettyping/archive/v$pkgver.tar.gz")
sha512sums=('SKIP')

package()
{
	install -Dm644 "$srcdir/prettyping-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "$srcdir/prettyping-$pkgver/prettyping" "$pkgdir/usr/bin/prettyping"
}
