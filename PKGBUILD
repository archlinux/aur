# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Jack Random <jack ät random.to>
# Contributor: Michael J. Pento <mjpento@verizon.net>
# Contributor: grimi <grimi at poczta dot fm>
pkgname=matcha-gtk-theme
_pkgver=2020-05-09
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
sha256sums=('6c9e4cecb639ad07127ae7561895a92a4796c873210af73baef6832f2a1f37d4')

package() {
    cd "Matcha-gtk-theme-$_pkgver"
    install -d "$pkgdir/usr/share/themes"
    ./install.sh -d "$pkgdir/usr/share/themes"
}
