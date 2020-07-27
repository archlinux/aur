# Maintainer: VVL <me@ivvl.ru>
# Contributor: VVL <me@ivvl.ru>

pkgname=easy-gpg-to-paper
pkgver=20190901.0661440
pkgrel=1
pkgdesc="easy-gpg-to-paper aims to make exporting your secret gpg key to paper, and then restoring from paper, an easy and painless process"
arch=(any)
url="https://github.com/balos1/easy-gpg-to-paper"
license=('MIT')
source=("git+https://github.com/balos1/easy-gpg-to-paper.git")
depends=('paperkey' 'zbar' 'python-pillow' 'python-qrcode')
md5sums=('SKIP')
package() {
	cd "${pkgname}"
	install -Dm755 "gpg2paper/gpg2paper.py" "$pkgdir/usr/bin/gpg2paper"
	install -Dm644 README.md -t "$pkgdir/usr/share/docs/$pkgname"
}
