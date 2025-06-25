pkgname=kumono-bin
pkgver=0.43.0
pkgrel=2
pkgdesc='Media ripper for coomer.su and kemono.su'
url='https://github.com/APT37/kumono'
arch=('x86_64')
license=('MIT-0')
source=("kumono::$url/releases/download/$pkgver/kumono")
sha256sums=('4a8a68ce120408b93884dad128ebbcfa50ab2dfd8be8048e51e3cb17be162700')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 'kumono' -t "$pkgdir/usr/bin"
}
