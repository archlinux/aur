# Maintainer: Ian Emnace <igemnace@gmail.com>
pkgname=circleci-cli
pkgver=0.1.4074
pkgrel=1
pkgdesc="Use CircleCI from the command line"
arch=(x86_64)
url="https://github.com/CircleCI-Public/circleci-cli"
license=(Apache)
depends=(docker)
source=("https://github.com/CircleCI-Public/circleci-cli/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_amd64.tar.gz")
md5sums=('a5c6b841310b67835f055696a2f101d0')

package() {
	cd "${pkgname}_${pkgver}_linux_amd64"

	install -m 755 -D -t "$pkgdir/usr/bin" circleci
	install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" client/LICENSE
}
