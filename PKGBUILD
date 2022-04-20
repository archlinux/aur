# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

pkgname=pridefetch
pkgver=1.0.0
pkgrel=1
pkgdesc="Neofetch clone written in Python with the ability to display pride flags"
arch=('any')
url="https://github.com/megabytesofrem/pridefetch"
source=("git+https://github.com/megabytesofrem/pridefetch")
depends=('python3' 'python-distro')
sha512sums=('SKIP')

package() {
	cd $pkgname
	install -Dm755 pridefetch "$pkgdir"/usr/bin/pridefetch
}