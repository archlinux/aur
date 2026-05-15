# Maintainer: Rio <dateshidze.gio@gmail.com>
pkgname=emojify-bin
pkgver=1.2.4
pkgrel=1
pkgdesc="An emoji picker made to be fast. (GTK4/C++)"
arch=('x86_64')
url="https://github.com/RioTheDev/emojify"
license=('GPL3')
depends=('gtkmm-4.0' 'glibmm-2.68' 'libadwaita')
provides=('emojify')
conflicts=('emojify')

source_x86_64=("${url}/releases/download/v${pkgver}/emojify-x86_64.tar.gz")

sha256sums_x86_64=('5bc0295fcfde564bb21dd5112fe2cb89f4c333f913f3e9b7908ccf4fe8e339c6')

package() {
  cp -rv "${srcdir}/usr" "${pkgdir}/"
}
