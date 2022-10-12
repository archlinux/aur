# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

pkgname=pridefetch
pkgver=1.1.0
pkgrel=1
pkgdesc="Neofetch clone written in Python with the ability to display pride flags"
arch=('any')
url="https://github.com/Spyhoodle/pridefetch"
source=(pridefetch)
depends=('python3' 'python-distro')
conflicts=('pridefetch-git')
sha512sums=('4195b2b4403686f2b7c4c8a34fe01d117a1d6898cf556c1007926ec6384dded4b7ba06ca4867db38d6650286c67edf71a3c8d6d2533954062868b15161152921')

package() {
	install -Dm755 pridefetch "$pkgdir"/usr/bin/pridefetch
}
