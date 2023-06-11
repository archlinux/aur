pkgname=isleward
pkgver=0.12
pkgrel=1
pkgdesc="The moddable, multiplayer roguelike."
arch=('i686' 'x86_64')
url="https://gitlab.com/Isleward/isleward"
license=('custom')
depends=(npm)
optdepends=()
source=('git+https://gitlab.com/Isleward/isleward.git')
md5sums=('SKIP')


build (){
   cd "${srcdir}/${pkgname}/src/server/"
   npm install
}


package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cd "${srcdir}/${pkgname}/src/server/"
    mv * "${pkgdir}/opt/${pkgname}/"
}
