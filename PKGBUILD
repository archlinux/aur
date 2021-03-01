pkgname=tunl
pkgver=0.35.0
pkgrel=1
pkgdesc='Expose your localhost to the public'
arch=('x86_64')
url="https://github.com/pjvds/tunl"
makedepends=()
source=("$url/releases/download/$pkgver/tunl_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('facbca435fe27acfd740255b10bea4c11e8cc5fcdc05fcdf98768fde8f9a21c6')

package() {
  install -Dm755 ./tunl "${pkgdir}/usr/bin/tunl"

	install -Dm644 ./autocomplete/bash/tunl "${pkgdir}/etc/bash_completion.d/tunl"
	install -Dm644 ./autocomplete/zsh/tunl "${pkgdir}/usr/share/zsh/site-functions/_tunl"
}
