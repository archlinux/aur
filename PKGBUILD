pkgname="ddev-edge-bin"
pkgver=v1.16.0_alpha1
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.16.0-alpha1/ddev_linux.v1.16.0-alpha1.tar.gz")
sha256sums=("fdfb4ccca71a5298012ece7eb7d91cf5874590016f201b4e67503992b424d021")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
