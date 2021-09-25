pkgname="ddev-edge-bin"
pkgver=v1.18.0_rc4
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.18.0-rc4/ddev_linux-amd64.v1.18.0-rc4.tar.gz")
sha256sums=("d0c9ccc6f1b3fbdc073a1dc43df2bcc9c0d0ddb9e1eeca932d2fb52f2ab89454")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
