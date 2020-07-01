# Maintainer: Carson Rueter <bottomtext97@gmail.com>
pkgname='passman'
pkgver=1.0.0  
pkgrel=1
pkgdesc="Super-secure, easy-to-use password manager."
arch=('any')
url="https://github.com/binex-dsk/passman-aur"
license=('GPL3')
provides=('passman')
depends=('python3' 'python-sqlalchemy')
source=("git+https://github.com/binex-dsk/passman-aur.git")
md5sums=('SKIP')

package() { 
	if [ -d ~/.config/passman != 0 ]; then mkdir ~/.config/passman; fi
        install -Dm755 "${srcdir}/passman-aur/passman" "${pkgdir}/usr/bin/passman"
	install -Dm755 "${srcdir}/passman-aur/passman.pyc" "${pkgdir}${HOME}/.config/passman/passman.pyc"
}
