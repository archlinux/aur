pkgname="ddev-edge-bin"
pkgver=v1.16.2_alpha3
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.16.2-alpha3/ddev_linux-amd64.v1.16.2-alpha3.tar.gz")
sha256sums=("eafce42d0bdf5d5df590fc66d785dd163329b373eb55c71066aad7871f7cb77d")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
