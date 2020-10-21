pkgname='sprunge'
release='0.5'
pkgver="${release}.0"
pkgrel=1
pkgdesc='Upload data to sprunge.us via stdin'
license=('GPL2')
url='https://github.com/kevr/sprunge'

arch=('i686' 'x86_64' 'armv6h')
depends=('python')
conflicts=("${pkgname}-git")
optdepends=('xclip: default --clip-command')
source=("${url}/archive/${release}.tar.gz")
sha256sums=(
    '20c4d5e00b579e1b51846faa7c71da0e5281652354ab0f5c3005f0f3d84f070d'
)

package()
{
    install -Dm755 "${srcdir}/${pkgname}-${release}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

