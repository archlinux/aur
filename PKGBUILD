pkgname=tunl
pkgver=0.19.0
pkgrel=1
pkgdesc='Expose your localhost to the public'
arch=('x86_64')
url="https://github.com/pjvds/tunl"
makedepends=()
source=("$url/releases/download/$pkgver/tunl_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('efe23dc9abcdcbe86ee2f1727ba440604b0dd578e49bdce5cf47949118e80da1')

package() {
	cd "${srcdir}"

  install -Dm755 tunl $pkgdir/usr/bin/tunl

	install -Dm644 autocomplete/bash/tunl "{pkgdir}/etc/bash_completion.d/tunl"
	install -Dm644 autocomplete/zsh/tunl "{pkgdir}/usr/share/zsh/site-functions/_tunl"
}
