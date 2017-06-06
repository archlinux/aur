pkgname=shufti
pkgver=2.2
pkgrel=1
pkgdesc="shufti - the persistent image viewer"
arch=('any')
license=('AGPL3')
depends=('python-pyqt5')
source=("git+https://github.com/danboid/shufti.git")
md5sums=('SKIP')
package() {
    cd "$srcdir/$pkgname"
    mv shufti.py shufti
    chmod +x shufti
    install -Dm 755 {,"${pkgdir}"/usr/bin/}shufti
}
