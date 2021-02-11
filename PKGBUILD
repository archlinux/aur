# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=janet-lang-bin
pkgver=1.15.0
pkgrel=1
pkgdesc='A dynamic Lisp dialect and bytecode vm'
arch=('x86_64')
url='https://janet-lang.org/'
license=('MIT')
provides=('janet')
conflicts=('janet-lang' 'janet-lang-git')

source=("https://github.com/janet-lang/janet/releases/download/v${pkgver}/${pkgname/\-lang-bin/}-v${pkgver}-linux.tar.gz")

sha256sums=('d0a884b76df769bcc462dd915ee2c67a8b15e2bdd77611097e861503107eb0ef')

package() {
  install -Dm755 "${srcdir}/${pkgname/\-lang-bin/}-v${pkgver}-linux/janet" "${pkgdir}/usr/bin/janet"
  install -Dm755 "${srcdir}/${pkgname/\-lang-bin/}-v${pkgver}-linux/jpm" "${pkgdir}/usr/bin/jpm"
}
