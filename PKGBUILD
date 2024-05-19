# Maintainer: Sherlock Holo <sherlockya@gmail.com>

pkgname=fvm-flutter-proxy
pkgver=1.0.0
pkgrel=1
pkgdesc="flutter fvm proxy"
arch=('any')
license=('MPL-2.0')
depends=('fvm')
source=(
    "fvm-dart.sh"
    "fvm-flutter.sh"
)
provides=("flutter" "dart")
conflicts=("flutter" "dart")

md5sums=('5c14f921a75035640d205dde32fb8425'
         'b51d0af495125e38ea8e69d4c2edca71')

package() {
    install -Dm755 fvm-flutter.sh $pkgdir/usr/bin/flutter
    install -Dm755 fvm-dart.sh $pkgdir/usr/bin/dart
}
