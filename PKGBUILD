# Maintainer: wallace <use_my_id at gmail dot com>

pkgname='yakuake-session-git'
_gitname='yakuake-session'
pkgver=0d0d445
pkgrel=1
pkgdesc='A script to create new yakuake sessions from command-line or '.desktop' files'
arch=('any')
url="https://github.com/aplatanado/yakuake-session"
license=('BSD 2-Clause')
depends=('yakuake' 'wmctrl')
source=('git://github.com/aplatanado/yakuake-session.git')
md5sums=('SKIP')

package() {
    install -d "${pkgdir}/usr/bin"
    install "${srcdir}/${_gitname}/yakuake-session" "${pkgdir}/usr/bin"
} 
