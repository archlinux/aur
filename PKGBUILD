# Maintainer: Konstantin Unruh <freaxmate@protonmail.com>
pkgname=papirus-mate-icon-theme
pkgver=20210802
pkgrel=1
pkgdesc="A MATE green version of the Papirus icon theme"
arch=('any')
url="https://github.com/FreaxMATE/$pkgname"
license=("LGPL3")
depends=('gtk-update-icon-cache' 'papirus-icon-theme')
conflicts=( 
	"$pkgname-git"
	"papirus-gtk-icon-theme"
    "papirus-gtk-icon-theme-git"
    "papirus-icon-theme-gtk"
    "papirus-icon-theme-gtk-git"
    "papirus-icon-theme-kde"
    "papirus-icon-theme-kde-git")
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FreaxMATE/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('fcc3d0f1ac0087a8752a77fa2970171b9ca9655e2c46e3ee44484e621ea3b8721b21930ce385c643abe6738a53f3ec398469a7e119f7fb346a845fa1af0513a1')

package() {
  cd "$pkgname-$pkgver"
  install -vd "$pkgdir/usr/share/icons/Papirus-MATE"
  install -vd "$pkgdir/usr/share/icons/Papirus-MATE-Dark"
  install -vd "$pkgdir/usr/share/icons/Papirus-MATE-Light"

  cp -vr "Papirus-MATE" "$pkgdir/usr/share/icons/"
  cp -vr "Papirus-MATE-Dark" "$pkgdir/usr/share/icons/"
  cp -vr "Papirus-MATE-Light" "$pkgdir/usr/share/icons/"

}

