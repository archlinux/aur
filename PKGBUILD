# Maintainer: Naïm Favier <n+aur@monade.li>
pkgname=efont-unicode-bdf
pkgver=0.4.2
pkgrel=1
pkgdesc="The /efont/ Unicode bitmap font"
arch=(any)
url="http://openlab.ring.gr.jp/efont/unicode/"
license=(BSD)
source=("https://web.archive.org/web/20150911101713/http://openlab.ring.gr.jp/efont/dist/unicode-bdf/$pkgname-$pkgver.tar.bz2")
md5sums=(0c0acbb40e44d899472001302b1c9e48)

package() {
    cd "$pkgname-$pkgver"
    install -Dm 644 -t "$pkgdir"/usr/share/fonts/misc *.bdf
    install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYRIGHT
}
