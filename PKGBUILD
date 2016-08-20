# Maintainer: Hannes Eichblatt <aur@hanneseichblatt.de>

pkgname=ater-xfwm-theme
pkgver=0.3
pkgrel=1
pkgdesc="A technical looking dark XFWM theme"
arch=('any')
url="https://www.xfce-look.org/p/1016671/"
depends=('xfwm4')
source=("Ater.tar.bz2::https://docs.google.com/uc?id=0B0i2xTgiZwFdb1l4eHd6QjZtR28&export=download")
sha256sums=('e72d88eaa97de639b8b1067b1b39d6032b32a69c0812a7d6d68245ef875a2bd8')

package() {
  /usr/bin/mkdir -p ${pkgdir}/usr/share/themes
	/usr/bin/mv ./Ater ${pkgdir}/usr/share/themes
}