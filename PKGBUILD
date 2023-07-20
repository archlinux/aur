# Maintainer: Dringsim <dringsim@qq.com>

pkgname=binfmt-perl
pkgver=1
pkgrel=1
pkgdesc="Register Perl interpreter"
arch=('any')
url="http://www.freedesktop.org/software/systemd/man/binfmt.d.html"
license=('Unlicense')
depends=('perl')
source=('perl.conf')
md5sums=('5d992cf025dfd2d565107640fb7c2ecc')

package() {
    install -Dm644 'perl.conf' "$pkgdir/usr/lib/binfmt.d/perl.conf"
}