# Maintaoner: Yamada Hayao <development@fascode.net>
# Maintainer: Abraham Levine <echo iue@trnspljc.890 | tr ietursnpl890jc acprlsurecomed>

pkgname=aptpac
pkgver=2.2.0
pkgrel=1
pkgdesc="a pacman wrapper with syntax from debian's apt"
arch=('any')
url="https://github.com/FascodeNet/aptpac"
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
        cd "${pkgdir}/usr/bin/"
        ln -s "aptpac" "apt"
        ln -s "aptpac" "apt-get"
}
