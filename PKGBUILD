# Maintainer: Hilary Jendrasiak <sylogista@sylogista.pl>
pkgname='multi-yubikey-helper'
pkgdesc='Helps use multiple yubikeys (as smartcards) with the same subkeys.'
pkgver=1.0.0
pkgrel=2
_commit='df68e747647d8439438d10248262eb894bcdafdd'  # Temporal safety solution
arch=('any') 
url="https://github.com/jnaulty/${pkgname}"
license=('No license')  # Issue on github created, I hope jnaulty will reply
source=( "git+${url}.git#commit=${_commit}" )
sha512sums=( 'SKIP' )

build()
{
    cd ${pkgname}
    make configure
}

package()
{
    cd ${pkgname}
    make install
}

