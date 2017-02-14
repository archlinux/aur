# Contributor: Sherlock-Holo <sherlockya@gmail.com>

pkgname=pvim
pkgver=v0.3.1
pkgrel=1
pkgdesc="a script helps you quickly upload the codes or pictures to vim-cn"
url="https://github.com/Sherlock-Holo/pvim"
arch=('any')
license=('MPL')
depends=('xclip')
makedpends=('git')
source=("git://github.com/Sherlock-Holo/$pkgname.git")
md5sums=('SKIP')

package(){
        cd "${pkgname}"

        # Install
        install -Dm755 $pkgname.sh "${pkgdir}/usr/bin/${pkgname}"
}
