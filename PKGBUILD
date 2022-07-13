# Maintainer: Ayrton Araujo <ayrton@linux.com>

pkgname=pipelinit-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Automatically generates pipelines for your project.'
arch=('x86_64')
url='https://github.com/pipelinit/pipelinit-cli'
license=('MIT')
source=("${url}/releases/download/v${pkgver}/pipelinit-v${pkgver}-${arch}-unknown-linux-gnu.tar.gz"
        "https://raw.githubusercontent.com/pipelinit/pipelinit-cli/main/LICENSE.txt")
sha256sums=('93951d642fcb3f7bf38eb465d995ebc7078db697b7e5dbf4ca14dfeb6853b112'
            '7ba70ff7f32281b75675edfa8d1eb83baf6b34feaeab06e62f4cb5eedb8f6aa0')
options=('!strip')

package() {
  install -Dm755 "pipelinit-v${pkgver}-${arch}-unknown-linux-gnu" "${pkgdir}/usr/bin/pipelinit"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

