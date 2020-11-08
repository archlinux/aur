pkgname="ddev-edge-bin"
pkgver=v1.16.0_rc2
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.16.0-rc2/ddev_linux-amd64.v1.16.0-rc2.tar.gz")
sha256sums=("a7d8b824981c152b0bd9b34acf0060c09b95fa50a956ad11c73a9ec0738d5b19")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
