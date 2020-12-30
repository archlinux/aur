# Maintainer  : Kr1ss $(sed s/\+/./g\;s/\-/@/ <<<\<kr1ss+x-yandex+com\>)
# Contributor : Chris Trotman <chris@trotman.io>


pkgname=btrfs-du

pkgver=0.0.7
pkgrel=2

pkgdesc='Easily print BTRFS subvolume/snapshot disk usage'
arch=('any')
url="https://github.com/nachoparker/$pkgname"
license=('GPL3')

depends=('btrfs-progs')

source=("$pkgname-$pkgver.tgz::https://github.com/nachoparker/btrfs-du/archive/v$pkgver.tar.gz")
sha256sums=('10dc3d1180ae9a17de4ea4dc6febc27b28c000bb6922d9d3d2b1e99521ff2e64')


package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" -t"$pkgdir/usr/bin/"
    install -Dm644 README.md  -t"$pkgdir/usr/share/doc/$pkgname/"
}


# vim: ts=4 sw=4 et ft=PKGBUILD:
