pkgname=tunl
pkgver=0.28.1
pkgrel=1
pkgdesc='Expose your localhost to the public'
arch=('x86_64')
url="https://github.com/pjvds/tunl"
makedepends=()
source=("$url/releases/download/$pkgver/tunl_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('2038d4f2883d2298bff3530a567b59f954b4adfc60ae60af6c0547697e7ead27')

package() {
  install -Dm755 ./tunl "${pkgdir}/usr/bin/tunl"

	install -Dm644 ./autocomplete/bash/tunl "${pkgdir}/etc/bash_completion.d/tunl"
	install -Dm644 ./autocomplete/zsh/tunl "${pkgdir}/usr/share/zsh/site-functions/_tunl"
}
