# Maintainer: Udit Karode <udit.karode@gmail.com>
pkgname="ucc"
pkgver=2.8
pkgrel=1
pkgdesc="A bash based wrapper around the DOS based tcc, lets you compile TurboC(++) programs directly from the terminal."
arch=("x86_64")
url="https://github.com/uditkarode/ucc.git"
license=('sha265')
depends=('dosbox' 'git' 'wget' 'curl')
source=(${pkgname}::git+https://github.com/uditkarode/ucc.git)
md5sums=('SKIP')

package() {
	install -Dm777 "${pkgname}/ucc" "${pkgdir}/usr/bin/ucc"
	chmod a+x "${pkgdir}/usr/bin/ucc"
}

