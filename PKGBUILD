# Maintainer: nicknb <nicknb at posteo dot com>
_projectname=exdupe
pkgname=$_projectname-bin
pkgver=3.0.1
pkgrel=2
arch=("x86_64")
pkgdesc="Fast file archiver that supports data deduplication and differential backups"
url="https://github.com/rrrlasse/$_projectname"
license=("GPL-2.0-or-later")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${_projectname}_${pkgver}_linux_amd64.tar.gz")
b2sums=('6e2ac6b3a9e5364268cdd3462e20011d15db4384974abcea18bbac0cc0c59be78c28b11e6e934efcbbf848b067e75aa80fd00aa7311e66334ae71fb3f88f3429')

package() {
    install -Dm 0755 exdupe "$pkgdir/usr/bin/exdupe"
}
