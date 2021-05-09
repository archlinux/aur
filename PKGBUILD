# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=czkawka-cli-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="Multi functional app to find duplicates, empty folders, similar images etc (CLI)"
arch=('x86_64')
url='https://github.com/qarmin/czkawka'
license=('MIT')
provides=("${pkgname%-bin}" 'czkawka')
depends=('gcc-libs')
source=("${pkgname}-${pkgver}::https://github.com/qarmin/czkawka/releases/download/${pkgver}/linux_czkawka_cli"
        "LICENSE::https://github.com/qarmin/czkawka/raw/master/LICENSE")
sha256sums=('ed7147e458b7ad528eb0822c2f3e6a356af0de6769454c280228f4ae3a0be933'
            '4745d8b5b4ca465f4894553b40c8d1a23ee65a987f2846a4ef90662d7f3f2002')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
