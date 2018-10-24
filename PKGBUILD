# Maintainer: Adrián Herrera <adr.her.arc.95@gmail.com>

pkgname=ttf-merge-one
pkgver=1.001
pkgrel=1
pkgdesc="Merge One: libre alternative to Arial Rounded by Kosal Sen @ Philatype"
arch=('any')
url="https://www.ffonts.net/Merge-One.font"
provides=('ttf-merge-one')
license=('OFL-1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf-merge-one.install
makedepends=('unzip')
source=("https://www.ffonts.net/Merge-One.font.zip")
sha256sums=('b7b6e8cca728a51186aa73d971b7a081927b24cdb8032c0695395d450e9df080')

package() {
    cd "$srcdir/mergeone"
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 MergeOne-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/MergeOne-Regular.ttf"
    install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
