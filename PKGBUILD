pkgname="ddev-edge-bin"
pkgver=v1.16.0_alpha3
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.16.0-alpha3/ddev_linux.v1.16.0-alpha3.tar.gz")
sha256sums=("1d43c515ad6df64d3c3b6a2ce6ea2215d96870b10a815214597e249f57b4f248")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
