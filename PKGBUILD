pkgname="ddev-edge-bin"
pkgver=v1.15.0_rc3
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.15.0-rc3/ddev_linux.v1.15.0-rc3.tar.gz")
sha256sums=("d6086717290026b8da6d7919bfb14ae56f4b58dba0a1c9596747b309d474b967")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
