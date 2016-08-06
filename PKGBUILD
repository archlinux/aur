# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname='doctl'
pkgver='1.4.0'
pkgrel=1
pkgdesc="A command-line client for DigitalOcean."
arch=('x86_64')
url="https://github.com/digitalocean/doctl"
license=('Apache')

_watch="https://github.com/digitalocean/doctl/releases/"
source=("https://github.com/digitalocean/doctl/releases/download/v${pkgver}/doctl-${pkgver}-linux-amd64.tar.gz")
sha256sums=('97c8cb19bcc66901a7166f4ed471d5fe033c7d445767bfc34a145230048efa6e')

package() {
	cd "$srcdir"

	install -D doctl "$pkgdir"/usr/bin/doctl
}
