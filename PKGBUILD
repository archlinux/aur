# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Lucki <https://aur.archlinux.org/account/Lucki/>
# Contributor: Johan Reitan (venatux) <johan.reitan@gmail.com>
# Contributor: Kenneth Lyons (ixjlyons) <ixjlyons@gmail.com>

pkgname=python-poppler-qt5
pkgver=0.74.0
pkgrel=1
pkgdesc='Python binding to libpoppler-qt5.'
arch=('any')
url="https://github.com/frescobaldi/$pkgname"
license=('LGPL')
depends=('python-pyqt5' 'poppler-qt5')
makedepends=('python-sip-pyqt5' 'python-sip' 'sip' 'python-setuptools')
source=("https://github.com/frescobaldi/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('8e073ec496a1c39bbe14b53d70c0a8628b7ec3fe0f8db0709440a6a6b553109f')

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize 1
}
