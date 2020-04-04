# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=genact-bin
pkgver=0.7.0
pkgrel=2
pkgdesc='A nonsense activity generator'
arch=('x86_64')
url="https://svenstaro.github.io/genact/"
license=('MIT')
provides=('genact')
options=('!strip')
source=("https://github.com/svenstaro/genact/releases/download/${pkgver}/genact-linux")
md5sums=('0ad2967b61423949b18ba2d042dccca7')

package() {
  install -Dm755 "${srcdir}"/genact* "${pkgdir}/usr/bin/genact"
}
# vim:set ts=2 sw=2 et: