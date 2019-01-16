# Maintainer: Cameron Eagans < me at cweagans dot net >

_name="ddev"
pkgname="$_name-bin"
pkgver=1.5.2
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
sha256sums=('4f62ab505e4e9052834bd3f0f648ed8b1d824de557e2b3132cbca560fa817d4d')

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
