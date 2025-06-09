pkgname=kumono-bin
pkgver=0.33.3
pkgrel=1
pkgdesc='Media ripper for coomer.su and kemono.su'
url='https://github.com/APT37/kumono'
arch=('x86_64')
license=('MIT-0')
source=("catbox::$url/releases/download/$pkgver/kumono")
sha256sums=('5c9468f00e64a23d1918bed36f2a19b8f92325b2fed96af22710794a1c0d1e56')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 'kumono' -t "$pkgdir/usr/bin"
}
