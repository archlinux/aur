# Maintainer:  Xavier Dectot <firstname dot lastname at gmail dot com>

pkgname=otf-antykwa-poltawskiego
pkgver=1.02
pkgrel=1
pkgdesc="Open Type Antiqua Półtawskiego, a typeface designed by Adam Połtawski"
arch=('any')
url="http://jmn.pl/en/antykwa-poltawskiego"
license=('CUSTOM')
depends=()
source=("ap1.101otf.zip::http://jmn.pl/download/ap1.101otf.zip")
sha256sums=('0e13bd202a95da792fc9147c53b69b57b6d67fcd02d9412a74e87360b4f669c9')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
}
