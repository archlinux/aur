# Maintainer: Giulio Girardi <giulio at rapgenic.it>

pkgname=nemo-run-with-nvidia
pkgver=0.0.4
pkgrel=0
pkgdesc="Nemo action to run a program with Bumblebee"
arch=('any')
url="https://github.com/rapgenic/nemo-run-with-nvidia"
license=('GPL2')
source=("https://github.com/rapgenic/${pkgname}/archive/${pkgver}.zip")
md5sums=('31be993d8dd86fac71b53598c5e6c862')
depends=('nemo' 'bumblebee')

package() {
  install -Dm0644 "$srcdir/${pkgname}-${pkgver}/usr/share/nemo/actions/run-with-nvidia.nemo_action" "$pkgdir/usr/share/nemo/actions/run-with-nvidia.nemo_action"
}
