pkgname=unofficial-wine-xiv-wayland
pkgver=9.0
pkgrel=1
arch=('x86_64')
license=('LGPL')
pkgdesc="unofficial-wine-xiv-wayland is a custom built wine for Final Fantasy XIV by Rankynbass (With wayland drivers)."
url="https://github.com/rankynbass/unofficial-wine-xiv-git"
source=(
    "https://github.com/rankynbass/unofficial-wine-xiv-git/releases/download/v9.0/unofficial-wine-xiv-wayland-9.0.tar.xz"
)
md5sums=('2ae713eae36b36c7de83561bdde1ac68')

package() {
  cd "$srcdir/unofficial-wine-xiv-wayland-${pkgver}"
  mkdir -p "$pkgdir/opt/unofficial-wine-xiv-wayland"

  for x in bin include share; do
    cp -ar $x "$pkgdir/opt/unofficial-wine-xiv-wayland/"
  done

  cp -ar lib64 "$pkgdir/opt/unofficial-wine-xiv-wayland/lib"
}

