# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=sweet-kde
pkgver=0.1+20200612
pkgrel=1
pkgdesc="A dark and modern theme for Plasma"
arch=('any')
url="https://store.kde.org/p/1294729/"
license=('GPL3')
depends=('color-scheme-sweet' 'plasma-theme-sweet' 'aurorae-theme-sweet'
         'candy-icons' 'sweet-wallpapers' 'sddm-theme-sweet' 'xcursor-sweet'
         'sweet-mars-kde')
optdepends=('kvantum-theme-sweet')
source=("https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1OTIyNTkzMjciLCJvIjoiMSIsInMiOiI3MWRhZmJiMTkwMmI4YTUyYzkyZTFmOWNmMzY4ZDQ4ZWE3NzY3ZjRiZjhmN2QzMjUzNmZiZDZiYTNiM2M3MzE0MDZmNGRhMTI1YWJjNTJiYzBlZjE0YjU2NDJiMWU2ZWI2NzcyZDZlMGNkOGQ5MGY3Mzc3Mjk4MjhhZGU1ZmI1YSIsInQiOjE1OTI0MjM5MjMsInN0ZnAiOm51bGwsInN0aXAiOiIxMDguMTYyLjE1Mi4yMjAifQ.Qqdcm2AnLifHYkLD01iLtGl4P16xHzB8M_qkhoXhJ3g/Sweet.tar.xz")
md5sums=('3d111aed96ac9b937d27a7f7df20ac7a')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/usr/share/plasma/look-and-feel"
  cp -r Sweet "${pkgdir}/usr/share/plasma/look-and-feel/"
}
