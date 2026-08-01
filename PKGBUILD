# Maintainer: Jag_k <30597878+jag-k@users.noreply.github.com>

pkgname=clipboard-transformer-bin
pkgver=0.1.3
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
sha256sums=('b926f66c8f356dddaa40bfc9889a8be62e6eb8b46d91679e091848e36e7323b1')

package() {
  cp -r usr "${pkgdir}/"
}
