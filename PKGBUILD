# Maintainer: Jag_k <30597878+jag-k@users.noreply.github.com>

pkgname=clipboard-transformer-bin
pkgver=0.1.2
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
sha256sums=('ab40fa72379589cc1bfae6b23c3ab218ed7364e2d906bbc195e5e4b4b4f2b258')

package() {
  cp -r usr "${pkgdir}/"
}
