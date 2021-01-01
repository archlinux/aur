# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=czkawka-cli-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Multi functional app to find duplicates, empty folders, similar images etc (CLI)"
arch=('x86_64')
url='https://github.com/qarmin/czkawka'
license=('MIT')
provides=("${pkgname%-bin}" 'czkawka')
depends=('gcc-libs')
source=("${pkgname}-${pkgver}::https://github.com/qarmin/czkawka/releases/download/${pkgver}/linux_czkawka_cli"
        "LICENSE::https://github.com/qarmin/czkawka/raw/master/LICENSE")
sha256sums=('48c6808e01e891caf48a7047521c00fb311b794ce51aac2803ae033b25d64919'
            '4745d8b5b4ca465f4894553b40c8d1a23ee65a987f2846a4ef90662d7f3f2002')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
