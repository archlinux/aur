# Maintainer: Andrew French < afrench at drud dot com >

_name="ddev"
pkgname="$_name-bin"
pkgraw="1.12.0-alpha2"
pkgver="1.12.0.alpha2"
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("$_name")
conflicts=("$_name")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v$pkgraw/ddev_linux.v$pkgraw.tar.gz")
sha256sums=("7f0c5b8362b7c84145c17e6850be1a8e4a0aa9aae15ba91fe463e898c24653a4")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
