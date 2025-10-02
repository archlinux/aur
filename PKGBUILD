# Maintainer: Eduard T <edu4rdshl>
pkgname=greenlight-bin
_pkgname=greenlight
pkgver=2.3.3
pkgrel=1
pkgdesc='Open-source client for xCloud and Xbox home streaming made in Typescript.'
arch=('x86_64')
url='https://github.com/unknownskl/greenlight'
license=('MIT')
options=('!strip' '!emptydirs')
provides=('greenlight')
source=("https://github.com/unknownskl/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-dektop_${pkgver}_amd64.deb"
        'LICENSE'::'https://raw.githubusercontent.com/unknownskl/greenlight/main-v2/LICENSE')
sha256sums=('c911bf70637fbe683568a5c5eb55cb69b46bde3bab0eb5272a64f9c99efb697e'
            '4c90fa981a6336b1da8243ca50588beb48c875648f53123b74d5b052f9216ee4')

package(){
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"
}
