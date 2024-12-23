pkgname=unofficial-wine-xiv-staging
pkgver=9.22.1
pkgrel=1
arch=('x86_64')
license=('LGPL')
pkgdesc="unofficial-wine-xiv-staging is a custom built wine for Final Fantasy XIV by Rankynbass (wine staging version)."
url="https://github.com/rankynbass/unofficial-wine-xiv-git"
source=(
    "https://github.com/rankynbass/unofficial-wine-xiv-git/releases/download/v${pkgver}/unofficial-wine-xiv-staging-arch-${pkgver}.tar.zst"
)
md5sums=('466ec02e43f8a39f370e2f58ffe75fb7')

package() {
  cd "$srcdir/unofficial-wine-xiv-staging-${pkgver}"
  mkdir -p "$pkgdir/opt/unofficial-wine-xiv-staging"

  for x in bin include lib share; do
    cp -ar $x "$pkgdir/opt/unofficial-wine-xiv-staging/"
  done
}

