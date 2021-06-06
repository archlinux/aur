# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=janet-lang-bin
pkgver=1.16.0
pkgrel=1
pkgdesc='A dynamic Lisp dialect and bytecode vm'
arch=('x86_64')
url='https://janet-lang.org/'
license=('MIT')
provides=('janet')
conflicts=('janet-lang' 'janet-lang-git')

source=("https://github.com/janet-lang/janet/releases/download/v${pkgver}/${pkgname/\-lang-bin/}-v${pkgver}-linux.tar.gz")

sha256sums=('43dbe0e55facb5f388271797d3f5b01d672f43ec57c2526e708d64fa0c59dd2b')

package() {
  install -Dm755 "${srcdir}/${pkgname/\-lang-bin/}-v${pkgver}-linux/bin/janet" "${pkgdir}/usr/bin/janet"
  install -Dm755 "${srcdir}/${pkgname/\-lang-bin/}-v${pkgver}-linux/bin/jpm" "${pkgdir}/usr/bin/jpm"
}
