# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=otf-route159
pkgdesc='Sans-serif font by dot-colon optimized for on-screen readability'
url=https://dotcolon.net/fonts/route159/
pkgver=1.10
pkgrel=1
arch=(any)
license=(OFL-1.1)
source=("$pkgname-$pkgver.zip::https://dotcolon.net/files/fonts/route159_${pkgver//./}.zip")
sha256sums=('d0cfa7fa94ec2698095ece7f754ef4cc8ceb303d44057f894318ad663d71bbe5')

package () {
	install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" *.otf
}
