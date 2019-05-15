# Maintainer: Andrew French < afrench at drud dot com >

_name="ddev"
pkgname="$_name-bin"
pkgver=1.8.0
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
sha256sums=('cf5c08a9ba76b3c15ca26740d75557377e0a98e9480dbef6a14e89f10074aac7')

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
