# Maintainer: TrekDev <trekdev0 at gmail dot com>

pkgname=emacs-solidity-mode-git
pkgver=1.0.0
pkgrel=1
pkgdesc='Solidity mode package for Emacs'
url='https://github.com/ethereum/emacs-solidity'
arch=('any')
license=('MIT')
source=("${pkgname}-${pkgver}::git+https://github.com/ethereum/emacs-solidity")
depends=('emacs')
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -dm0755 $pkgdir/usr/share/emacs/site-lisp/solidity-mode
  install -dm0755 $pkgdir/usr/share/doc/emacs-solidity-mode
  install -m0644 *.el -t $pkgdir/usr/share/emacs/site-lisp/solidity-mode
  install -m0644 README.org $pkgdir/usr/share/doc/emacs-solidity-mode/README
}
