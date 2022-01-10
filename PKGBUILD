# -*- mode: shell-script -*-
# Maintainer: Ruijie Yu <first plus arch at netyu dot xyz>

pkgname=askpass-menu
pkgver=0.0.1
pkgrel=2
arch=(any)
pkgdesc='Provide sudo-askpass functionalities for various menus.'
url="https://github.com/ruijieyu/$pkgname"
licence=(BSD-2)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('51cca048725f86b05fb8b2860fa8942ee067986a5ded4aa03ae3bbcd091aaa14b9bb9c40a87b4dfac8f3ab1978dc2daa4fa0396157465fe419918389bd97db97')
optdepends=(
    'sudo>1.7.0: sudo askpass'
    'bemenu: askpass-bemenu'
    'bash: shell scripts'
)

package() {
    install -Dm0755 \
            "$srcdir/$pkgname-$pkgver/askpass-"* \
            -t "$pkgdir/usr/bin/"
}
