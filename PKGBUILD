# Maintainer: ryanw

pkgname=ttf-hactor
pkgver=20200609
pkgrel=1
pkgdesc="A font alternative to Operator Mono by combination of Hack and Victor Mono."
arch=("any")
url="https://github.com/dqisme/Hactor"
license=("MIT")
source=("hactor::https://github.com/dqisme/Hactor/archive/master.zip")

sha256sums=("72dfe9b9fd105a643472c992f7047a047c23e96e4e4675fda0a0bf628cc6e4c2")

pkgver() {
  date +%Y%m%d
}

package() {
	install -d ${pkgdir}/usr/share/fonts/TTF
	cd ${srcdir}/Hactor-master
  install -m644 ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
