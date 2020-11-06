# Maintainer: Lukas Kucharczyk <lukas@kucharczyk.xyz>

pkgname=vivaldi-update-ffmpeg-hook
pkgver=1.0
pkgrel=1
pkgdesc="Hook to automatically enable proprietary media playback"
url=https://github.com/KucharczykL/vivaldi-update-ffmpeg-hook
arch=('any')
license=('GPL')
depends=('vivaldi')
noextract=()
source=("vivaldi-update-ffmpeg.hook")
sha256sums=('b6e9ca230a603f7cc7636a575b629274049565b7dfcdd16073da657317d74e84')

package() {
  install -Dm644 "${srcdir}/vivaldi-update-ffmpeg.hook" "${pkgdir}/usr/share/libalpm/hooks/vivaldi-update-ffmpeg.hook"
}
