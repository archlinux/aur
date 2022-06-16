# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=scitopdf-git
pkgver=e2128d71e3dba1db431ebfd36ce921175f3aca56
pkgrel=1
pkgdesc="bash script to quickly fetch, download and open scientific papers from Sci-Hub's database"
arch=(x86_64)
url="https://github.com/dougy147/scitopdf"
license=(GPL3)
conflicts=()
provides=('scitopdf')
source=("https://github.com/dougy147/scitopdf/archive/refs/heads/master.zip")
sha256sums=('93589b9f29938f7c7cb84c679f627d695dfaa08a7935717c6a0e3cf87b680cb7')

package() {
	cd scitopdf-master || exit
	make install
}
