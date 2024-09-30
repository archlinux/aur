# Kanan is a real dog btw
pkgname=kanan
pkgver=1.0.0
pkgrel=1
pkgdesc="A program designed to ease your daily activities, coded in Python."
arch=('x86_64')
url="https://github.com/ctrl-kanan/kanan"
license=('GPL')
depends=('python')
source=("kanan.py")
sha256sums=('SKIP')

package() {
	install -Dm755 "${srcdir}/kanan.py" "${pkgdir}/usr/bin/kanan"
}
