pkgname=xfce4-theme-plastic
pkgver=0.91
pkgrel=1
pkgdesc="Plastic theme for Xfwm4, derived to kwin"
arch=('any')
url="http://xfce-look.org/content/show.php/PlasticXFWM4?content=76315"
license=("Artistic 2.0")
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
source=('http://xfce-look.org/CONTENT/content-files/76315-Plastic.tar.gz')
noextract=()

package() {
  mkdir -p "$pkgdir/usr/share/themes"
  cp -R $srcdir/Plastic $pkgdir/usr/share/themes
}
md5sums=('2c205520d449f46642702813a266b060')
