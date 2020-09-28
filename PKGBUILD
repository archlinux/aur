pkgname="ddev-edge-bin"
pkgver=v1.16.0_alpha5
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.16.0-alpha5/ddev_linux-amd64.v1.16.0-alpha5.tar.gz")
sha256sums=("d6abdd73b301ee7bf42007e898a9b21ae97e4030ecd233c4e1fe92b4d9be3be6")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
