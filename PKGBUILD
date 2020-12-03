pkgname="ddev-edge-bin"
pkgver=v1.16.2
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.16.2/ddev_linux-amd64.v1.16.2.tar.gz")
sha256sums=("2a5e3c0899b2b7bbe1fdd638ae5f467eac3564bc1447f37c33d17ae5ce0502af")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
