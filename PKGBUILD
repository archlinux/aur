# maintainer: libele <libele@disroot.org>

pkgname=vilearn
pkgver=1.1
pkgrel=1
pkgdesc="An interactive vi tutorial."
arch=('any')
url="https://tildegit.org/libele/vilearn"
license=('custom:Copyright (c) 1992 Jill Kliger and Wesley Craig')
optdepends=('vi: the original ex/vi text editor')
source=("https://tildegit.org/libele/vilearn/archive/vilearn-$pkgver.tar.gz")
b2sums=('ec1e631967f1734f2e8f58bc68e0f64099b73df1e0b9d043582e2b21026079f3b7e1b248036fbf4e37249e2d2ba8eb703a2457fe2081b48b7a366c8d675000dd')

package() {
  cd "${pkgname}"

  make DESTDIR=${pkgdir} install
  install -Dm644 README "${pkgdir}"/usr/share/vilearn
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/vilearn/LICENSE
}
