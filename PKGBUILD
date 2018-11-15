# Maintainer: Ian Emnace <igemnace@gmail.com>
pkgname=circleci-cli
pkgver=0.1.4034
pkgrel=1
pkgdesc="Use CircleCI from the command line"
arch=(x86_64)
url="https://github.com/CircleCI-Public/circleci-cli"
license=(Apache)
depends=(docker)
source=("https://github.com/CircleCI-Public/circleci-cli/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_amd64.tar.gz")
md5sums=('bbb6c7f3a05e64c24deee9147465c837')

package() {
	cd "${pkgname}_${pkgver}_linux_amd64"

	install -m 755 -D -t "$pkgdir/usr/bin" circleci
	install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" client/LICENSE
}
