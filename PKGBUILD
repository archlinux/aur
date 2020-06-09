pkgname="ddev-edge-bin"
pkgver=v1.15_alpha4
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.15-alpha4/ddev_linux.v1.15-alpha4.tar.gz")
sha256sums=("f2a6785d383522242063575c264d7e053b100aaebb51f2e9e3089b7e7514176b")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
