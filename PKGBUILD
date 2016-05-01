#Maintainer: Jack Cumming <jackrcumming@gmail.com>
pkgname=moka-and-faba-minimal-icons
pkgver=12.9.15
pkgrel=1
pkgdesc="Grayscale versions of Moka & Faba icons"
arch=('any')
url="http://cbowman57.deviantart.com/art/Moka-Minimal-and-Faba-Minimal-Icon-Sets-482927307"
license=('CC')
makedepends=('p7zip')
source=("http://orig00.deviantart.net/ca23/f/2015/343/5/1/moka_minimal_and_faba_minimal_icon_sets_by_cbowman57-d7zit3f.7z")
md5sums=('10ab6d768b37966977c1503e48d40e1c')



package() {
	cd ${srcdir}
	7za x moka_minimal_and_faba_minimal_icon_sets_by_cbowman57-d7zit3f.7z
	install -d "$pkgdir/usr/share/icons/"
	cp -r ${srcdir}/* "$pkgdir/usr/share/icons/"
}
