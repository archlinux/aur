# Maintainer: nomisge <nomisge @ live . de>
pkgname=qt6-tools-desktop
pkgver=6.6.1
pkgrel=1
pkgdesc="Adds desktop integration files for qt6-tools
 (assistent, designer, linguist and qdbusviewer)"
arch=('any')
url="https://www.qt.io"
license=('GPL3')
groups=('qt6')
depends=("qt6-tools>=${pkgver}")
makedepends=()
options=()
#install=
source=("assistant6.desktop"
	"designer6.desktop"
	"linguist6.desktop"
	"qdbusviewer6.desktop")
sha256sums=('72677ebbe6904b119b68e4dbefd21198fe8941332e0ce489c7c4b9ad50d97a79'
            'a28c63b0e77944b7182eda7dfa31120cb9e5919ffa0d9cbd56a98d53a905a328'
            'eb0b3c887825ca21c812e0431fa61087497d84f26d9fb27b5c30b19dd556aee6'
            '8d2c9e9642afb8cd4ab491cb877c8c7fae3af1128b14af58fbfd3550d0c0791e')

package() {
	# install .desktop file 
	cd $srcdir
	install -Dm644 "assistant6.desktop" "$pkgdir/usr/share/applications/assistant6.desktop"
	install -Dm644 "designer6.desktop" "$pkgdir/usr/share/applications/designer6.desktop"
	install -Dm644 "linguist6.desktop" "$pkgdir/usr/share/applications/linguist6.desktop"
	install -Dm644 "qdbusviewer6.desktop" "$pkgdir/usr/share/applications/qdbusviewer6.desktop"
}
