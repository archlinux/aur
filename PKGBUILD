pkgname=tunl
pkgver=0.23.0
pkgrel=1
pkgdesc='Expose your localhost to the public'
arch=('x86_64')
url="https://github.com/pjvds/tunl"
makedepends=()
source=("$url/releases/download/$pkgver/tunl_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('3b76d08993b239ac2491734440fc99df8796637274f14fceb214b88722c9cb71')

package() {
  install -Dm755 ./tunl "${pkgdir}/usr/bin/tunl"

	install -Dm644 ./autocomplete/bash/tunl "${pkgdir}/etc/bash_completion.d/tunl"
	install -Dm644 ./autocomplete/zsh/tunl "${pkgdir}/usr/share/zsh/site-functions/_tunl"
}
