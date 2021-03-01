pkgname="ddev-edge-bin"
pkgver=v1.17.0_alpha6
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.17.0-alpha6/ddev_linux-amd64.v1.17.0-alpha6.tar.gz")
sha256sums=("ed8d58f58b5d53e2ae41444d525b543d5fe14b8bea52092f819b0a1cb7c51180")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
