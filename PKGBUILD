# Maintainer: Ian Emnace <igemnace@gmail.com>
pkgname=circleci-cli
pkgver=0.1.5389
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
sha256sums=(
	'ac92781bc6c4ae47fa68079e54ab34b798bab7bc4ce2c635eff6a14abdbe7d4c'
	SKIP
)

package() {
	install -m 755 -D -t "$pkgdir/usr/bin" "${pkgname}_${pkgver}_linux_amd64/circleci"
	install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
