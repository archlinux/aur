# Maintainer: ljoonal <aur at ljoonal.xyz>
pkgname="resolute-bin"
pkgver="0.8.3"
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
  "2e27eff189a5e0ef9df1d68170be1cb58ff6b1034c2743b4314ba7263ff71bfc"
)

package() {
  cd "${pkgdir}"
  bsdtar -xf "${srcdir}/data.tar.gz"
}
