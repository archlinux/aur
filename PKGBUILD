# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Jack Random <jack ät random.to>
# Contributor: Michael J. Pento <mjpento@verizon.net>
# Contributor: grimi <grimi at poczta dot fm>
pkgname=matcha-gtk-theme
_pkgname=Matcha-gtk-theme
_pkgver=2020-04-08
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
sha256sums=('b672e04cc94aacf693e7d7fc533b33a50658b602af50dea579d76032d44fbb11')

package() {
    cd "$_pkgname-$_pkgver"
    install -d "$pkgdir/usr/share/themes"
    ./install.sh -d "$pkgdir/usr/share/themes"
}
