pkgname="ddev-edge-bin"
pkgver=v1.18.0_alpha2
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.18.0-alpha2/ddev_linux-amd64.v1.18.0-alpha2.tar.gz")
sha256sums=("5302cbd425dca19da8e3aa700ec22bb9dce64a006471880600cb08763c35b3a4")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
