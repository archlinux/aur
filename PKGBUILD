# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Noel Maersk <veox wemakethings net>
# Contributor: emhs <emhs08 gmail com>
# Contributor: Nils <mail n-sch de>

pkgname=emacs-markdown-mode
pkgver=2.5
pkgrel=1
pkgdesc='Emacs markdown-mode'
arch=('any')
url='http://jblevins.org/projects/markdown-mode/'
license=('GPL3')
depends=('emacs')
install="${pkgname}.install"
source=("https://github.com/jrblevin/markdown-mode/archive/v${pkgver}.tar.gz")
sha256sums=('188964f604ac04728dc3cbb188b91f1b385d818f583a9930f4c8f781fe9e7e58')

package() {
  cd "$srcdir/markdown-mode-${pkgver}"
  install -Dm644 markdown-mode.el "${pkgdir}"/usr/share/emacs/site-lisp/markdown-mode/markdown-mode.el
}
