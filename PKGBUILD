# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Lucki <https://aur.archlinux.org/account/Lucki/>
# Contributor: Johan Reitan (venatux) <johan.reitan@gmail.com>
# Contributor: Kenneth Lyons (ixjlyons) <ixjlyons@gmail.com>

pkgname=python-poppler-qt5
pkgver=0.75.0
pkgrel=1
pkgdesc='Python binding to libpoppler-qt5.'
arch=('any')
url="https://github.com/frescobaldi/$pkgname"
license=('LGPL')
depends=('python-pyqt5' 'poppler-qt5')
makedepends=('python-sip-pyqt5' 'python-sip' 'sip' 'python-setuptools')
source=("https://github.com/frescobaldi/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('92e6bd8f4ce90ba4e3e0c2ada026b643481ba1b109d45e8fdbdaedca8416a995')

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize 1
}
