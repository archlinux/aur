# Maintainer: Miroslav Koškár <https://mkoskar.com/>

pkgname='xcursor-grounation'
pkgver=20160115
pkgrel=1
pkgdesc='Grounation X11 cursor theme'
url='https://moshiab.deviantart.com/art/Grounation-584580741'
license=(GPL)
arch=(any)

source=("$pkgname-$pkgver.tar::https://orig02.deviantart.net/e990/f/2016/015/0/a/grounationcursortheme_by_moshiab-d9o1ldx.tar")
sha256sums=(00c929a088354281bc44eecda78c022d802bbeae081a0414c63589b48f6c8dbe)

package() {
    cd Grounation
    install -D -m644 -t "$pkgdir/usr/share/icons/Grounation" index.theme
    cp -r --preserve=mode cursors "$pkgdir/usr/share/icons/Grounation"
}
