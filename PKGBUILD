# Maintainer: Ayrton Araujo <ayrton@linux.com>

pkgname=pipelinit-bin
pkgver=0.2.2
pkgrel=1
pkgdesc='Automatically generates pipelines for your project.'
arch=('x86_64')
url='https://github.com/pipelinit/pipelinit-cli'
license=('MIT')
source=("${url}/releases/download/v${pkgver}/pipelinit-v${pkgver}-${arch}-unknown-linux-gnu.tar.gz"
        "https://raw.githubusercontent.com/pipelinit/pipelinit-cli/main/LICENSE.txt")
sha256sums=('a33251d2193847e6d0bad0783ad758c7ce3d03c6ebf749f3af6f4483ac65a170'
            '7ba70ff7f32281b75675edfa8d1eb83baf6b34feaeab06e62f4cb5eedb8f6aa0')

package() {
  install -Dm755 pipelinit-v${pkgver}-${arch}-unknown-linux-gnu "${pkgdir}/usr/bin/pipelinit"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
