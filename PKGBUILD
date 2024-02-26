# Maintainer: Simon <simon at gamersi dot at>
pkgname=lrcget-bin
pkgver=0.3.0
pkgrel=3
options=(!debug)
pkgdesc="Utility for mass-downloading LRC synced lyrics for your offline music library."
arch=('x86_64')
url="https://github.com/tranxuanthang/lrcget"
license=('MIT')
depends=('gtk3' 'webkit2gtk')
source=("${pkgname}-${pkgver}.deb::https://github.com/tranxuanthang/lrcget/releases/download/${pkgver}/lrcget_${pkgver}_amd64.deb")
b2sums=('SKIP')

package() {
  tar -xz -f data.tar.gz -C "$pkgdir"
}
