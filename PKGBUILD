# Contributor: Localizator <localizator@ukr.net>

pkgname=acid-gtk-theme
pkgver=1.0
pkgrel=1
pkgdesc="A dark, minimalistic & xfce4 fast theme"
arch=('i686' 'x86_64')
url="http://sixsixfive.deviantart.com/art/ACID-280889262"
license=('GPL')
groups=('xfce')
depends=('gtk2>=2.24' 'gtk-engines' 'gtk-engine-mist' 'gtk3>=3.4.1' 'gtk-engine-unico>=1.0.1')
source=("acid_by_sixsixfive-d4n8fji.7z::http://localizator.googlecode.com/files/acid_by_sixsixfive-d4n8fji.7z")
md5sums=('aea71393deeaec6068c3e6bdd9fe175a')

package() {
  cd ${srcdir}/ACID
  install -d ${pkgdir}/usr/share/themes/${pkgname}
  cp -rf * ${pkgdir}/usr/share/themes/${pkgname} || return 1
}
