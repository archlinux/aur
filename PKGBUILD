# Contributor: Localizator <localizator@ukr.net>

pkgname=acid-gtk-theme
pkgver=1.0
pkgrel=2
pkgdesc="A dark, minimalistic & xfce4 fast theme"
arch=('any')
url="http://sixsixfive.deviantart.com/art/ACID-280889262"
license=('GPL')
groups=('xfce')
depends=('bash')
source=("acid_by_sixsixfive-d4n8fji.7z::http://localizator.googlecode.com/files/acid_by_sixsixfive-d4n8fji.7z")
md5sums=('aea71393deeaec6068c3e6bdd9fe175a')

package() {
  cd ${srcdir}/ACID
  install -d ${pkgdir}/usr/share/themes/${pkgname}
  cp -rf * ${pkgdir}/usr/share/themes/${pkgname}
}
