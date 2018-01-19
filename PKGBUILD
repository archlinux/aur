# Maintainer: Chris Severance <aur.severach@spamgourmet.com>

# Until a direct link is found you must download the file and place it with the PKGBUILD

set -u

pkgname='konica-minolta-bizhub-ic-603'
pkgver='2.0.0MU'
pkgrel=1
pkgdesc='PostScript printer driver for AccurioPress C2070'
arch=('any')
url='https://www.konicaminolta.eu/en/business-solutions/support.html'
license=('custom:proprietary')
_srcdir="IC603PPDLinux_${pkgver//\./}"
source=("file://${_srcdir}.zip")
sha256sums=('802117850a3e1075e429a3232a8d8239a908381850ab99fd3ec764d155b2a369')

package() {
  set -u
  install -Dpm644 "${_srcdir}/English/CUPS1.2/KOC2070UX.ppd" -t "${pkgdir}/usr/share/cups/model/KonicaMinolta/"
  set +u
}

set +u
