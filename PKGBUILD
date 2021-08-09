pkgname="ddev-edge-bin"
pkgver=v1.18.0_alpha4
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.18.0-alpha4/ddev_linux-amd64.v1.18.0-alpha4.tar.gz")
sha256sums=("cc286ce41b12de0227587fff918ef2aefbc0e021eb56182f9cf3e38c29e120fd")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
