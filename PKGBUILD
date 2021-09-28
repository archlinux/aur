pkgname="ddev-edge-bin"
pkgver=v1.18.0
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.18.0/ddev_linux-amd64.v1.18.0.tar.gz")
sha256sums=("4d3824acbb9378a0bde764421cf6bfbe8e17c3692e6f5fe9db44db870c2bb5e3")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
