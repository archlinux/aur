# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname='doctl'
pkgver='1.3.1'
pkgrel=2
pkgdesc="A command-line client for Digital Ocean."
arch=(any)
url="https://github.com/digitalocean/doctl"
license=('Apache')

source=("https://github.com/digitalocean/doctl/releases/download/v${pkgver}/doctl-${pkgver}-linux-amd64.tar.gz")
sha256sums=('9d8e22773dae0ff6e129e090658413a2bd44171ec260458b72be8dbcbed51aed')

package() {
	cd "$srcdir"

	install -D doctl "$pkgdir"/usr/bin/doctl
}
