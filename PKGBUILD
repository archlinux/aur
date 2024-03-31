# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=beautyline
pkgver=20240331
_commit=7889a26c68f367b983603bdb12de5ea08ac033f1
pkgrel=1
epoch=1
pkgdesc="Outlined icons designed to have unified look and comprehensive coverage with the Candy icon pack (best suited to use with Sweet theme)"
arch=('any')
url="https://gitlab.com/garuda-linux/themes-and-settings/artwork/$pkgname"
license=('GPL')
makedepends=('git')
options=('!strip')
source=("git+${url}.git#commit=${_commit}")
sha256sums=('8611cac913a71276193fbb9a00f8f381ce523d4a96b88f445f0b17c0514f8e23')

package() {
    install -d "${pkgdir}/usr/share/icons/BeautyLine"
    cp -r "${pkgname}/." "${pkgdir}/usr/share/icons/BeautyLine"
    find "${pkgdir}/usr" -type f -exec chmod 644 {} \;
    find "${pkgdir}/usr" -type d -exec chmod 755 {} \;
}
