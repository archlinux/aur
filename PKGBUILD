# Maintainer: Dct Mei <dctxmei@gmail.com>
pkgname=ariang-allinone
pkgver=1.0.0
pkgrel=1
pkgdesc="AriaNg, a modern web frontend making aria2 easier to use. (all-in-one version)"
arch=('any')
url="https://github.com/mayswind/AriaNg"
license=('MIT')
depends=("xdg-utils")
source=("https://github.com/mayswind/AriaNg/releases/download/1.0.0/AriaNg-1.0.0-AllInOne.zip"
        "$pkgname")
sha512sums=("f4e6eeb894a6a3aa35da4589460823565b53f286a139bd20c7e9371b9da1c36d579848205a00787a9d708f231d8bce346fdd8afbb7c26c387c0e5ef3c01b3721"
            "17aed8ae60919025b45741f21ac9485546199003e9fa9c1414fbf2934cbffe090678e3bb2b3f22b2b7d112ac68123a483a0a1f41f9f6781dc98a55442db62af9")

package() {
    install -Dm644 index.html "$pkgdir/usr/share/$pkgname/index.html"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
