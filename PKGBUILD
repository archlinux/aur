pkgname="ddev-bin"
pkgver=v1.16.4
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.16.4/ddev_linux-amd64.v1.16.4.tar.gz")
sha256sums=("28f603b1f3ac41514adb8f1abb74e0838992ffaf91a4c7cb39c2751f6321d9e3")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
