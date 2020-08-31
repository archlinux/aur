pkgname="ddev-edge-bin"
pkgver=v1.16.0_alpha2
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.16.0-alpha2/ddev_linux.v1.16.0-alpha2.tar.gz")
sha256sums=("de8fa2ee210cad207d85dc9200e1d3f04ef009e1090b2213bd698e24717e37d8")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
