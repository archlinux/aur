# Maintainer: Ryan Gonzalez <rymg19@gmail.com>

pkgname=('mrkd')
pkgver=0.1.5
pkgrel=1
pkgdesc='Write man pages using Markdown, and convert them to Roff or HTML.'
arch=('any')
url='https://github.com/kirbyfan64/mrkd'
license=('BSD')
makedepends=('python-setuptools')
depends=('python-setuptools' 'python-jinja' 'python-mistune' 'python-plac' 'python-pygments')
source=(https://pypi.org/packages/source/m/mrkd/mrkd-$pkgver.tar.gz)
sha256sums=('95dd3d6f24bf71d592dba35b58e7c7f0c4344dabd77ade876cb8008aba832ae9')

package() {
  cd "$srcdir/mrkd-$pkgver"
  python setup.py install --root="$pkgdir" -O1
}
