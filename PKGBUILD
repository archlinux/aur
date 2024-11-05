# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=yarux
pkgver=0.0.0
pkgrel=1
pkgdesc="An elegant icon theme that extends Yaru's beautiful icons to third party applications"
url="https://github.com/ochi12/YaruX"
license=('MIT')
arch=('any')
source=("yarux-aaef88f.zip::$url/archive/aaef88f80545936ee1b32afa3538373c7afe9308.zip")
sha256sums=('132385e9af1902aab23668bcb0db9e239c4371a0fe8405631ae9235057f4baa9')

package() {
# Create a directory
  mkdir -p "$pkgdir/usr/share/icons"
# Install
  cd YaruX-aaef88f80545936ee1b32afa3538373c7afe9308
  mv YaruX "$pkgdir/usr/share/icons"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
