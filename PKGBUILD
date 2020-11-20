# Maintainer: luxcem <a@luxcem.fr>
# Contributor: Marcos Heredia <chelqo@gmail.com>

pkgver=1.000
pkgrel=2
pkgname=('otf-impallari-amiko-devanagari' 'ttf-impallari-amiko-devanagari')
pkgdesc="Amiko is a clean and utilitarian Devanagari and Latin typeface family, from Pablo Impallari"
arch=('any')
url="https://github.com/impallari"
license=('custom:OFL')
groups=("impallari-fonts")
source=("$pkgname-$pkgver.zip::https://github.com/impallari/Amiko-Devanagari/archive/master.zip")
b2sums=('39bf7c6d020025ccab41193cb776cab96f0c4fb479d2d96a6df9ba1d536696543773b439679d045e1bef62b9d9aed9811a20095c5b0d451af037cdad876ba0b4')

package_otf-impallari-amiko-devanagari() {
  cd ${srcdir}/Amiko-Devanagari-master
  install -Dm644 -t "$pkgdir"/usr/share/fonts/OTF/impallari fonts/OTF/*.otf
  install -Dm644 OFL.txt "$pkgdir"/usr/share/licenses/${pkgname[0]}/LICENSE
}

package_ttf-impallari-amiko-devanagari() {
  cd ${srcdir}/Amiko-Devanagari-master
  install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF/impallari fonts/TTF/*.ttf
  install -Dm644 OFL.txt "$pkgdir"/usr/share/licenses/${pkgname[1]}/LICENSE
}
