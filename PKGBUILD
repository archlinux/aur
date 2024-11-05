# Maintainer: aarto <aarto@archlinux.org>
pkgname=mtracker-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='cli movie tracker - keep track of watched movies and series'
url='https://github.com/r-unruh/mtracker'
license=('MIT')
arch=('x86_64')
provides=('mtracker')
conflicts=('mtracker')
source=("https://github.com/r-unruh/mtracker/releases/download/v$pkgver/mtracker"
        "https://raw.githubusercontent.com/r-unruh/mtracker/refs/tags/v$pkgver/LICENSE")
b2sums=('3ec72abdea04cdd0ccf1d1d428c3eb00ee0e291328ee3c01da5bd823dc5081051e2583a0887de06c6bebe786a1a677d5e10f0cc3baef63f7cc722511cfebb9b7'
        'adc18026f965ed2dc8a5414d72af7f0e2e37ce4978e42bb9004e65399f6e3b61330f1ae8174d98747ea15f061d97d8c42a68327b9f8957659dd5216881e72ffc')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" mtracker
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
