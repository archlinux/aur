# Maintainer: Daniel Landau <daniel@landau.fi>
# Contributor: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=otf-now
pkgdesc="Now typeface by Alfredo Marco Pradil (OpenType)"
url='https://fontlibrary.org/en/font/now'
license=('custom:SIL Open Font License')
pkgver=1
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
arch=('any')
install=$pkgname.install

source=(https://fontlibrary.org/assets/downloads/now/92f81dc6f3ba4a48ba3e70f5e826207d/now.zip)
sha512sums=('963899ef209fb9ccdc0548ee24710b43a6183f9b58224f6c3550ec00cb92a2c7d0930efa92aa90a0d3002814296ff86bfb02b9c630a62ceed72f1e233a105258')

package() {
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 "${srcdir}/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
  install -D -m644 "${srcdir}/OFL-FAQ.txt" "${pkgdir}/usr/share/licenses/${pkgname}/OFL-FAQ.txt"
}
