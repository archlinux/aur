# Maintainer: Artem Bezsmertnyi <artem.bezsmertny@gmail.com>
_author=tony
pkgname=tmuxp
pkgver=1.2.0
pkgrel=1
pkgdesc="Manage tmux workspaces from JSON and YAML, pythonic API, shell completion."
arch=(any)
url="https://github.com/tony/tmuxp"
license=('BSD')
depends=('python' 'python-argcomplete' 'python-libtmux' 'python-kaptan' 'python-colorama')
options=(!emptydirs)
source=("https://github.com/tony/tmuxp/archive/v${pkgver}.tar.gz")
md5sums=('9215408bb469323b452d33776fa27c1f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
