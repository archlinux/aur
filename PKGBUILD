# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=cloudabi-pkg-config
pkgver=1
pkgrel=1
pkgdesc="CloudABI wrapper for pkg-config."
url='https://www.freedesktop.org/wiki/Software/pkg-config/'
license=(GPL)
arch=(any)

depends=(
	'pkg-config'
)

source=(
	'x86_64-unknown-cloudabi-pkg-config'
	'aarch64-unknown-cloudabi-pkg-config'
)

sha512sums=(
	'ce9e12345472fc679edfb1c30e2c002e4858b2043feae2cc2578dc1ab6699d6ca9442d22d1951674197db363b1bf260047eedd656f05629fcec0268523fe69cb'
	'ed36ced4c6a58871d45928f6a84818d3231b85682eb10c4f194507b8fc983d7398663790514a0ff04830290564d360465a2285ce8a2b9e7989d882cd22619c63'
)

package() {
	install -d "$pkgdir/usr/bin"
	install -m 755 -t "$pkgdir/usr/bin" "$srcdir/x86_64-unknown-cloudabi-pkg-config"
	install -m 755 -t "$pkgdir/usr/bin" "$srcdir/aarch64-unknown-cloudabi-pkg-config"
}
