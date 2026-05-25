# Maintainer: pruefsumme <bastian.rosinski@hotmail.com>

pkgname=osdockx
pkgver=0.1.0
pkgrel=1
pkgdesc='Transitional package: installs osdockx-git'
arch=('any')
url='https://github.com/pruefsumme/osdockx'
license=('MIT')
depends=('osdockx-git')
provides=('osdockx')
conflicts=('osdockx-bin')
options=('!strip' '!debug')

package() {
    install -Dm0644 /dev/stdin "$pkgdir/usr/share/doc/$pkgname/README.AUR" <<'EOF'
This is a transitional package.

Install osdockx-git for the current maintained package.
EOF
}
