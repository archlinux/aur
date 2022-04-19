# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=czkawka-cli-bin
pkgver=4.0.0
pkgrel=2
pkgdesc="Multi functional app to find duplicates, empty folders, similar images etc (CLI)"
arch=('x86_64')
url='https://github.com/qarmin/czkawka'
license=('MIT')
provides=("${pkgname%-bin}" 'czkawka')
depends=('gcc-libs')
source=("${pkgname}-${pkgver}::https://github.com/qarmin/czkawka/releases/download/${pkgver}/linux_czkawka_cli"
        "LICENSE::https://github.com/qarmin/czkawka/raw/master/LICENSE")
sha256sums=('fcaf4c85f2a49ae6c88f11ed2007fb98427521afbc1f458e596345865cd4b305'
            '116ec95bb6520f0944846be8f6a2e6ae3bcaf8eaa2c67318c8b24e0ea389bb86')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
