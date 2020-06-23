pkgname="ddev-edge-bin"
pkgver=v1.15_alpha6
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.15-alpha6/ddev_linux.v1.15-alpha6.tar.gz")
sha256sums=("d2ec0c4b6406d819b76f01559a116b5ccdc2fcb48a75fb1da6453a2574cd1501")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
