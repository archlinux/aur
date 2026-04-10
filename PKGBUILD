pkgname=paga-bin
_pkgname=paga
pkgver=0.1.0
pkgrel=1
pkgdesc='Terminal pager, alternative to more/less (pre-compiled binary)'
arch=('x86_64')
url='https://github.com/StudiCraft/paga'
license=('Apache-2.0')
depends=('gcc-libs')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=paga.install
source=("$_pkgname-$pkgver::https://github.com/StudiCraft/paga/releases/download/v$pkgver/paga"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/StudiCraft/paga/v$pkgver/LICENSE")
sha256sums=('f0abcd19f705b3f0bb6667dd6f7104d87e86f890959fb00bf6b1575e58c6bda4'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

package() {
    install -Dm755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
