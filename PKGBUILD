# Maintaoner: Yamada Hayao <development@fascode.net>
# Maintainer: Abraham Levine <echo iue@trnspljc.890 | tr ietursnpl890jc acprlsurecomed>

pkgname=aptpac
pkgver=2.0.0
pkgrel=1
pkgdesc="a pacman wrapper with syntax from debian's apt"
arch=('i686' 'x86_64')
url="https://github.com/Hayao0819/aptpac"
license=('WTFPL')
depends=('sudo')
makedepends=('git')
source=("${url}/archive/v${pkgver}.zip")
md5sums=('SKIP')
_gitname='aptpac'
conflicts=('apt' 'apt-git' 'aptpac-git')


package() {
        cd "${_gitname}-${pkgver}" &&
        install -m 755 -D aptpac "${pkgdir}/usr/bin/aptpac"
        ln -s "${pkgdir}/usr/bin/aptpac" "${pkgdir}/usr/bin/apt"
        ln -s "${pkgdir}/usr/bin/aptpac" "${pkgdir}/usr/bin/apt-get"
}
