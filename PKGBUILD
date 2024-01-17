pkgname=unofficial-wine-xiv-staging
pkgver=9.0
pkgrel=1
arch=('x86_64')
license=('LGPL')
pkgdesc="unofficial-wine-xiv-staging is a custom built wine for Final Fantasy XIV by Rankynbass (wine staging version)."
url="https://github.com/rankynbass/unofficial-wine-xiv-git"
source=(
    "https://github.com/rankynbass/unofficial-wine-xiv-git/releases/download/v9.0/unofficial-wine-xiv-staging-9.0.tar.xz"
)
md5sums=('360bb4d460f557e1d2e68954da6ea1a3')

package() {
  cd "$srcdir/unofficial-wine-xiv-staging-${pkgver}"
  mkdir -p "$pkgdir/opt/unofficial-wine-xiv-staging"

  for x in bin include lib share; do
    cp -ar $x "$pkgdir/opt/unofficial-wine-xiv-staging/"
  done
}

