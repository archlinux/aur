# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=czkawka-cli-bin
pkgver=5.0.1
pkgrel=1
pkgdesc="Multi functional app to find duplicates, empty folders, similar images etc (CLI)"
arch=('x86_64')
url='https://github.com/qarmin/czkawka'
license=('MIT')
provides=("${pkgname%-bin}" 'czkawka')
depends=('libheif')
source=("${pkgname}-${pkgver}::https://github.com/qarmin/czkawka/releases/download/${pkgver}/linux_czkawka_cli"
        "LICENSE::https://github.com/qarmin/czkawka/raw/master/LICENSE")
sha256sums=('8a15e0ddf8caa823821389049e6d949edabd7e1657414d297069111c239c9f58'
            '116ec95bb6520f0944846be8f6a2e6ae3bcaf8eaa2c67318c8b24e0ea389bb86')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
