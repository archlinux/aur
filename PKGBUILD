# Maintainer: Diego Souza <diegosouza.br@gmail.com>
pkgname=hurl-bin
_pkgname=hurl
pkgver=1.6.0
pkgrel=1
pkgdesc="Hurl, run and test HTTP requests"
arch=('x86_64')
url="https://github.com/Orange-OpenSource/hurl"
license=('Apache')
source_x86_64=("https://github.com/Orange-OpenSource/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-linux.tar.gz")
sha256sums_x86_64=('7221e38506432865894033987edba35bdbf5045d17b68313459ad344f36ce9bd')

package() {
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/man/man1

	cp $srcdir/${_pkgname}-${pkgver}/{hurl,hurlfmt} $pkgdir/usr/bin/
	cp $srcdir/${_pkgname}-${pkgver}/{hurl,hurlfmt}.1.gz $pkgdir/usr/share/man/man1/
}
