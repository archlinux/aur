pkgname_orig=oreo_cursors
pkgname=oreo-cursors-bin
pkgver=2025.2.10
pkgrel=1
pkgdesc="Oreo cursors (binary)"
arch=('x86_64')
url=https://github.com/varlesh/oreo-cursors
url_downstream=https://github.com/bonecountysheriff/oreo-cursors
provides=()
license=('MIT')
depends=()
conflicts=('oreo-cursors-git')
builddirname=build
source_x86_64=(
    ${url_downstream}/releases/download/${pkgver}/build.tar.gz
)
sha512sums_x86_64=(
	'75f932c3aebd203cf7d037ab1bf8cbb6dd3f0181636ee1902e10634f1e690c32354488b88a17944b8c0fc2798a318a166e43f7ecd8db64cf0ddeb81cddc898bf'
)

package(){
    # echo $srcdir
	# install -Dm755 "$srcdir/build" "$pkgdir/usr/share/icons/${pkgname_orig}"

    destdir=$pkgdir/usr/share/icons/
    mkdir -p "$destdir"
    cp -r "$srcdir/build" "$destdir/${pkgname_orig}"
    chmod -R 755 "$destdir"
}
