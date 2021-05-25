# Maintainer: Teddy Valette (kyominii) <teddy.valette@telecomnancy.net>
# Contributor: Matthew Desmond <mattdesmond@gmail.com>

pkgname=ttf-abel-regular
pkgver=1.0
pkgrel=3
pkgdesc="Abel is a modern interpretation of the condensed flat-sided sans serif."
url="http://www.madtype.com/"
arch=(any)
license=(custom)
source=('Abel-Regular.ttf::https://github.com/google/fonts/raw/main/ofl/abel/Abel-Regular.ttf'
        'LICENSE::https://github.com/google/fonts/raw/main/ofl/abel/OFL.txt') 
sha256sums=('8809dcad25318225052f88333e208c5aad4adcb7b2c934c135735ec19aa410b4'
            '4f4bc3806a1e55789c6ef75ca5fc628297b05292f74966474dc0d40324abc609')

package() {
  install -Dm644 ${srcdir}/Abel-Regular.ttf "$pkgdir"/usr/share/fonts/TTF/Abel-Regular.ttf
  install -Dm644 ${srcdir}/LICENSE "$pkgdir"/usr/share/licenses/ttf-abel-regular/LICENSE
}
