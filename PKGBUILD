pkgname="ddev-edge-bin"
pkgver=v1.16.0_alpha6
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.16.0-alpha6/ddev_linux-amd64.v1.16.0-alpha6.tar.gz")
sha256sums=("17923a1e05691572050f66c1778b15c08b5ca7e52d6d8f7fe5a903c8bf79d32d")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
