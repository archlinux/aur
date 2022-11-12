# Maintainer: Diego Souza <diegosouza.br@gmail.com>
pkgname=hurl-bin
_pkgname=hurl
pkgver=1.8.0
pkgrel=1
pkgdesc="Hurl, run and test HTTP requests"
arch=('x86_64')
url="https://github.com/Orange-OpenSource/hurl"
license=('Apache')
source_x86_64=("https://github.com/Orange-OpenSource/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-linux.tar.gz")
sha256sums_x86_64=('125056d36d605b369dfdadd7316c7c893c67683ba2104924aaf462e6027c09af')

package() {
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/man/man1

	cp $srcdir/${_pkgname}-${pkgver}/{hurl,hurlfmt} $pkgdir/usr/bin/
	cp $srcdir/${_pkgname}-${pkgver}/{hurl,hurlfmt}.1.gz $pkgdir/usr/share/man/man1/
}
