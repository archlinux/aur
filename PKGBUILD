# Maintainer: jef <jeffreylec@gmail.com>

pkgname=gruvbox-tilix
pkgver=1.0.0
pkgrel=1
pkgdesc="Gruvbox theme for Tilix"
arch=("any")
url="https://github.com/MichaelThessel/tilix-gruvbox"
license=("MIT")
depends=("tilix>=1.5")
makedepends=("git")
source=("$pkgname::git+https://github.com/MichaelThessel/tilix-gruvbox.git")
md5sums=("SKIP")

package() {
  cd "${srcdir}/${pkgname}"
  install -dm755 "$pkgdir/usr/share/tilix/schemes"
  install -Dm644 "gruvbox-dark-hard.json" "$pkgdir/usr/share/tilix/schemes"
  install -Dm644 "gruvbox-dark-medium.json" "$pkgdir/usr/share/tilix/schemes"
  install -Dm644 "gruvbox-dark-soft.json" "$pkgdir/usr/share/tilix/schemes"
  install -Dm644 "gruvbox-dark.json" "$pkgdir/usr/share/tilix/schemes"
  install -Dm644 "gruvbox-light-hard.json" "$pkgdir/usr/share/tilix/schemes"
  install -Dm644 "gruvbox-light-medium.json" "$pkgdir/usr/share/tilix/schemes"
  install -Dm644 "gruvbox-light-soft.json" "$pkgdir/usr/share/tilix/schemes"
}
