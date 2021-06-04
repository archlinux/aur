pkgname="ddev-edge-bin"
pkgver=v1.17.3
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.17.3/ddev_linux-amd64.v1.17.3.tar.gz")
sha256sums=("fa173c325717644ed41fede55c5f67ebb6fe2c737c6a89abe964ce920ce7e1b4")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
