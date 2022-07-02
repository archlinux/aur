# Maintainer: Piano Nekomiya <kotone.olin1010@gmail.com>
# Contributor: Piano Nekomiya <kotone.olin1010@gmail.com>

pkgname=fonts-komorebi-gothic
pkgver=20180501
_zipver=2018_0501
pkgrel=2
pkgdesc="Komorebi Gothic Japanese outline fonts"
arch=('any')
url="http://modi.jpn.org/font_komorebi-gothic.php"
license=('custom')
depends=('fontconfig')
source=(http://modi.jpn.org/download/MODI_komorebi-gothic_${_zipver}.zip)
sha256sums=('SKIP')

package() {
  cd ${srcdir}/MODI_komorebi-gothic_${_zipver}
  install -d ${pkgdir}/usr/share/fonts/KomorebiGothic
  install -vm644 *.ttf ${pkgdir}/usr/share/fonts/KomorebiGothic/
  install -Dvm644 /dev/stdin  ${pkgdir}/usr/share/licenses/${pkgname}/COPYING << END
これらのフォントはフリー（自由な）ソフトウエアです。あらゆる改変の有無に関わらず、また商業的な利用であっても、自由にご利用、複製、再配布することができますが、全て無保証とさせていただきます。
These fonts are free software. Unlimited permission is granted to use, copy, and distribute it, with or without modification, either commercially and noncommercially. THESE FONTS ARE PROVIDED "AS IS" WITHOUT WARRANTY.
END
}
