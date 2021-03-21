pkgname="ddev-edge-bin"
pkgver=v1.17.0_alpha8
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.17.0-alpha8/ddev_linux-amd64.v1.17.0-alpha8.tar.gz")
sha256sums=("d8bdb8236dc7ce5c41cfd9025ed583345b9b4e81885165ad1f556662520bb778")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
