# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=fbrowse-tray
pkgver=0.09
pkgrel=2

pkgdesc="A file-browser through a Gtk3 tray status icon."
url="https://github.com/trizen/${pkgname}"

arch=('any')
license=('GPL3')

depends=('perl>=5.16.0' 'perl-gtk3' 'perl-file-mimeinfo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('065b200812e42b3f4e33a8731d45a6d672033a0c7aefca3a5e15ba6db6d4e5e3b0e107c12831f9a500c9da5af9a214842268db69b8abae1b815f68db795d6f2a')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
