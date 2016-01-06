# Maintainer: Artem Bezsmertnyi <artem.bezsmertny@gmail.com>
_author=tony
pkgname=tmuxp
pkgver=0.9.3
pkgrel=1
pkgdesc="Manage tmux workspaces from JSON and YAML, pythonic API, shell completion."
arch=(any)
url="https://github.com/tony/tmuxp"
license=('BSD')
depends=('python' 'python-argcomplete' 'python-kaptan' 'python-colorama')
options=(!emptydirs)
source=("https://github.com/tony/tmuxp/archive/v${pkgver}.tar.gz")
md5sums=('86952e604055e27cbabfce905fe5a2bd')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
