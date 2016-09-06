# Maintainer: Giulio Girardi <giulio at rapgenic.it>

pkgname=nemo-run-with-nvidia
pkgver=0.0.2
pkgrel=0
pkgdesc="Nemo action to run a program with Bumblebee"
arch=('any')
url="https://github.com/rapgenic/nemo-run-with-nvidia"
license=('GPL2')
source=("https://github.com/rapgenic/${pkgname}/archive/${pkgver}.zip")
md5sums=('22de5d0c37b4ffa8a95e6ac64b520a07')
depends=('nemo' 'bumblebee')

package() {
  install -Dm0644 "$srcdir/${pkgname}-${pkgver}/usr/share/nemo/actions/run-with-nvidia.nemo_action" "$pkgdir/usr/share/nemo/actions/run-with-nvidia.nemo_action"
}
