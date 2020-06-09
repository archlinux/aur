pkgname="ddev-edge-bin"
pkgver=v1.15_test994
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/rfay/ddev/releases/download/v1.15-test994/ddev_linux.v1.15-test994.tar.gz")
sha256sums=("b486ac7b131f30ba0b7b4e048ea2673e2813fd56353db1be6d17519c43721149")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
