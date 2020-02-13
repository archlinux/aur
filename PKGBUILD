# Maintainer: Martin Montane <martinmontane6@gmail.com>

pkgname=cmus-notify
pkgver=1.4.0
pkgrel=1
pkgdesc="A notification script for cmus"
arch=('any')
url="https://github.com/AntoineGagne/cmus-notify"
license=('MIT')
depends=('python>=3.5' 'python-notify2')

source=("https://files.pythonhosted.org/packages/68/92/15258efc93381715bb1db4ad1391b291efe3682bf06ac632e86dbde1d4d8/cmus-notify-1.4.0.tar.gz")
md5sums=('e4813a1f3b566cbed03795516e40f43c')

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
