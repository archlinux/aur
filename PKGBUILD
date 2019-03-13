# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Lucki <https://aur.archlinux.org/account/Lucki/>
# Contributor: Johan Reitan (venatux) <johan.reitan@gmail.com>
# Contributor: Kenneth Lyons (ixjlyons) <ixjlyons@gmail.com>

pkgname=python-poppler-qt5
pkgver=0.25.3
pkgrel=1
pkgdesc='Python binding to libpoppler-qt5.'
arch=('any')
# url="https://github.com/wbsoft/${pkgname}"
url="https://github.com/zehome/$pkgname"
license=('LGPL')
depends=('python-pyqt5' 'poppler-qt5')
makedepends=('python-sip-pyqt5' 'python-sip' 'sip' 'python-setuptools')
# source=("https://github.com/wbsoft/${pkgname}/archive/v${pkgver}.tar.gz")
source=("https://github.com/zehome/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0dc5cf9556dbfff4b1beacc5001519d439d285c091d9c78ee4a53601d26a2275')

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize 1
}
