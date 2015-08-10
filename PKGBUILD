# Maintainer: Artem Bezsmertnyi <artem.bezsmertny@gmail.com>
_author=tony
_abbrev_commit=5eb1bd0
pkgname=tmuxp
pkgver=0.9.0
pkgrel=0
pkgdesc="Manage tmux workspaces from JSON and YAML, pythonic API, shell completion."
arch=(any)
url="https://github.com/tony/tmuxp"
license=('BSD')
depends=('python' 'python-argcomplete' 'python-kaptan')
options=(!emptydirs)
source=("https://github.com/tony/tmuxp/archive/v${pkgver}.tar.gz")
md5sums=('82260efadc770413873bfefd680a6fcd')

package() {
  # Use find because github packs sources into a dir named
  # user-repo-commit_sha.
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
