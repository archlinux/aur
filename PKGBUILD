pkgname=mdli-bin
pkgver=0.2
pkgrel=4
pkgdesc="A MDL interpreter"
arch=('x86_64')
conflicts=('mdli')
provides=('confusion')
url='http://www.russotto.net/git/mrussotto/confusion'
license=('GPL')
source=("http://eel.sdf.org/pit/confusion-0.2.tgz")
md5sums=('608153a384f4f7a6040340eceace10dd')

package() {
  cd "${srcdir}"
  cd confusion-"${pkgver}"

  install -Dm755 mdli "${pkgdir}"/usr/bin/mdli
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
