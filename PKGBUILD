pkgname=tunl
pkgver=0.25.0
pkgrel=1
pkgdesc='Expose your localhost to the public'
arch=('x86_64')
url="https://github.com/pjvds/tunl"
makedepends=()
source=("$url/releases/download/$pkgver/tunl_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('c1c7de34d309ea0d39a42dfa517c62da63dc28eae5b0608a205169d36945bd06')

package() {
  install -Dm755 ./tunl "${pkgdir}/usr/bin/tunl"

	install -Dm644 ./autocomplete/bash/tunl "${pkgdir}/etc/bash_completion.d/tunl"
	install -Dm644 ./autocomplete/zsh/tunl "${pkgdir}/usr/share/zsh/site-functions/_tunl"
}
