# Maintainer: Eduard T <edu4rdshl>
pkgname=greenlight-bin
_pkgname=greenlight
pkgver=2.3.1
pkgrel=1
pkgdesc='Open-source client for xCloud and Xbox home streaming made in Typescript.'
arch=('x86_64')
url='https://github.com/unknownskl/greenlight'
license=('MIT')
options=('!strip' '!emptydirs')
provides=('greenlight')
source=("https://github.com/unknownskl/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
        'LICENSE'::'https://raw.githubusercontent.com/unknownskl/greenlight/main-v2/LICENSE')
sha256sums=('18196f965a59077ffa1949e3538f8710c55c5758672a00a55b02fa1089c3d293'
            '4c90fa981a6336b1da8243ca50588beb48c875648f53123b74d5b052f9216ee4')

package(){
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"
}
