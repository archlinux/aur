# Maintainer: ljoonal <aur at ljoonal.xyz>
pkgname="resolute-bin"
pkgver="0.7.1"
pkgrel=2
pkgdesc="Mod Manager GUI for Resonite"
arch=('x86_64')
url="https://github.com/Gawdl3y/Resolute"
license=('GPL-3-or-later')
depends=('gtk3' 'webkit2gtk' 'noto-fonts-emoji')
source=(
  "https://github.com/Gawdl3y/Resolute/releases/download/v$pkgver/resolute_${pkgver}_amd64.deb"
)
sha256sums=(
  "f3a600c649d85452af2af8b0feadd4bb860a8e06ad6ce84a70fcbbe83a0856fe"
)

package() {
  cd "${pkgdir}"
  bsdtar -xf "${srcdir}/data.tar.gz"
}
