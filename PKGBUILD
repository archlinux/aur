# Maintainer Max Harmathy <harmathy@mailbox.org>
# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-vlgothic
pkgver=20230918
pkgrel=1
pkgdesc="Japanese TrueType fonts from Vine Linux"
arch=('any')
url="https://vlgothic.dicey.org/"
license=('custom')
source=("https://github.com/daisukesuzuki/VLGothic/releases/download/${pkgver}/VLGothic-${pkgver}.tar.xz")
md5sums=('739a9f9995e398bc5cb9ce5697a8691c')
b2sums=('d9a3064512996e9f9f5e035907bdffdec92bf8222353a116374fe924c9d31d44702de1f6b1e4f60e96a883cd796cb0c5a6b5b283c71c82c88a8f73c337443896')

package() {
  cd ${srcdir}/VLGothic

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 LICENSE_E.mplus \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_MPLUS.txt
  install -D -m644 README.sazanami \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_SAZANAMI.txt
  install -D -m644 LICENSE.en \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_VLGOTHIC.txt
}
