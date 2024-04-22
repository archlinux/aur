# Maintainer: Hownioni <honeyhownihoni at gmail dot com>
pkgname=(ttf-mat_saleh otf-mat_saleh)
_reponame=mat_saleh
pkgver=1
pkgbase=mat_saleh-font
pkgrel=1
pkgdesc="Sans serif font made by Syafrizal a.k.a. Khurasan"
arch=(any)
url="https://www.dafont.com/mat-saleh.font"
license=('unknown')
source=("${_reponame}.zip::https://dl.dafont.com/dl/?f=mat_saleh")
sha512sums=('SKIP')

package_ttf-mat_saleh() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/mat_saleh" *.ttf
}

package_otf-mat_saleh() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/mat_saleh" *.otf
}
