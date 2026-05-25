# Maintainer: m1rkvl9 <ваша_почта@example.com>
pkgname=rctl
pkgver=1.3
pkgrel=1
pkgdesc="A small program to help systemd users switch to openrc"
arch=('x86_64')
url="https://github.com/kirillpolozok843-boop/rctl"
license=('MIT')
depends=('openrc')
source=("git+https://github.com/kirillpolozok843-boop/rctl.git")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    gcc $CFLAGS $LDFLAGS -o rctl rctl.c
}

package() {
    cd "$pkgname"
    install -Dm755 rctl "$pkgdir/usr/bin/rctl"
}
