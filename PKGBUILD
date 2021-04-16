# Maintainer: chn <g897331845@gmail.com>
pkgname=qemu-guest-agent-bandwagonhost-kiwivm
pkgver=1
pkgrel=1
pkgdesc='make BandwagonHost KiwiVM control panel full functional'
arch=('any')
url='https://gist.github.com/unknowndev233/0852d2461b4ebbeebb58894830ff964e'
license=('MIT')
depends=('qemu-guest-agent')
source=("qemu-guest-agent-bandwagonhost-kiwivm.bash"
    "qemu-guest-agent-bandwagonhost-kiwivm.service")
sha512sums=('1bd1481048cb97d552b2a7230f6880ffe2fdc058360975b3b9dc9f1314f390e4f9caef1d7b93512d2d0ff63d217029ace1dc7be24f3c0ba0f745c8e779bff003'
    '1925f50c5d16dd7a3f71559fa1fcc33916c3da4138c295ec795fa1f22bef894a6e5c7598af3d8926313ddb1a1358278cf0d2fb76d67b9b08272446a48be37a64')
package() {
    mkdir -p $pkgdir/usr/bin
    install -Dm755 "$srcdir/qemu-guest-agent-bandwagonhost-kiwivm.bash" "$pkgdir/usr/bin"
    mkdir -p $pkgdir/usr/lib/systemd/system
    install -Dm644 "$srcdir/qemu-guest-agent-bandwagonhost-kiwivm.service" "$pkgdir/usr/lib/systemd/system"
}
