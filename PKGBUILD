pkgname=steamguard-cli-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="A linux utility for generating 2FA codes for Steam and managing Steam trade confirmations."
arch=('x86_64')
url='https://github.com/dyc3/steamguard-cli'
license=('GPL3')
provides=('steamguard')
source=(
	"https://github.com/dyc3/steamguard-cli/releases/download/v${pkgver}/steamguard"
)
sha256sums=(
	'890dcd4a2b9f3f60f13732db4f7df8831399e9b54854efa05dd4ba6b9484dcca'
)

package() {
	install -Dm755 "${srcdir}"/steamguard "${pkgdir}/usr/bin/steamguard"
}
