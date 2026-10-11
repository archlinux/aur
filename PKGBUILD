# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: GordonGR <gordongr@freemail.gr>
_base=Asana-Math
pkgname=otf-${_base,,}
pkgver=000.962
pkgrel=1
license=('OFL')
pkgdesc="A font to typeset maths in Xe(La)TeX and Lua(La)TeX by Apostolos Syropoulos"
arch=('any')
url="https://www.ctan.org/pkg/${_base}"
source=("https://mirrors.ctan.org/fonts/${_base}.zip"
  "https://mirrors.ctan.org/fonts/drm/licenses/OFL.txt")
sha512sums=('da0599e81d0373342623eb6b0be95325c40f25ba24463f91b1c0a1148d6ba36d6f9c323c0344a01456910827984b89f8b495f983d0788f80065601389275a63d'
            '17633f5890738d2ddeaeefe270a1fdf5ea71475888b04859e042a1e36ff24ac12b690625b9933d4194e00f799c01076b9020c5bebad964e805fdff75ab87a247')

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" "${_base}/${_base}.otf"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "OFL.txt"
}
