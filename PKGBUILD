# Maintainer: Drommer <drommer@github.com>

pkgname=ttf-weblysleekui
pkgver=0.001
pkgrel=1
pkgdesc='Sans-serif font which is designed by Mat Douglas, metric-compatible with Segoe UI'
arch=('any')
url='https://fontpro.com/weblysleek-ui-font-9838'
license=('custom:OFL')
provides=('ttf-font' 'ttf-weblysleekui')
source=("https://github.com/Drommer/Archive/raw/main/WeblySleek_UI.zip"
        "OFL.txt"::"https://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=OFL_plaintext&filename=OFL.txt")
sha256sums=('a9b428d48691766c4c1673dd11d7baaf09eb50d910a6f8c77cfdb18b1179eca7'
            'ca122f3bda0154f692817450168cb650a7fc59ef96c93582acd2e7a744d464d3')

package() {
  install -Dm644 $srcdir/WeblySleek_UI/*.ttf -t $pkgdir/usr/share/fonts/weblysleekui
  install -Dm644 $srcdir/OFL.txt -t $pkgdir/usr/share/licenses/${pkgname}
}
