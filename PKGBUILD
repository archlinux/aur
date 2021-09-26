# Maintainer: Magnus Anderson <magnus@iastate.edu>
pkgname=npm_xdg_base_directory
pkgver=1
pkgrel=1
pkgdesc='Configuration file to make `npm` follow the XDG Base Directory specification'
arch=('any')
license=('GPL')
depends=('npm')
noextract=('npmrc')

package() {
  mkdir -p "${pkgdir}/usr/etc"
  install -D -m644 ../npmrc "${pkgdir}/usr/etc"
}
