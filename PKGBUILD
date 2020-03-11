# Maintainer: Andrew French < afrench at ddev dot com >

_name="ddev"
pkgname="$_name-bin"
pkgver="1.13.1"
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("$_name")
conflicts=("$_name")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v$pkgver/ddev_linux.v$pkgver.tar.gz")
sha256sums=("3e565687f86306251c9e48eedd14341c964f3c0ce720e71bbf353b68a88e65eb")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
