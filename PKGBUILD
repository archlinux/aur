# Contributor: piernov <piernov@piernov.org>

pkgname=utf8.h
pkgver=r199.ce48f0e
pkgrel=1
pkgdesc='Simple one header solution to supporting utf8 strings in C and C++'
license=('Unlicense')
arch=('any')
url='https://github.com/sheredom/utf8.h'
makedepends=('git')
source=("git+https://github.com/sheredom/utf8.h.git")
sha1sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${pkgname}"
	install -dm 755 "${pkgdir}/usr/include/utf8"
	install -D -m 644 "utf8.h" "${pkgdir}/usr/include/utf8"
}
