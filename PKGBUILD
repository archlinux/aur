# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=janet-lang-bin
pkgver=1.14.1
pkgrel=1
pkgdesc='A dynamic Lisp dialect and bytecode vm'
arch=('x86_64')
url='https://janet-lang.org/'
license=('MIT')
provides=('janet')
conflicts=('janet-lang' 'janet-lang-git')

source=("https://github.com/janet-lang/janet/releases/download/v${pkgver}/${pkgname/\-lang-bin/}-v${pkgver}-linux.tar.gz")

sha256sums=('1767266a7a02f72e55dfe355384d17e6be4acb2903be9025338f12ad3ce5eeee')

package() {
  install -Dm755 "${srcdir}/${pkgname/\-lang-bin/}-v${pkgver}-linux/janet" "${pkgdir}/usr/bin/janet"
  install -Dm755 "${srcdir}/${pkgname/\-lang-bin/}-v${pkgver}-linux/jpm" "${pkgdir}/usr/bin/jpm"
}
