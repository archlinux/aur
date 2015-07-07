# See AUR interface for current maintainer.
# Contributor: L.G. Sarmiento <lgsarmientop-ala-unal.edu.co>
# Contributor: Kostas Andreadis <kmandreadis@gmail.com>
pkgname=emacs-ipython-mode
pkgver=2927
pkgrel=1
pkgdesc="Emacs mode that replaces python-mode using the Ipython shell"
arch=('any')
url="http://ipython.scipy.org/moin/"
license=('GPL')
depends=('emacs' 'ipython' 'emacs-python-mode' 'bash')
source=("http://archive.ipython.org/old-site/ipython.el"
  'emacs-ipython-mode.install')
sha256sums=('1ebd204c0a1796bb7a78be6007805f1c'
         '587258bb5e224af645e231ab17fe9a92')
install=emacs-ipython-mode.install

build() {
  cd $startdir/src/
  install -Dm644 $srcdir/ipython.el $pkgdir/usr/share/emacs/site-lisp/ipython.el
}
