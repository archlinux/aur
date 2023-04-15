# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=skm-bin
pkgver=0.8.6
pkgrel=1
pkgdesc="A simple and powerful SSH keys manager"
arch=('x86_64')
url='https://timothyye.github.io/skm'
license=('MIT')
provides=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TimothyYe/skm/releases/download/v${pkgver}/skm_${pkgver}_Linux_x86_64.tar.gz"
        'LICENSE::https://github.com/TimothyYe/skm/raw/master/LICENSE')
sha256sums=('5e1a4d476f513ae71de9cf12de5563b27a2e5fb74b39e062955195812f1ddaf5'
            '9135a22d94f05de75cba7a299488e9155bb15634660e992138d2eb263e657004')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE" -t \
   "${pkgdir}/usr/share/licenses/${pkgname}"
}
