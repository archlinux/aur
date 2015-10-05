pkgname=hack-font
pkgver=2.015
pkgrel=1
pkgdesc='A font optimized for source code'
arch=(any)
url='http://sourcefoundry.org/hack/'
install=fonts.install
license=('Hack Open Font License')
source=(hack-font-$pkgver.zip::https://github.com/chrissimpkins/Hack/archive/v$pkgver.zip)
sha1sums=('49545321e497294ab6180698fdedd0727991c7ed')

package() {
  cd Hack-$pkgver
  install -d "$pkgdir"/usr/share/fonts/OTF/
  install -t "$pkgdir"/usr/share/fonts/OTF/ build/otf/*.otf
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
