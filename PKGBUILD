# Maintainer: Ian Emnace <igemnace@gmail.com>
pkgname=circleci-cli
pkgver=0.1.5490
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
sha256sums=('6ad456f2d3ff92ad86e948d994b850e5ce077b37699e0cc9107267164cc7b874'
            '89f336660e1dea7ea005892dc44696fb15544cbffedfbddcd4f6671a735763a9')

package() {
	install -m 755 -D -t "$pkgdir/usr/bin" "${pkgname}_${pkgver}_linux_amd64/circleci"
	install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
