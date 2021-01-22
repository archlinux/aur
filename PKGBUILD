# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=pacdef
pkgver=0.1.1
pkgrel=1
pkgdesc='A declarative manager of Arch packages'
url='https://github.com/steven-omaha/pacdef'
source=("$pkgname-$pkgver.tar.gz::https://github.com/steven-omaha/pacdef/archive/v$pkgver.tar.gz")
arch=('any')
license=('GPL3')
depends=('python')
sha512sums=('379e5453c44973b6b52a6988f692fe8be03c8c27c0f8dd64d9189be92c5116b758dad002f7766afc3817f26b6a80791824daf941b0d87f26522a4cf657d2615b')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 pacdef "${pkgdir}/usr/bin/pacdef"
}
