pkgname=steamguard-cli-bin
pkgver=0.14.2
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
	'18484ce00c3b52323ee0f9b87db12060c2cbf4a8e5bba6aab87bae05aa07fd93'
)

package() {
	install -Dm755 "${srcdir}"/steamguard "${pkgdir}/usr/bin/steamguard"
}
