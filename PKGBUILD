# Maintainer: luxcem <a@luxcem.fr>
# Contributor: yuhr <sdn.pate(at)gmail.com>

pkgname=otf-marta
pkgver=1.0
pkgrel=2
pkgdesc="Eclectic, accidental-text font with wedge serifs."
url="https://www.behance.net/gallery/7434601/Marta-Free-Font"
license=("custom:OFL")
arch=("any")
depends=()
source=(marta.tar.gz::"https://github.com/luxcem/otf-marta/archive/v${pkgver}.tar.gz")
sha256sums=("73040053fe5fe59265452eea835dd56ffe50ead2e25dc8bd90242ca7028f2768")

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  install -d "${pkgdir}"/usr/share/fonts/OTF
  install -m644 *.otf "${pkgdir}"/usr/share/fonts/OTF/

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
