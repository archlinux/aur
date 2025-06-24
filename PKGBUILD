#Maintainer: Stikkot

pkgname=zsh-komander
pkgver=1.0
pkgrel=2
pkgdesc="Minimalistic zsh-theme..."
arch=('any')
url="https://github.com/stikundra-murtsi/zsh-komander"
license=('custom:NAUPL')
depends=('zsh')
install="${pkgname}.install"
source=(
	"${pkgname}.zsh"
	"${pkgname}.install"
	"LICENSE"
	"README.md"
)
sha256sums=('8daffcb80162ffd2e2608fdc9316c7dfe1c1503069b32312485eb1cd6d7058fa'
            'fbb9888f2b78dd481036bc18909222744a22378c90d7d7a9f1f3f2fd5fd7f19c'
            '75d0d33f190772597e1e5775c0ae7ed6a456189a8bf7d93dc8dd6d361a750915'
            '281903190d85124423fec6d9dd607e5cab16528bf885795d36f22b9021ccad1f')

package() {
	install -Dm644 "${srcdir}/${pkgname}.zsh" "$pkgdir/usr/share/${pkgname}/${pkgname}.zsh"
	install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LECENSE"
	install -Dm644 "${srcdir}/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

