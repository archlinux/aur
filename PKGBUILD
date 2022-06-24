# maintainer: libele <libele@disroot.org>

pkgname=vilearn
pkgver=1.1
pkgrel=2
pkgdesc="An interactive vi tutorial."
arch=('any')
url="https://tildegit.org/libele/vilearn"
license=('custom:Copyright')
optdepends=('vi: the original ex/vi text editor')
source=("https://tildegit.org/libele/vilearn/archive/vilearn-$pkgver.tar.gz")
b2sums=('f4ef596543b8d777990205129061c8417e457de41283cb58d51aba491f0382f8fec740c34919a9712472692f104a36805d6efdae7ee6e5bb9b649bb5170894fa')

package() {
  cd "${pkgname}"

  make DESTDIR=${pkgdir} install
  install -Dm644 README.md "${pkgdir}"/usr/share/vilearn/README
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/vilearn/LICENSE
}
