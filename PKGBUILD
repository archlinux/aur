# Maintainer: Yifan Zhu <fanzhuyifan[at]gmail[dot]com>

pkgname=ekho-data-tibetan
pkgver=0.2
pkgrel=1
pkgdesc="Ekho Tibetan voice data"
arch=('any')
url="https://sourceforge.net/projects/e-guidedog/files/Ekho-Voice-Data/0.2/tibetan-trinley-44100-wav-v1.tar.xz/download"
license=('GPL-2.0-or-later')
depends=('ekho')
source=("tibetan-trinley-44100-wav-v1.tar.xz::https://master.dl.sourceforge.net/project/e-guidedog/Ekho-Voice-Data/0.2/tibetan-trinley-44100-wav-v1.tar.xz")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir/usr/share/ekho-data/tibetan"
  cp -a tibetan-trinley-44100-wav/* "$pkgdir/usr/share/ekho-data/tibetan/"
}
