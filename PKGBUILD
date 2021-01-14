pkgname="ddev-edge-bin"
pkgver=v1.17.0_alpha3
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.17.0-alpha3/ddev_linux-amd64.v1.17.0-alpha3.tar.gz")
sha256sums=("460bdae4af3fdd7db97e17f91ec87a4011cb996d64ac98434af599834b2bd08d")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
