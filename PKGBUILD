# Maintainer: M-Maciej <io3v819oa@mozmail.com>

pkgname=hyprland-screenshot
pkgver=1.0.1
pkgrel=1
pkgdesc="A hyprland screenshot tool with area, window, monitor, all monitors modes, using grim, slurp, notifications with libnotify and shutter sound with libcanberra."
arch=('any')
url="https://github.com/M-Maciej/hyprland-screenshot"
license=('LicenseRef-0BSD')
depends=(
  'grim'
  'slurp'
  'wl-clipboard'
  'hyprland'
  'jq'
  'libnotify'
  'libcanberra'
  'sh'
)
source=("${pkgname}.sh" "LICENSE")

package() {
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('18668e18bba6abcfdf68fe2e9c4643f26d2f610db44edc07ce0fc227636d1428'
            '62271420e251febb88cec99de1559002237ab980c2912e091d2f0d1b8bec7141')
