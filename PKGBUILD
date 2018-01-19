# Maintainer: Chris Severance <aur.severach@spamgourmet.com>

# Until a direct link is found you must download the file and place it with the PKGBUILD

set -u

pkgname='konica-minolta-bizhub-bhp-1250'
pkgver='3.2.0'
pkgrel=1
pkgdesc='PostScript printer driver for bizhub PRESS 1250 1250P'
arch=('any')
url='https://kmbs.konicaminolta.us/kmbs/support-downloads'
license=('custom:proprietary')
_srcdir="BHP1250PPDLinux_${pkgver//\./}"
source=("file://${_srcdir}MU.zip")
sha256sums=('48ac2d3ef6290c35ececf6b733b2b22640b7e7740e37796089eb367dc8e55136')

package() {
  set -u
  install -Dpm644 "${_srcdir}/English/CUPS1.2/KO1250UX.ppd" -t "${pkgdir}/usr/share/cups/model/KonicaMinolta/"
  set +u
}

set +u
