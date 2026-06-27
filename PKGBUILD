# Maintainer: tee < teeaur at duck dot com >
pkgname=glaredb-bin
pkgver=25.6.3
pkgrel=1
pkgdesc='A light and fast SQL database for analytics'
arch=(x86_64)
url="https://glaredb.com"
license=(MIT)
source_x86_64=("glaredb-$pkgver::https://github.com/GlareDB/glaredb/releases/download/v$pkgver/glaredb-linux-$arch")
b2sums_x86_64=('3875b59d2f5f852352a19ff08ae176eab69f2c845af82463aa416e475f2e7afea1b8c7e33d86ef97a4d949d71a1c9ad9b55db1f2dff5d4c5ad29e2a2431a0b6f')
package() {
    install -Dm755 "glaredb-$pkgver" "$pkgdir/usr/bin/glaredb"
}
