# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=czkawka-cli-bin
pkgver=5.0.0
pkgrel=1
pkgdesc="Multi functional app to find duplicates, empty folders, similar images etc (CLI)"
arch=('x86_64')
url='https://github.com/qarmin/czkawka'
license=('MIT')
provides=("${pkgname%-bin}" 'czkawka')
depends=('gcc-libs' 'libheif')
source=("${pkgname}-${pkgver}::https://github.com/qarmin/czkawka/releases/download/${pkgver}/linux_czkawka_cli"
        "LICENSE::https://github.com/qarmin/czkawka/raw/master/LICENSE")
sha256sums=('e11b4b15542f06cd0bbe3667b07b0b43673245452cd42e9eaca3bc838248cff5'
            '116ec95bb6520f0944846be8f6a2e6ae3bcaf8eaa2c67318c8b24e0ea389bb86')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
