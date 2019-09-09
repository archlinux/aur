# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=i3blocks-contrib
pkgver=1.4.0
pkgrel=1
pkgdesc="Community-contributed blocklets for i3blocks"
arch=('any')
url="https://github.com/vivien/i3blocks-contrib"
license=('GPL3')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('84148bf8f514de3b3dcaedeb5621e9640f96423d06759b7072507a15d0b6337f')

package() {
  install -dm755 "$pkgdir"/usr/lib/i3blocks/
  mv i3blocks-contrib-$pkgver/* "$pkgdir"/usr/lib/i3blocks/
}
