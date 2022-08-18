# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=nav
pkgver=1.0.1
pkgrel=1
pkgdesc="A means of quick navigation through directories in the CLI"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(dialog)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '549eecb1c84a0778778d07500caff671d3ec40426178ef698a9674e078b8bb62c4f10f1744d6913df2089ee27a8db91242a4ed03efd456d791772a015c406b73'
  '89c6ea5db8405de9a10ad2a666200c6260478757ff50fdeb7afff1dc00f910b1f62c7b6a0c98aa26fcd5171f731c11bb594249e3f9c311b96adb111da4ccc94e'
  )
md5sums=(
  '1c1515a21890f4f8027ebfb49e7af873'
  '5cb2bbb482c361ea8eaa54acf6478b50'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
