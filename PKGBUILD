pkgname="ddev-edge-bin"
pkgver=v1.17.0_alpha4
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.17.0-alpha4/ddev_linux-amd64.v1.17.0-alpha4.tar.gz")
sha256sums=("335b26370920daf46697b7ba395ae6b4e53c4ac9e0fc9a02361ae5efe34cba30")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
