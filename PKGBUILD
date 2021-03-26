pkgname="ddev-edge-bin"
pkgver=v1.17.0_rc1
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.17.0-rc1/ddev_linux-amd64.v1.17.0-rc1.tar.gz")
sha256sums=("bae37b11216871735f2c13522f2fa34eee33acfa83b5b56d767b63d5ea87d7f5")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
