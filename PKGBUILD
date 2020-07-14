# Maintainer: shadowkyogre <shadowkyogre.public@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=otf-rebecca
pkgver=1.001
pkgrel=2
pkgdesc="A script font with great vibes."
arch=('any')
url="https://fontlibrary.org/en/font/rebecca"
license=('OFL')
source=("rebecca-${pkgver}.zip::https://openfontlibrary.org/assets/downloads/rebecca/d32a4d9e4887fccf9ce200538290cd10/rebecca.zip")
sha256sums=('859719aeebd6d346118ef250646aad5c566d9530af22fcdb5eef1937b2a01398')

package() {
  cd "${srcdir}"
  install -Dm644 *.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 *License.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
