# Maintainer: Armando Ibarra <armandoibarra1@gmail.com>
# Maintainer: Armando Ibarra <armandoibarra1[at]archlinux[dot]org>
# Contributor: flaketill <armandoibarra1 at gmail dot com>

pkgname=flaketill-dotfiles
_pkgname=dotfiles
pkgver=0.0.1
pkgrel=2
pkgdesc="A simple dotfiles restore for develop on Arch Linux x64"
arch=('x86_64')
#url="https://bitbucket.org/flaketill/dotfiles"
url="https://github.com/flaketill/dotfiles"
license=('GPL')

depends=('python2' 'espeak' 'dialog')
checkdepends=('gdb')
makedepends=('git' 'terminator' 'namcap')
optdepends=('gksu: sudo-save support',
		'alsa-lib: sound support')

#install=${pkgname}.install
#source=(git@bitbucket.org:flaketill/dotfiles.git)
#source=("git+https://flaketill@bitbucket.org/flaketill/dotfiles.git")
source=("git+https://github.com/flaketill/dotfiles.git")
#https://github.com/flaketill/flaketill-says
#source=("https://github.com/flaketill/dotfiles")
md5sums=('SKIP')

package() {
	cd ${srcdir}/${_pkgname}
	#install -Dm755 ${_pkgname}${pkgdir}/usr/bin/${pkgname}
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	#install -Dm644 man/${pkgname}.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1
}