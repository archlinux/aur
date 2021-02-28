pkgname=tunl
pkgver=0.34.0
pkgrel=1
pkgdesc='Expose your localhost to the public'
arch=('x86_64')
url="https://github.com/pjvds/tunl"
makedepends=()
source=("$url/releases/download/$pkgver/tunl_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('9ab8fb9375fa82eb51a4321de5cae415bed28240b213b1783125c235574bdc27')

package() {
  install -Dm755 ./tunl "${pkgdir}/usr/bin/tunl"

	install -Dm644 ./autocomplete/bash/tunl "${pkgdir}/etc/bash_completion.d/tunl"
	install -Dm644 ./autocomplete/zsh/tunl "${pkgdir}/usr/share/zsh/site-functions/_tunl"
}
