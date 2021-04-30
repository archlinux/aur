pkgname="ddev-edge-bin"
pkgver=v1.17.2
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.17.2/ddev_linux-amd64.v1.17.2.tar.gz")
sha256sums=("ff7d0109f7dd8066a264283acb7c8a4281e0f6e85d0f49f0c5f8e6c798681b5f")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
