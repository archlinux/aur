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
source=("${pkgname}-${pkgver}::https://github.com/svenstaro/genact/releases/download/${pkgver}/genact-linux"
		'LICENSE::https://raw.githubusercontent.com/svenstaro/genact/master/LICENSE')
sha256sums=('a2373a9e5a2276622b6fab35e3f75df9e227b9bbf6e21a7898d921d97ab35f78'
			'5eaf192f4eff70cd91400195a7f791a2a6d6be2e04780f8ebb3bd5e75e3a2ce0')

package() {
  install -Dm755 "${srcdir}"/genact* "${pkgdir}/usr/bin/genact"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et: