# Maintainer: John Fanjoy <thatguyoverthere@zxcvbn.space>

pkgname=otf-monero-gothic
pkgver=1.0.0
pkgrel=1
pkgdesc="Monero Gothic is a modified Centurty Gothic font. This typeface was released by Monotype in 1991. It was based on Futura which was designed by Paul Renner in 1927."
arch=('any')
url=i
license=('CPL')

source=("$pkgname-$pkgver.zip::https://static.monerooutreach.org/font/MoneroSerif/MoneroGothic_v3.zip")
sha256sums=('0858e6273d62b9127bb15bfd951a33c023346992778881c5b02e26f3333bbe96')
provides=('otf-monero-gothic')

package () {
  install -d "${pkgdir}/usr/share/fonts/OTF"
  cp "${srcdir}/MoneroGothic_v3.otf" "${pkgdir}/usr/share/fonts/OTF/"
}
