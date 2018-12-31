# Maintainer: Aniket-Pradhan aniket17133@iiitd.ac.in
# Contributer: Peter Hofmann <insert_email_here>

pkgname=birtty
pkgver=18.06
pkgrel=1
pkgdesc="Try not to crash that bird"
url="https://www.uninformativ.de/git/birtty"
license=("custom:PIZZA-WARE LICENSE")
makedepends=("gcc" "make")
conflicts=("birtty-git")
arch=("i686" "x86_64")
source=("git+https://www.uninformativ.de/git/birtty.git#tag=v18.06")

build() {
  cd "${srcdir}/birtty"
  make
}

package() {
	cd "${srcdir}/birtty"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('SKIP')
