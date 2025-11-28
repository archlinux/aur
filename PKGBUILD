# Maintainer: qwjyh <urataw421 at gmail dot com>

pkgname=otf-tenhamasen-font
pkgver=3
pkgrel=1
pkgdesc="Hand-written style Japanese font like signboards at Tenhama-line. 天竜浜名湖鉄道(天浜線)の駅名看板風手書きフォント"
arch=('any')
url='https://www.hama365.info/tenhamasenfont/'
license=('custom')
source=('https://www.hama365.info/tenhamasenfont/download/TenhamasenFontVer3.zip' 'LICENSE')
sha256sums=('a0f2bcf4b53296fdfb250e62d585d513917cba2524b7677d72ed622300583880'
            'd0db091ee0767e5622c746e332a34cd71d844cfaf092d44c3f3fbf540457d89a')

package() {
  install -Dm644 TenhamasenFontVer3/*.otf -t "$pkgdir"/usr/share/fonts/OTF
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
