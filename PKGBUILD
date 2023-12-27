# Maintainer: David Biro <dbiro97@gmail.com>

pkgname=vonal-bin
pkgver="v1.5"
pkgrel=1
pkgdesc='Global search for tiling window managers'
arch=(x86_64)
url='https://github.com/fxdave/vonal-rust'
license=('GPLv3')
provides=(vonal)
options=('!strip')
source=("${url}/releases/download/${pkgver}/vonal.tar.gz")
b2sums=('1df08061035d67231b62d96f2de54ed922797f43114757138d01b0286621c98de5bbc133170682430c6e72d38f7e40768ac1a39738e70d6f817476f7f6bd4d5e')

package() {
	install -D "${srcdir}/vonal" "${pkgdir}/usr/bin/vonal"
	install -D "${srcdir}/vonalc" "${pkgdir}/usr/bin/vonalc"
}
