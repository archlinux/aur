#Maintainer: Stikkot

pkgname=zsh-komander
pkgver=1.0
pkgrel=1
pkgdesc="Minimalistic zsh-theme..."
arch=('any')
url="https://github.com/stikundra-murtsi/zsh-komander"
license=('custom:NAUPL')
depends=('zsh')
install="${pkgname}.install"
source=(
	"${pkgname}.zsh"
	"install.sh"
	"${pkgname}.install"
	"LICENSE"
	"README.md"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
	install -Dm644 "${srcdir}/${pkgname}.zsh" "$pkgdir/usr/share/${pkgname}/${pkgname}.zsh"
	install -Dm755 "${srcdir}/install.sh" "$pkgdir/usr/share/${pkgname}/install.sh"
	install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LECENSE"
	install -Dm644 "${srcdir}/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

