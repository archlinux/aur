# Maintainer: Simon <simon at gamersi dot at>
pkgname=lrcget-bin
pkgver=0.9.3
pkgrel=2
options=(!debug)
pkgdesc="Utility for mass-downloading LRC synced lyrics for your offline music library."
arch=('x86_64')
url="https://github.com/tranxuanthang/lrcget"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'pipewire-alsa')
source=("${pkgname}-${pkgver}.deb::https://github.com/tranxuanthang/lrcget/releases/download/${pkgver}/LRCGET_${pkgver}_amd64.deb")
b2sums=('SKIP')

package() {
  tar -xz -f data.tar.gz -C "$pkgdir"
}
