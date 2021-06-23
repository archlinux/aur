pkgname="ddev-bin"
pkgver=v1.17.6
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.17.6/ddev_linux-amd64.v1.17.6.tar.gz")
sha256sums=("c1ec6d5d680f250ae2620a7e7da7e206a8b83ed5138d19dbb8f11f9521f8a374")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
