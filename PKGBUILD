pkgname='hastebin'
release='1.3'
pkgver="${release}.0"
pkgrel=1
pkgdesc='Upload data to hastebin.com via stdin'
license=('GPL2')
url='https://github.com/kevr/hastebin'

arch=('any')
depends=('python' 'python-requests')
conflicts=("${pkgname}-git")
optdepends=('xclip: default --clip-command')
source=("${url}/archive/${release}.tar.gz")
sha256sums=(
    '77823bb8624e20490148c2c39817c6544645d4fb8e6f00526180f0fcec829739'
)

package()
{
    install -Dm755 "${srcdir}/${pkgname}-${release}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

