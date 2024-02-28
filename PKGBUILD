# Maintainer: ljoonal <aur at ljoonal.xyz>
pkgname="resolute-bin"
pkgver="0.8.1"
pkgrel=1
pkgdesc="Mod Manager GUI for Resonite"
arch=('x86_64')
url="https://github.com/Gawdl3y/Resolute"
license=('GPL-3-or-later')
depends=('gtk3' 'webkit2gtk' 'noto-fonts-emoji')
source=(
  "https://github.com/Gawdl3y/Resolute/releases/download/v$pkgver/resolute_${pkgver}_amd64.deb"
)
sha256sums=(
  "de41e7a2e2b1c5bd1e338372aafcdf7e46409358ab218bc56c0c32307be0153c"
)

package() {
  cd "${pkgdir}"
  bsdtar -xf "${srcdir}/data.tar.gz"
}
