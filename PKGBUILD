# Maintainer: Allddd <allddd (at) proton (dot) me>

pkgname=dt-bin
pkgver=1.0.2
pkgrel=1
pkgdesc='DNS tool that displays information about your domain'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/42wim/dt'
license=('Apache')
source_i686=("${url}/releases/download/v${pkgver}/dt-${pkgver}-linux-386")
source_x86_64=("${url}/releases/download/v${pkgver}/dt-${pkgver}-linux-amd64")
source_aarch64=("${url}/releases/download/v${pkgver}/dt-${pkgver}-linux-arm64")
sha256sums_i686=('44d8ea606394e736d4bbdd1d3013535706eae2662753744637d57382538b1470')
sha256sums_x86_64=('0092a92c5a5e6350b06840fb0121db345040ce2c22e6cee50ae625a2ad24f142')
sha256sums_aarch64=('b878281751a2e7c5739d57bbffcd08546a138754d1b3df7efcd0570715520e91')

package() {
    install -Dm755 dt-* "${pkgdir}/usr/bin/dt"
}

# vim: ts=4 sw=4 et:
