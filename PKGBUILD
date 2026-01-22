# Maintainer: PharmaRacist
pkgname=noon-utils
pkgver=2.0.0
pkgrel=1
pkgdesc="Utility tools for Noon desktop environment"
arch=('any')
url="https://github.com/PharmaRacist/Noon"
license=('MIT')
depends=(
  'axel'
  'bc'
  'brightnessctl'
  'wl-clipboard'
  'grimblast-git'
  'coreutils'
  'curl'
  'ddcutil'
  'figlet'
  'fish'
  'jq'
  'ripgrep'
  'rsync'
  'tesseract'
  'tesseract-data-eng'
  'translate-shell'
  'wget'
  'xdg-user-dirs'
  'ydotool'
  'ntfs-3g'
  'uv'
)

package() {
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  echo "Utility tools for Noon" >"$pkgdir/usr/share/doc/$pkgname/README"
}
