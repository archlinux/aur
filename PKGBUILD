# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=pinentry-rofi
pkgver=1.0.0
pkgrel=1
pkgdesc='rofi-based pinentry implementation'
arch=('any')
url='https://github.com/plattfot/pinentry-rofi'
license=('MIT')
depends=('guile')
source=("https://github.com/plattfot/pinentry-rofi/archive/${pkgver}.tar.gz")
b2sums=('1946cf43f816f1483ecdbc79d16f7fa6b5bac85d1486bc0eb5cc7555405695c34c5d350a709486a503aa029af2f21a48fa9ecd991e064884f346663134b56d06')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/pinentry-rofi.scm"  "${pkgdir}/usr/bin/pinentry-rofi"
}
