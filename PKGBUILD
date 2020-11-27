pkgname="ddev-edge-bin"
pkgver=v1.16.2_alpha2
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.16.2-alpha2/ddev_linux-amd64.v1.16.2-alpha2.tar.gz")
sha256sums=("2c42c54335c9dee8e742b8723267f47f5ebbe40ff3f0bf319ca469c428e7861c")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
