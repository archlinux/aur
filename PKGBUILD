# Maintainer: Joel Almeida <aullidolunar (alsoat) gmail com>
# Contributor: Darshit Shah <darnir@gmail.com>
# Contributor: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Adria Arrufat <swiftscythe@gmail.com>

pkgname=xfwm-axiom-theme
pkgver=1
pkgrel=5
pkgdesc='Inspired by the metacity theme "fresh". Two xfwm themes are included, axiom for bright themes and axiomd for dark themes.'
arch=(any)
url="https://www.xfce-look.org/content/show.php/axiom?content=90145"
depends=('xfwm4')
license=('GPL')
source=('https://dl.opendesktop.org/api/files/download/id/1461767736/s/ca9af3c96f69f8c1375a1c34ea1d8cef/t/1538527945/u//90145-axiom.tar.gz')
md5sums=('e9fd9f41f671afa17b3efbf43f0008de')

package() {
	cd "${srcdir}"
	find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
