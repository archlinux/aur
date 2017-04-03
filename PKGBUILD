# An Open Type Font made by Christian Urff. 
# This block letter oriented font is used in german schools for teaching individual
# handwriting.

# Maintainer: Florian Döllinger <doellinger dot florian at gmail dot com>
_pkgname=grundschrift
pkgname=otf-grundschrift
pkgver=0.1
pkgrel=1
pkgdesc="Block letter oriented font used in german schools for teaching individual handwriting."
arch=('any')
url="https://fontlibrary.org/en/font/grundschrift"
license=('CCPL:by')
groups=()
depends=('fontconfig' 'xorg-font-utils')
install=otf.install
changelog=
source=("https://fontlibrary.org/assets/downloads/grundschrift/993f56b0c71f38ffca0d804ec48f4587/grundschrift.zip")
md5sums=("993f56b0c71f38ffca0d804ec48f4587")

package() {
	cd "$srcdir/$_pkgname"
    install -d $pkgdir/usr/share/fonts/OTF
    install -Dm644 ./* $pkgdir/usr/share/fonts/OTF
}
