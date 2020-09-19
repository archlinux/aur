pkgname="ddev-edge-bin"
pkgver=v1.16.0_alpha4
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.16.0-alpha4/ddev_linux.v1.16.0-alpha4.tar.gz")
sha256sums=("f0be3c63e755002ea8573aea46b41f2c0fef84c99ec9e604e8f8c801c717a07c")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
