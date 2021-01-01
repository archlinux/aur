pkgname="ddev-edge-bin"
pkgver=v1.17.0_alpha2
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.17.0-alpha2/ddev_linux-amd64.v1.17.0-alpha2.tar.gz")
sha256sums=("70980ec02d4a4eedefa563697fc4e93af47b70ed69d2cd3d924e40da2c454e31")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
