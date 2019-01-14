# Maintainer: Ian Emnace <igemnace@gmail.com>
pkgname=circleci-cli
pkgver=0.1.5245
pkgrel=2
pkgdesc="Use CircleCI from the command line"
arch=(x86_64)
url="https://github.com/CircleCI-Public/circleci-cli"
license=(MIT)
depends=(docker)
source=(
	"https://github.com/CircleCI-Public/circleci-cli/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_amd64.tar.gz"
	"https://raw.githubusercontent.com/CircleCI-Public/circleci-cli/v$pkgver/LICENSE"
)
sha256sums=(
	'190213d0458bf76047fd14f39b36599d7fd4e80e21954611aec0c173965eb643'
	SKIP
)

package() {
	install -m 755 -D -t "$pkgdir/usr/bin" "${pkgname}_${pkgver}_linux_amd64/circleci"
	install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
