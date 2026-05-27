# Maintainer: Teddy Nunyah <iloveoldmenandwomen@gmail.com>
# Maintainer: Evie <evie at 0ci dot org>

pkgname=regex-magic
pkgver=1.0
pkgrel=1
pkgdesc="Regex Magic 🪄✨🚀"
arch=(any)
url="[TODO]"
license=("GPL-3.0-or-later")
depends=("coreutils" "sed")
makedepends=("git")
source=("git+https://github.com/0ci/${pkgname}")
md5sums=(SKIP)

prepare() {
	cd "$pkgname"
	chmod +x regex-magic
}

package() {
	cd "$pkgname"
	mkdir --parents "$pkgdir/usr/bin"
	mv regex-magic "$pkgdir/usr/bin/regex-magic"
}
