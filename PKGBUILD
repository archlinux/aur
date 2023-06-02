pkgname="hnsky-bin"
_pkgname="hnsky"
pkgver=4.2.15
pkgrel=1
pkgdesc="Semi professional free planetarium program"
arch=("x86_64")
url='https://sourceforge.net/projects/hnsky/'
license=('GPL3')
source=("https://deac-fra.dl.sourceforge.net/project/hnsky/linux_installer/${_pkgname}_amd64.tar.gz")
noextract=("hnsky_amd64.tar.gz")
sha256sums=('f4b0eff6fe43fe59bce3c3f33bf0cb03017ec20f7b19e914dc6c920b8877e080')

package() {
	tar -xf ${_pkgname}_amd64.tar.gz -C "$pkgdir"
}
