# Maintainer: Agnibho Mondal <contact at agnibho dot com>
pkgname=imagecap
pkgver=1.2
pkgrel=1
epoch=
pkgdesc="A shell script to add captions to images"
arch=('any')
url="https://code.agnibho.com/imagecap"
license=('GPL')
groups=()
depends=('bash' 'coreutils' 'sed' 'perl-image-exiftool' 'feh' 'zenity')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://code.agnibho.com/imagecap/download/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=(c5e861efb708735c3aa1539fb818a19c)
validpgpkeys=()

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" prefix="/usr" install
}
