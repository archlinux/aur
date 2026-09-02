# Maintainer: puddings233 <puddings233 at outlook dot com>

pkgname=ctex2png
pkgver=0.1.0
pkgrel=1
pkgdesc="A Python tool to convert CTEX files to PNG images."
arch=('any')
url="https://github.com/grandwo/ctex2png"
license=('custom')
depends=('python-pillow')
source=("git+$url.git")
sha256sums=('SKIP')

package() {
	cd "$pkgname"
	{ echo '#!/usr/bin/env python3'; cat "main.py"; } | \
		install -Dm755 /dev/stdin "$pkgdir/usr/bin/ctex2png"
}
