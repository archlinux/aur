# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Noel Maersk <veox wemakethings net>
# Contributor: emhs <emhs08 gmail com>
# Contributor: Nils <mail n-sch de>

pkgname=emacs-markdown-mode
pkgver=2.6
pkgrel=1
pkgdesc='Emacs markdown-mode'
arch=('any')
url='http://jblevins.org/projects/markdown-mode/'
license=('GPL3')
depends=('emacs')
install="${pkgname}.install"
source=("https://github.com/jrblevin/markdown-mode/archive/v${pkgver}.tar.gz")
sha256sums=('88c42f5ce7ec5a45c7d264c2a138522452cde044aaadf5cb4a298144f54f8225')

package() {
  cd "$srcdir/markdown-mode-${pkgver}"
  install -Dm644 markdown-mode.el "${pkgdir}"/usr/share/emacs/site-lisp/markdown-mode/markdown-mode.el
}
