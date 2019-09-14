# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: FlexoID <flexoid at gmail dot com>

pkgname=flac2mp3-bash
pkgver=1.0
pkgrel=7
pkgdesc="Bash script to convert FLAC files to MP3 format"
arch=('any')
url="http://www.linuxtutorialblog.com"
license=('GPL')
depends=('flac' 'lame')
makedepends=('git')
install=flac2mp3-bash.install
source=(git+https://github.com/FredBezies/flac2mp3-bash.git)
sha256sums=('SKIP')

package() {
  install -Dm 755 $srcdir/$pkgname/flac2mp3.sh ${pkgdir}/usr/bin/flac2mp3
}

