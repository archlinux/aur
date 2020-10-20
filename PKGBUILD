pkgname="ddev-edge-bin"
pkgver=v1.16.0_alpha7
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.16.0-alpha7/ddev_linux-amd64.v1.16.0-alpha7.tar.gz")
sha256sums=("4f688cfec78155fdfbed2fa8dff9ec57c4ca81761d3482624e276106058fe12d")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
