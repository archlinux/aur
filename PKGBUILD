pkgname='sprunge'
release='0.6'
pkgver="${release}.0"
pkgrel=2
pkgdesc='Upload data to sprunge.us via stdin'
license=('GPL2')
url='https://github.com/kevr/sprunge'

arch=('i686' 'x86_64' 'armv6h')
depends=('python' 'python-requests')
conflicts=("${pkgname}-git")
optdepends=('xclip: default --clip-command')
source=("${url}/archive/${release}.tar.gz")
sha256sums=(
    '64a0d2ce9697da413fbcedcd8bff94569a05b92c5941fecff0c7bd30e0961f3b'
)

package()
{
    install -Dm755 "${srcdir}/${pkgname}-${release}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

