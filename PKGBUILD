# Maintainer: Bastian Plettner <b.pletttner at archlinux dot info>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
pkgname=codecs
pkgver=20071007
pkgrel=1
pkgdesc='Non-linux native codec pack.'
arch=('i686')
url='http://www.mplayerhq.hu/design7/dload.html'
license=('unknown')
depends=('libstdc++5')
conflicts=('codecs-extra')
replaces=('codecs-extra')
options=('!strip')
source=("http://www.mplayerhq.hu/MPlayer/releases/codecs/all-${pkgver}.tar.bz2")
md5sums=('0407e8ad132e37ccd3f932448ca201c5')

package() {
  install -d "${pkgdir}/usr/lib/codecs"
  ln -s codecs "${pkgdir}/usr/lib/win32"
  install -m644 "${srcdir}/all-${pkgver}/"* "${pkgdir}/usr/lib/codecs"
}
