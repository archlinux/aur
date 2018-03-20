# Maintainer: Pablo <pablo1@mailbox.org>
pkgname=zebu
pkgver=1.0.0
pkgrel=1
pkgdesc="A Jinja2 + YAML based config templater written in python"
arch=(any)
url=""
license=('MIT')
groups=()
depends=('python' 'python-argcomplete' 'python-colorlog' 'python-jinja' 'python-pyaml' 'python-termcolor' 'python-watchdog')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=()
md5sums=()

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
