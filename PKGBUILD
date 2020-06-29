pkgname="ddev-edge-bin"
pkgver=v1.15_rc1
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.15-rc1/ddev_linux.v1.15-rc1.tar.gz")
sha256sums=("7fae0bb8d809b2633bad0751bcc6b01a118e3003584baf21c73658347bcf36f1")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
