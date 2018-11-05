# Maintainer: Ossi Saukko <osaukko at gmail dot com>

pkgname=uqm-lang-finnish
pkgver=1.0.0
pkgrel=0
pkgdesc="Finnish translation for The Ur-Quan Masters"
arch=(any)
url="https://github.com/osaukko/uqm-lang-finnish"
license=('custom')
depends=('uqm>=0.7.0')
source=('https://github.com/osaukko/uqm-lang-finnish/raw/master/uqm-0.7.0-fin.uqm'
        'https://raw.githubusercontent.com/osaukko/uqm-lang-finnish/master/LICENSE.md')
noextract=('uqm-0.7.0-fin.uqm')
install=$pkgname.install
md5sums=('df80eb832eab36a1106d1e57b9d08d85'
         'd5dcf8fe22f993182360db40bed564f9')

package() {
    install -Dm644 uqm-0.7.0-fin.uqm "${pkgdir}/usr/share/uqm/content/addons/uqm-0.7.0-fin.uqm"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

