pkgname="ddev-edge-bin"
pkgver=v1.18.0_alpha3
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.18.0-alpha3/ddev_linux-amd64.v1.18.0-alpha3.tar.gz")
sha256sums=("46bbbbbce300d4e05bb593ebd7ccd026558bd4bab0b8eae94d9c3d435c3387e5")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
