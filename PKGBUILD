# Maintainer: Chris Severance <aur.severach@spamgourmet.com>

# Until a direct link is found you must download the file and place it with the PKGBUILD

set -u

pkgname='konica-minolta-bizhub-ic-601'
pkgver='20000.0001'
pkgrel=1
pkgdesc='PostScript printer driver for C7000 C6000'
arch=('any')
url='https://kmbs.konicaminolta.us/kmbs/support-downloads'
license=('custom:proprietary')
_srcdir="IC601PPDLinux_${pkgver//\./}"
source=("file://${_srcdir}MU.zip")
sha256sums=('962ede21a50d218363d218202cd5b0eac7142be443dcfb4cce291172b577c7c9')

package() {
  set -u
  install -Dpm644 "${_srcdir}/English/CUPS1.2/KOC7000UX.ppd" -t "${pkgdir}/usr/share/cups/model/KonicaMinolta/"
  set +u
}

set +u
