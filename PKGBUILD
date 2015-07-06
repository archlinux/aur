# Maintainer Keerthan Jaic <jckeerthan at gmail dot com>

pkgname=pandoc-bin
pkgver=1.13.2
pkgrel=2
pkgdesc="Universal markup converter (Binary build from official deb)"
arch=('x86_64')
url="http://pandoc.org/"
license=('GPL2')
depends=('gmp' 'zlib')
optdepends=('texlive-most: for PDF creation')
source_x86_64=("https://github.com/jgm/pandoc/releases/download/${pkgver}/pandoc-${pkgver}-1-amd64.deb")
md5sums_x86_64=('90e22cf8291d7444fb34d0a41c49dcf6')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir/"
  # This folder only has the license
  rm -r "$pkgdir"/usr/share/doc
}
