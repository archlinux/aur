pkgname="ddev-edge-bin"
pkgver=v1.18.0_alpha1
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.18.0-alpha1/ddev_linux-amd64.v1.18.0-alpha1.tar.gz")
sha256sums=("4c51061e159ba536a8d0ce4a65757cf7a22f9cd2f824ad2595c2163ba66f0822")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
