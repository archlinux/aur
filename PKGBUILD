pkgname=pacman-mandoc-update-hook
pkgver=1.0
pkgrel=0
pkgdesc='hook to update the manual pages database after every transaction if using mandoc'
depends=(mandoc)
arch=(any)
source=(makewhatis-update-database
        makewhatis-on-install.hook
        makewhatis-on-remove.hook)

package() {
    install -Dm0755 -t "$pkgdir/usr/share/libalpm/scripts/" ${source[0]}
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/"   ${source[1]} ${source[2]}
}

sha256sums=('6d0db57611ad4561d44581e5e71dd02fb32e47d7d07174f43bcfa2d1989a98fc'
            '756f0d9f73e28c371bba5b8f509ecee7fd63d666a80038df731a97aef5ad8d3f'
            'b5b20cbf6279d5d4dcf82ee85658f39d9fc6c48ecf8a844217d0d14fae74909d')
