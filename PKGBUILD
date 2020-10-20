pkgname='sprunge'
release='0.4'
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
    'dbecea4711476824e1a35f909d505621c92a579a46ab9fd6cf0c14182193dac3'
)

package()
{
    install -Dm755 "${srcdir}/${pkgname}-${release}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

