# Maintainer: Bardiya <bardiyafeili@gmail.com>
pkgname=wttrbar-bin
pkgver=0.15.1
pkgrel=1
pkgdesc="Weather indicator for Waybar"
arch=('x86_64')
url="https://github.com/bjesus/wttrbar"
license=('MIT')
depends=('openssl' 'gcc-libs' 'glibc')
provides=('wttrbar')
conflicts=('wttrbar' 'wttrbar-git')
source_x86_64=(
  "wttrbar::https://github.com/bjesus/wttrbar/releases/download/${pkgver}/wttrbar"
  "LICENSE::https://github.com/bjesus/wttrbar/releases/download/${pkgver}/LICENSE"
)
sha256sums_x86_64=(
  'ded1c9d58b6f0039b3820959b498f0c8493d71e3cbf5b4ec9c59d3beb49ec481'
  '9bf212e0aa2728b6307e5a0daac43db8308529066c2513cc79e021eaec377e62'
)

package() {
  install -Dm755 "${srcdir}/wttrbar" "${pkgdir}/usr/bin/wttrbar"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
