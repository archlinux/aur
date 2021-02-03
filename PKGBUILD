pkgname="ddev-bin"
pkgver=v1.16.6
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.16.6/ddev_linux-amd64.v1.16.6.tar.gz")
sha256sums=("8cd846855dbd2ff62eb1a30f7868bf96b9542297880025c9894640344715866a")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
