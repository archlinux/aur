pkgname="ddev-edge-bin"
pkgver=v1.17.0_alpha1
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.17.0-alpha1/ddev_linux-amd64.v1.17.0-alpha1.tar.gz")
sha256sums=("15ffc85973384df95ed92c2f12e8f1d78b1043493fab08ae0c992a378f789751")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
