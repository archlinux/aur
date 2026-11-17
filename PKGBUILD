# Maintainer: Wyrd Company <support@wyrd.company>
pkgname='wyrd-deck-bin'
pkgver='0.1.3'
pkgrel=1
pkgdesc='Discord conversations for agents through a secret-holding service'
arch=('x86_64' 'aarch64')
url='https://github.com/wyrd-company/deck'
license=('Apache-2.0')
provides=('wyrd-deck')
conflicts=('wyrd-deck' 'deck')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://repo.wyrd.foo/artifacts/deck/0.1.3/deck_0.1.3_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://repo.wyrd.foo/artifacts/deck/0.1.3/deck_0.1.3_linux_aarch64.tar.gz")
sha256sums_x86_64=('13e2677e80603c9ce73304708665ddaaf24f43d977ccd48549528f064da2bc48')
sha256sums_aarch64=('9eb075fe33168fba27f4825d25ae429c08309a5f4dfcc57148b714e7dfc6fc7a')

package() {
  install -Dm755 "${srcdir}/deck" "${pkgdir}/usr/bin/deck"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/wyrd-deck/README.md"
}
