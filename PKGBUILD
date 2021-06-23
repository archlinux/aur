pkgname="ddev-edge-bin"
pkgver=v1.17.6_rc1
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.17.6-rc1/ddev_linux-amd64.v1.17.6-rc1.tar.gz")
sha256sums=("349b7ade2cc0c766a7c9ad5e8400ff8f51aa327b7640704d91a188af098cb89b")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
