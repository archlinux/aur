pkgname="ddev-edge-bin"
pkgver=v1.17.0_alpha7
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.17.0-alpha7/ddev_linux-amd64.v1.17.0-alpha7.tar.gz")
sha256sums=("f6a524f1fc7496eb719e248e25e50c2e37ebd6e6e6b24d9ffe224dc21455f5e0")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
