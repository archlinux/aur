# Maintainer: Jag_k <30597878+jag-k@users.noreply.github.com>

pkgname=clipboard-transformer-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Rule-based clipboard transformer (prebuilt)'
arch=('x86_64')
url='https://github.com/jag-k/clipboard-transformer'
license=('MPL-2.0')
depends=('glibc' 'libgcc' 'xdg-desktop-portal')
optdepends=(
  'wayland: native Wayland clipboard support'
  'xdg-utils: fallback for opening support links'
)
provides=('clipboard-transformer')
conflicts=('clipboard-transformer')
options=('!debug')
source=("clipboard-transformer-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/clipboard-transformer-app_${pkgver}_x86_64.tar.gz")
sha256sums=('6fff7a7a6b3df0f780e19cc36ecdd2f603af96f1cd6c550803648b93d66731d4')

package() {
  cp -r usr "${pkgdir}/"
}
