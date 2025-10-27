pkgname_orig=oreo_cursors
pkgname=oreo-cursors-bin
pkgver=2025.10.27
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
    ${url_downstream}/releases/download/${pkgver}/install.tar.gz
)
sha512sums_x86_64=(
	'7fc62ad8168ae7b9400b312518d84e4d4c56b9c2711339f58de595d85e7cc8b3208019a512763eadfb161531cdfbe55e5f770c13ed4e305d15114c3dd18eaa18'
)

package(){
    # echo $srcdir
	# install -Dm755 "$srcdir/build" "$pkgdir/usr/share/icons/${pkgname_orig}"

    destdir=$pkgdir/usr/share/icons/
    mkdir -p "$destdir"
    cp -r $srcdir/install/usr/share/icons/* "$destdir/"
    chmod -R 755 "$destdir"
}
