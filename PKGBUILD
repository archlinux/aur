# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: GordonGR <gordongr@freemail.gr>
_base=Asana-Math
pkgname=otf-${_base,,}
pkgver=000.958
pkgrel=4
license=('OFL')
pkgdesc="A font to typeset maths in Xe(La)TeX and Lua(La)TeX by Apostolos Syropoulos"
arch=('any')
url="https://www.ctan.org/pkg/${_base}"
source=("https://mirrors.ctan.org/fonts/${_base}.zip"
  "https://mirrors.ctan.org/fonts/drm/licenses/OFL.txt")
sha512sums=('6fb14c67c040e7c4d4c6a73ec1545f1da061b9cb4f6553549b38e1e08044bbba09a3af9029182ca48e78c59e951ab07b5684bfeb1948684406c6c590f65eb98c'
  '17633f5890738d2ddeaeefe270a1fdf5ea71475888b04859e042a1e36ff24ac12b690625b9933d4194e00f799c01076b9020c5bebad964e805fdff75ab87a247')

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" "${_base}/${_base}.otf"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "OFL.txt"
}
