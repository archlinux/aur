# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=python-telethon-session-sqlalchemy
_pkgname=telethon-session-sqlalchemy
pkgver=0.2.15
pkgrel=1
pkgdesc="SQLAlchemy backend for Telethon session storage"
url="https://github.com/tulir/telethon-session-sqlalchemy"
depends=('python')
makedepends=('python3' 'python-setuptools')
license=('')
arch=('any')
source=("https://files.pythonhosted.org/packages/5a/cf/e558fe7af77ba06251916e1c5450e156e96709e47df4c5c782a2ac077ae7/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('2ba603d95d5be6ddecd8ecaeaffba00b75b49dd80eb77f6228dd7b793ca67fd2')

build() {
    cd telethon-session-sqlalchemy-${pkgver}
    python setup.py build
}

package() {
    cd telethon-session-sqlalchemy-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
