# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=genact-bin
pkgver=0.10.0
pkgrel=1
pkgdesc='A nonsense activity generator'
arch=('x86_64')
url="https://svenstaro.github.io/genact/"
license=('MIT')
provides=('genact')
options=('!strip')
source=("${pkgname}-${pkgver}::https://github.com/svenstaro/genact/releases/download/v${pkgver}/genact-v${pkgver}-linux-x86_64"
    'LICENSE::https://raw.githubusercontent.com/svenstaro/genact/master/LICENSE')
sha256sums=('95f5a55d7a0892c54c2d291b7887f301d1be6cad0d4221c6ecd70455e679ac32'
            '4367524e5000757d2fe3660ebfa9efbfdfb69df3a7a46e3b8bc52ad78244781f')

package() {
  install -Dm755 "${srcdir}"/genact* "${pkgdir}/usr/bin/genact"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
