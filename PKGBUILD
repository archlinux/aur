# Contributor: Sherlock-Holo <sherlockya@gmail.com>
# Contributor: Sherlock-Holo <sherlockya@gmail.com>

pkgname=pvim
pkgver=v0.2
pkgrel=1
pkgdesc="a script to help you quickly upload the code to cfp-vim"
url="https://github.com/Sherlock-Holo/pvim"
arch=('any')
license=('MPL')
depends=('xclip')
makedpends=('git')
source=("git+https://github.com/Sherlock-Holo/$pkgname.git")
md5sums=('SKIP')

package(){
        cd "${pkgname}"

        # Install
        install -Dm755 $pkgname.sh "${pkgdir}/usr/bin/${pkgname}"
}
