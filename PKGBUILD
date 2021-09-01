# Maintainer: Magnus Anderson <magnus@iastate.edu>
pkgname=slopgun
pkgver=0.1
pkgrel=1
pkgdesc='Provide a simple script to use `slop` and `shotgun` together to save screenshots'
arch=('any')
license=('GPL')
depends=('slop' 'shotgun' 'xclip')
md5sums=() #autofill using updpkgsums
noextract=('slopgun')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -D -m755 ../slopgun "${pkgdir}/usr/bin"
}
