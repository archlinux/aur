pkgname="ddev-edge-bin"
pkgver=v1.17.0_alpha5
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.17.0-alpha5/ddev_linux-amd64.v1.17.0-alpha5.tar.gz")
sha256sums=("2b976085fc9d0a4aecdf35deae4cf38f18ed073a8c6909578f67615949c1d5bc")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
