# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Jack Random <jack ät random.to>
# Contributor: Michael J. Pento <mjpento@verizon.net>
# Contributor: grimi <grimi at poczta dot fm>
pkgname=matcha-gtk-theme
_pkgver=2020-05-24
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A flat design theme for GTK 3, GTK 2 and GNOME Shell"
arch=('any')
url="https://vinceliuice.github.io/theme-matcha.html"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
optdepends=('matcha-icon-theme: Matching icon theme'
            'qogir-icon-theme: Recommended icon theme'
            'kvantum-theme-matcha: Matching Kvantum theme')
source=("$pkgname-$_pkgver.zip::https://github.com/vinceliuice/Matcha-gtk-theme/archive/$_pkgver.tar.gz")
options=('!strip')
sha256sums=('c67cc2d22944e3ee1af621850ffbc05d342fd60a128411be6f9c0eb23f90e5f7')

package() {
    cd "Matcha-gtk-theme-$_pkgver"
    install -d "$pkgdir/usr/share/themes"
    ./install.sh -d "$pkgdir/usr/share/themes"
}
