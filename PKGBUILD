# Maintainer: Kevin Kaland < kevin at wizone dot solutions >

_name="ddev"
_version="1.14.2"
_downloadver=$_version
pkgname="$_name-edge-bin"
pkgver="$_version"_"$_versionsuffix"
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("$_name")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v$_downloadver/ddev_linux.v$_downloadver.tar.gz")
sha256sums=("4d1082b5ac67829347bb8029582ef4719f2e916946cff7ad4b48042ada710e37")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
