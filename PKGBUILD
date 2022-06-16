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
sha256sums=('cacf2504c2c3c5bed779d4518825aeaf056ee9f787e89ca24f47c79e2172bed')

package() {
	make install
}
