# Maintainer: M Nabil Adani nblid48[at]gmail[dot]com

pkgname=sqls-bin
pkgver=0.2.20
pkgrel=1
pkgdesc="SQL language server written in Go."
url="https://github.com/lighttiger2505/sqls"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lighttiger2505/sqls/releases/download/v$pkgver/sqls_${pkgver}_Linux_x86_64.tar.gz")
arch=('x86_64')
sha256sums=('eff41eaa301b3e055f7b3be2a755e7d1f68aca719883db6596ae6f7c88458edc')
conflicts=('sqls-git')

package() {
    cd $srcdir
    install -Dm755 sqls "${pkgdir}/usr/bin/sqls"
}

#vim: syntax=sh
