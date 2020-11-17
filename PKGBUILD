# Maintainer: tuberry

pkgname=dict-ecdict
pkgver=1.0.0
pkgrel=1
pkgdesc="A port of Ultimate ECDICT database for Dictd"
arch=('any')
url="https://github.com/skywind3000/ECDICT-ultimate"
license=('MIT')
depends=('dictd')
makedepends=('dictd' 'git' 'curl' 'python' 'unzip')
install=${pkgname}.install
source=("git+https://github.com/tuberry/${pkgname}")
sha512sums=('SKIP')

package()
{
    cd ${pkgname}
    make DESTDIR=${pkgdir} install

    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
