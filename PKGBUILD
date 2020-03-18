# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=genact-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='A nonsense activity generator'
arch=('x86_64')
url="https://svenstaro.github.io/genact/"
license=('MIT')
provides=('genact')
options=('!strip')
source=("https://github.com/svenstaro/genact/releases/download/''/genact-linux")
md5sums=('ade1de57f88bce83b623da309ea43351')

package() {
  cd "${srcdir}"
  install -Dm755 genact* "${pkgdir}/usr/bin/genact"
}
# vim:set ts=2 sw=2 et: