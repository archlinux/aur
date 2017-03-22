# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=ttf-dosega
pkgver=20150901
pkgrel=2
pkgdesc='An exact copy of the DOS EGA font, by Mateusz Viste'
arch=('any')
license=('CCPL:by-sa')
url='http://dosega.sourceforge.net'
depends=('xorg-font-utils' 'fontconfig')
source=("https://downloads.sourceforge.net/dosega/DOSEGA-$pkgver.zip")
sha256sums=('7930302af494f32511a332a54272d2b93dbe2ccbd409e4ab31683038055a9169')

package() {
  install -Dm644 DOSEGA.ttf "$pkgdir"/usr/share/fonts/TTF/DOSEGA.ttf
}
