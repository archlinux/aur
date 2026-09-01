# Maintainer: Jag_k <30597878+jag-k@users.noreply.github.com>

pkgname=clipboard-transformer-bin
pkgver=0.1.6
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
sha256sums=('690c1fbdb7fdd8f1c9e7b623d7c74baf5de5fbbc0c4e8a02341c81200d525b7c')

package() {
  cp -r usr "${pkgdir}/"
}
