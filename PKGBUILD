# Maintainer: Jiachen Yang <farseerfc@gmail.com>
pkgname=systemd-report-entropy
pkgver=1
pkgrel=1
pkgdesc="report system entropy to journald during boot"
arch=(any)
url="http://github.com/farseerfc/systemd-report-entropy"
license=('custom:BSD')
depends=()
source=("$pkgname"
    "$pkgname.service"
    'LICENSE'
)
sha512sums=('9b344e44bdd3eef9f1f07fe69f9d8a1c6248f942f71a239e0a46290ac9d915da0c11c023477a5fc51b84e39436e1cb01874e3806396bbfaf83c1417a056eb371'
            '8c5be83a650cac8bb969091e586627cf24bbd1dc92011529541f244a589981d3e7b0973606e4af087f46034043a01f37c7cd4062fb8b5d00fc685ed0780848ad'
            '6b75fd3686d5b4ae44c7dae0ede5caf38203bb285242e2abaa6f587f357c11138e969fead87f8362834803cea3b1a488da7bfc952545110d0c9a02cf230d4e48')

package() {
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
