# Maintainer: meerkat-b <noreply@github.com>
pkgname=portago
pkgver=0.0.2
pkgrel=1
pkgdesc="Portable, single-binary Go IDE built on Neovim"
arch=('x86_64')
url="https://github.com/meerkat-b/portago"
license=('GPL-3.0-only')
depends=('glibc')
source=("https://github.com/meerkat-b/portago/releases/download/v${pkgver}/portago_${pkgver}_linux_amd64.tar.gz")
sha256sums=('d48cfded026fbff1c9c041eed59af900ae06bfc12dd2674e53b860d979bba803')

package() {
  install -Dm755 portago "${pkgdir}/usr/bin/portago"
}
