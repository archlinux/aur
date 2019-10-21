# Maintainer: Andrew French < afrench at drud dot com >

_name="ddev"
pkgname="$_name-bin"
pkgver=1.11.2
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
sha256sums=("890fbf321c57269b97b1dfd88547d2cf075df04a24a623ff86068cb0a3ee7362")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
