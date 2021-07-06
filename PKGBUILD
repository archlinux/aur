pkgname="ddev-bin"
pkgver=v1.17.7
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.17.7/ddev_linux-amd64.v1.17.7.tar.gz")
sha256sums=("0563fdf9ca19d9fb86771f39cfa150c424e5e5f2c9b6452fdd3b381dad8fb7e5")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
