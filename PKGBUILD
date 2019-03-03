# Maintainer: Teddy Valette (kyominii) <teddy.valette@telecomnancy.net>
# Contributor: Matthew Desmond <mattdesmond@gmail.com>

pkgname=ttf-abel-regular
pkgver=1.0
pkgrel=1
pkgdesc="Abel is a modern interpretation of the condensed flat-sided sans serif."
url="http://www.madtype.com/"
arch=(any)
license=(custom)
source=('Abel-Regular.ttf::https://github.com/google/fonts/raw/master/ofl/abel/Abel-Regular.ttf'
        'LICENSE::https://github.com/google/fonts/raw/master/ofl/abel/OFL.txt') 
sha256sums=('97cf1dbf8f17f42d7799b7725bacbee7d334da8eed29b3bbe3da0fab72a70379'
            '4f4bc3806a1e55789c6ef75ca5fc628297b05292f74966474dc0d40324abc609')

package() {
  install -Dm644 ${srcdir}/Abel-Regular.ttf "$pkgdir"/usr/share/fonts/TTF/Abel-Regular.ttf
  install -Dm644 ${srcdir}/LICENSE "$pkgdir"/usr/share/licenses/ttf-abel-regular/LICENSE
}
