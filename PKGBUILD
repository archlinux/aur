# Maintainer: nicknb <nicknb at posteo dot com>
_projectname=exdupe
pkgname=$_projectname-bin
pkgver=3.0.1
pkgrel=1
arch=("x86_64")
pkgdesc="Fast file archiver that supports data deduplication and differential backups"
url="https://github.com/rrrlasse/$_projectname"
license=("GPL-2.0-or-later")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${_projectname}_${pkgver}_linux_amd64.tar.gz")
b2sums=('ed2044b30df51a21b93e5e8de0f1dc4d9816c4528b09de3ef30d196ff4cdd74342f16e1a4a5ac6f39d9ec786a1b69497bcff5e12f65485878ff769bf1c4bb73f')

package() {
    install -Dm 0755 exdupe "$pkgdir/usr/bin/exdupe"
}
