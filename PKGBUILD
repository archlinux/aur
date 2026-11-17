# Maintainer: Wyrd Company <support@wyrd.company>
pkgname='wyrd-deck-bin'
pkgver='0.1.2'
pkgrel=1
pkgdesc='Discord conversations for agents through a secret-holding service'
arch=('x86_64' 'aarch64')
url='https://github.com/wyrd-company/deck'
license=('Apache-2.0')
provides=('deck')
conflicts=('deck')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://repo.wyrd.foo/artifacts/deck/0.1.2/deck_0.1.2_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://repo.wyrd.foo/artifacts/deck/0.1.2/deck_0.1.2_linux_aarch64.tar.gz")
sha256sums_x86_64=('2bbb4b230daba694b1c473e80f91e62d6f496678216738ebc4bc0b01c96c1723')
sha256sums_aarch64=('b8e6548de61403b65e636688e6b93c3afb342c79e1edf22ef52ee3502cfe166a')

package() {
  install -Dm755 "${srcdir}/deck" "${pkgdir}/usr/bin/deck"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/deck/README.md"
}
