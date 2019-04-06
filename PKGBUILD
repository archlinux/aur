# Maintainer: Dct Mei <dctxmei@gmail.com>

pkgname=ariang-allinone
pkgver=1.0.2
pkgrel=2
pkgdesc="AriaNg, a modern web frontend making aria2 easier to use. (all-in-one version)"
arch=('any')
url="https://github.com/mayswind/AriaNg"
license=('MIT')
depends=("xdg-utils")
source=("https://github.com/mayswind/AriaNg/releases/download/$pkgver/AriaNg-$pkgver-AllInOne.zip"
        "$pkgname")
sha512sums=("458fc9eb375a390883bf124267d9598a1e88617e97886ef54f9ff388f2ce6e702968ae1068a7a1336f47f9b421bd049ed106482d51f6ae6bedf15b989f5eaa47"
            "17aed8ae60919025b45741f21ac9485546199003e9fa9c1414fbf2934cbffe090678e3bb2b3f22b2b7d112ac68123a483a0a1f41f9f6781dc98a55442db62af9")

package() {
    install -Dm 644 index.html "$pkgdir/usr/share/$pkgname/index.html"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
