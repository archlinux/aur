# Maintainer: Bardiya <bardiyafeili@gmail.com>
pkgname=wttrbar-bin
pkgver=0.15.2
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
  'c16a8db80dcbbf95e3cee98f9d2bb52ce64607c0538ebd4cef7e6cc333e63417'
  '9bf212e0aa2728b6307e5a0daac43db8308529066c2513cc79e021eaec377e62'
)

package() {
  install -Dm755 "${srcdir}/wttrbar" "${pkgdir}/usr/bin/wttrbar"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
