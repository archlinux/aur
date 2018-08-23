# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Noel Maersk <veox wemakethings net>
# Contributor: emhs <emhs08 gmail com>
# Contributor: Nils <mail n-sch de>

pkgname=emacs-markdown-mode
pkgver=2.3
pkgrel=1
pkgdesc='Emacs markdown-mode'
arch=('any')
url='http://jblevins.org/projects/markdown-mode/'
license=('GPL3')
depends=('emacs')
install="${pkgname}.install"
source=("https://github.com/defunkt/markdown-mode/archive/v${pkgver}/markdown-mode-${pkgver}.tar.gz")
sha256sums=('a309492fa01fac6ca75d2abc5ccac6bf459578fa273b42a348df37e8f0978cd3')

package() {
  cd "$srcdir/markdown-mode-${pkgver}"
  install -Dm644 markdown-mode.el "${pkgdir}"/usr/share/emacs/site-lisp/markdown-mode/markdown-mode.el
}
