pkgname="ddev-edge-bin"
pkgver=v1.18.0_rc2
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.18.0-rc2/ddev_linux-amd64.v1.18.0-rc2.tar.gz")
sha256sums=("284f11f6b1cfc845c6c388402d0fe80beb1ddf768b899c93b976efc3ff1b74f7")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
