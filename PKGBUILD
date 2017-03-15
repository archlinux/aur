# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Noel Maersk <veox wemakethings net>
# Contributor: emhs <emhs08 gmail com>
# Contributor: Nils <mail n-sch de>

pkgname=emacs-markdown-mode
pkgver=2.1
pkgrel=2
pkgdesc='Emacs markdown-mode'
arch=('any')
url='http://jblevins.org/projects/markdown-mode/'
license=('GPLv2')
depends=('emacs')
install="${pkgname}.install"
source=("https://github.com/defunkt/markdown-mode/archive/v${pkgver}/markdown-mode-${pkgver}.tar.gz")
sha256sums=('65d28802915a47056108b63eba3911e32de35c5d6b3c6898ca23ac414b0c4de7')

package() {
  cd "$srcdir/markdown-mode-${pkgver}"
  install -Dm644 markdown-mode.el "${pkgdir}"/usr/share/emacs/site-lisp/markdown-mode/markdown-mode.el
}
