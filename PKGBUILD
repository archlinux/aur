pkgname='hastebin'
release='1.2'
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
    'b02f7f2178dad239233045932752d198c55f30a9dc10dd9f0edc9f2b9a0932e3'
)

package()
{
    install -Dm755 "${srcdir}/${pkgname}-${release}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

