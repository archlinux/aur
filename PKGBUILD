# Maintainer: Ian Emnace <igemnace@gmail.com>
pkgname=circleci-cli
pkgver=0.1.4786
pkgrel=1
pkgdesc="Use CircleCI from the command line"
arch=(x86_64)
url="https://github.com/CircleCI-Public/circleci-cli"
license=(MIT)
depends=(docker)
source=(
	"https://github.com/CircleCI-Public/circleci-cli/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_amd64.tar.gz"
	"https://raw.githubusercontent.com/CircleCI-Public/circleci-cli/v$pkgver/LICENSE"
)
md5sums=('a0a24f69860e9cf5144ee73fe41e00f1'
         '50602d065f853eeb672e50dd157e7ad3')

package() {
	install -m 755 -D -t "$pkgdir/usr/bin" "${pkgname}_${pkgver}_linux_amd64/circleci"
	install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
