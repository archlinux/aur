# Maintainer: Arglebargle < arglebargle DASH aur AT arglebargle DOT dev >

# README: This package is a stub that allows you to replace ttf-liberation with ttf-ms-win10/11
#         Install ttf-ms-win10/-win11 before you do anything with this package

pkgname=ttf-defenestration
pkgver=2
pkgrel=1
pkgdesc="Shim package to satisfy 'ttf-liberation' dependencies via 'ttf-ms-win1*'; see README.md for details"
arch=(any)
url="https://gitlab.com/arglebargle-arch/ttf-defenestration-PKGBUILD"
license=('BSD')
provides=('ttf-liberation')
conflicts=(
  'ttf-liberation'
  'ttf-ms-fonts<=0'   # this should prevent the actual 'ttf-ms-fonts' package from being accepted
  'ttf-vista-fonts'
  'ttf-win7-fonts'
  'ttf-ms-win8'
)

package() {
  depends=('ttf-ms-fonts')
  optdepends=(
    'ttf-ms-win10: Windows 10 fonts'
    'ttf-ms-win11: Windows 11 fonts'
  )
}

