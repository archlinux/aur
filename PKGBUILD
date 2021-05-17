# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=pyqtenumconverter
pkgver=1.0
pkgrel=1
pkgdesc="Converts enums from PyQt5 to PyQt6"
arch=("any")
url="https://gitlab.com/JakobDev/PyQtEnumConverter"
license=("GPL3")
depends=("python-pyqt6" "python-setuptools")
optdepends=("python-qscintilla-qt6: Convert enums from QScintilla")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/PyQtEnumConverter/-/archive/${pkgver}/PyQtEnumConverter-${pkgver}.tar.gz")
sha256sums=("d20d47b16280145056f5caff553feb13db2cbb487a7f79a416329002dd8e1f58")

package() {
    cd "PyQtEnumConverter-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
} 
