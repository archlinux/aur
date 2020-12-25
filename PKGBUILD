# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-archivo-black
pkgver=1.101
pkgrel=1
_commit='39fc14632edc46bffeddc944cedacf8f440c077f'
pkgdesc="Grotesque sans serif typeface family from Omnibus-Type"
arch=('any')
url="https://github.com/Omnibus-Type/ArchivoBlack"
license=('custom:OFL')
source=("$url/raw/$_commit/fonts/ttf/ArchivoBlack-Regular.ttf"
        "$url/raw/$_commit/fonts/ttf/ArchivoBlack-Italic.ttf"
        "$url/raw/$_commit/OFL.txt")
sha256sums=('3cdaf0609a90ce679499407fc7761f3adb5ae8d3c3237249c2d11f5f095eda7d'
            '721b3c19efaf59c62316b4192a32fbe60856c3f87bf7e4648bab7fdb70926150'
            '427ffa501968f3e61220c0cf72a102b9e64872c648c01003fe0f894e180b9318')

package() {
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 *.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 OFL.txt
}
