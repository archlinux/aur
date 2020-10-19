pkgname='sprunge'
pkgver='0.3.0'
pkgrel=1
pkgdesc='Upload data to sprunge.us via stdin'
license=('GPL2')
url='https://github.com/kevr/sprunge'

arch=('i686' 'x86_64' 'armv6h')
depends=('python')
optdepends=('xclip: default --clipboard-command.')
source=('sprunge')
sha256sums=(
    '098b1a2e84c4251d5bd68d017597bb483dacd8565e0f28042c90ae052f1d0fb0'
)

package()
{
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

