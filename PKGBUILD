# Maintainer: Amiad Bareli <amiad@hatul.info>

pkgname=culmus-fancy-ttf
pkgver=20260528
pkgrel=1
pkgdesc="TrueType version of Hebrew font package culmus-fancy"
arch=('any')
url="https://github.com/amiad/culmus-fancy-ttf"
license=('GPL')
depends=('fontconfig')

_srcname="$pkgname-master"
source=("${url}/archive/refs/heads/master.zip")
sha256sums=('627f45fd26c6b84b1e120670824ac8094d55f196043831910662d907e2bbf1e9')

package() {
  install -dm755 "${pkgdir}/usr/share/fonts/TTF"
  install -m644 "${srcdir}/${_srcname}"/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
