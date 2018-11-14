# Maintainer: Ian Emnace <igemnace@gmail.com>
pkgname=circleci-cli
pkgver=0.1.4005
pkgrel=1
pkgdesc="Use CircleCI from the command line"
arch=(x86_64)
url="https://github.com/CircleCI-Public/circleci-cli"
license=(Apache)
depends=(docker)
source=("https://github.com/CircleCI-Public/circleci-cli/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_amd64.tar.gz")
md5sums=('08f58c1a3db8c2629afa1d3788f6d7c0')

package() {
	cd "${pkgname}_${pkgver}_linux_amd64"

	install -m 755 -D -t "$pkgdir/usr/bin" circleci
	install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" client/LICENSE
}
