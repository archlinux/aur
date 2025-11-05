# Maintainer: Giovanni Scafora <scafora.giovanni@gmail.com>

pkgname=('svxlink-sounds-en_us-heather-16k')
pkgver=25.05
pkgrel=1
arch=('any')
url="https://github.com/sm0svx/svxlink-sounds-en_US-heather"
license=('GPL-2.0-only')
pkgdesc="English language pack for SvxLink Server using voice Heather from Acapela Box"
depends=()
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('e79e61bec17a24fad093edfb21e7f8ca51af33b9590db954b4789271db2957dd')

package(){
  install -d "${pkgdir}/usr/share/svxlink/sounds/en_US"
  for d in Core Default DtmfRepeater EchoLink Frn Help MetarInfo Parrot PropagationMonitor SelCallEnc TclVoiceMail Trx; do
    install -d "${pkgdir}/usr/share/svxlink/sounds/en_US/$d"
    install -Dm644 "${srcdir}/en_US-heather-16k/$d/"* "${pkgdir}/usr/share/svxlink/sounds/en_US/$d/"
  done
}
