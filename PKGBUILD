# Maintainer: M-Maciej <io3v819oa@mozmail.com>

pkgname=hyprland-screenshot
pkgver=1.0.2
pkgrel=1
pkgdesc="A hyprland screenshot tool with area, window, monitor, all monitors modes, using grim, slurp, notifications with libnotify and shutter sound with libcanberra."
arch=('any')
url="https://github.com/M-Maciej/hyprland-screenshot"
license=('MIT')
depends=(
  'grim'
  'slurp'
  'wl-clipboard'
  'hyprland'
  'jq'
  'libnotify'
  'libcanberra'
  'sh'
  'xdg-utils'
)
optdepends=(
  'noto-fonts-emoji: display emoji icons in notifications'
)
source=("${pkgname}.sh" "LICENSE")
sha256sums=('6989a56aa4011ccdba899c948eeaef42627ef2d9909cfb61a78db7ea74c0c2f4'
            '6baec815498f2fba64e76ad1b87ba1391971257c62ed8e4251b812fd50db0f3b')

package() {
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
