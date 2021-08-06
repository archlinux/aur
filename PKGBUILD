# Maintainer: Martin Montane <martinmontane6@gmail.com>

pkgname=cmus-notify
pkgver=1.4.1
pkgrel=2
pkgdesc="A notification script for cmus"
arch=('any')
url="https://github.com/AntoineGagne/cmus-notify"
license=('MIT')
depends=('python>=3.5' 'python-notify2' 'libnotify' 'python-pip')

source=("https://pypi.io/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8ac845a6596c259286802fd983c34ab3cee9345b5892cf936448e43fc7bd8380')

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
