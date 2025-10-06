# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname=soundfont-masterpiece
pkgver=19990813
pkgrel=3
pkgdesc='Dense sounding Public Domain GM bank by Andrew MacLean'
arch=(any)
license=('CC0-1.0')
_site='https://www.rkhive.com'
url="${_site}/banks.html"
source=("${_site}/new/new_banks/masterpiece.zip")
sha256sums=('0f45220d8cc82947942058143c15dcdac2747003aafaf3f1fe4f713cb96a016c')

package() {
  cd "$srcdir"
  install -Dm644 Masterpiece.sf2 -t "${pkgdir}/usr/share/soundfonts/"
  install -Dm644 rkhive.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
