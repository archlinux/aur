# Maintainer: redmenace <aur.anatomy293@passinbox.com>

pkgname=awatcher-bundle-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="ActivityWatch-compatible activity and idle watchers, with bundled aw server"
arch=('x86_64')
url="https://github.com/2e3s/awatcher"
license=('MPL-2.0')
depends=()
source_x86_64=("https://github.com/2e3s/awatcher/releases/download/v0.3.3/awatcher_0.3.3-1_amd64.deb")
sha256sums_x86_64=("091d265b77eff8f33fcd90caea440f8a8185f7427c2e3f170af145a247cfbf2e")

package() {
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
