# Maintainer: Adam Berglund <adam dot f dot berglund at hotmail dot com>

pkgbase=be-vietnam-pro
pkgname=(otf-be-vietnam-pro ttf-be-vietnam-pro ttf-be-vietnam-pro-variable)
_commit=804e62d81abbbcdcce5686069c69b41b8c245192
pkgver=1.002 # based on https://github.com/google/fonts/pull/3771
pkgrel=1
pkgdesc='Open source Vietnamese sans-serif font family for universal professional design'
arch=(any)
url='https://github.com/bettergui/BeVietnamPro'
license=('OFL-1.1-no-RFN')
depends=()
makedepends=(
  git
)
source=("bettergui/BeVietnamPro::git+${url}.git#commit=${_commit}")
provides=(be-vietnam-pro)
sha256sums=('d8566a8e2ada0baed0d0db45e15d983a1cdd225405d5ced1d0bfaf196e02c78d')

package_otf-be-vietnam-pro() {
  cd "BeVietnamPro"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" OFL.txt
  install -Dm644 -t "${pkgdir}/usr/share/fonts/OTF/${pkgbase}" fonts/otf/*.otf
}

package_ttf-be-vietnam-pro() {
  cd "BeVietnamPro"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" OFL.txt
  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/${pkgbase}" fonts/ttf/*.ttf
}

package_ttf-be-vietnam-pro-variable() {
  cd "BeVietnamPro"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" OFL.txt
  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/${pkgbase}" fonts/variable/*.ttf
}

