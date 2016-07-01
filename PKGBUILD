# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

pkgname=openbox-theme-mythos
pkgver=20150104
pkgrel=3
pkgdesc='A dark blue theme for Openbox.'
arch=('any')
url='http://box-look.org/content/show.php?content=88560'
license=('GPL3')

depends=('openbox')
provides=("${pkgname}=${pkgver}")

# Using mirror, original source returns HTTP 403
# http://box-look.org/CONTENT/content-files/88560-Mythos_OB.tar.gz
source=(
	'https://www.dropbox.com/s/q40ppjtue8z2me7/88560-Mythos_OB.tar.gz'
)
sha512sums=(
	'1774264dd799b008f47a61facd0b6bdd3983048f3a795eeb84076bdfed77422b63acf158204f77ef21487a541a5f6d13da570344b48d0c374a17fd2e42b8d3ce'
)

package() {	
	# Copy theme
	mkdir -p "${pkgdir}"/usr/share/themes
	cp -R "${srcdir}"/Mythos "${pkgdir}"/usr/share/themes
}
