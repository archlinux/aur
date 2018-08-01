# Maintainer: Joel Almeida <aullidolunar (alsoat) gmail com>
# Contributor: Darshit Shah <darnir@gmail.com>
# Contributor: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Adria Arrufat <swiftscythe@gmail.com>

pkgname=xfwm-axiom-theme
pkgver=1
pkgrel=4
pkgdesc='Inspired by the metacity theme "fresh". Two xfwm themes are included, axiom for bright themes and axiomd for dark themes.'
arch=(any)
url="http://xfce-look.org/content/show.php/axiom?content=90145"
depends=('xfwm4')
license=('GPL')
source=('https://dl.opendesktop.org/api/files/downloadfile/id/1461767736/s/67125e23f1414ca2509e193ec12ddc10/t/1533169874/u//90145-axiom.tar.gz')
md5sums=('e9fd9f41f671afa17b3efbf43f0008de')

package() {
	cd "${srcdir}"
	find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
