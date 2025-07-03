# Maintainer: Nia Schlegel <nia@3nt3.de>

: ${_commit:=c54cd3ede4fc3257ef5a6904c215f82e24372735}

pkgname="ttf-osifont"
pkgbase="$_pkgname"
pkgver="1.0.0"
pkgrel=1
pkgdesc="Free TrueType font for CAD projects"
url="https://github.com/hikikomori82/osifont"
license=('GPL-3.0-with-font-exception')
arch=('any')

source=(
    https://github.com/hikikomori82/osifont/raw/${_commit}/osifont.ttf
    https://github.com/hikikomori82/osifont/raw/${_commit}/osifont-italic.ttf
    https://github.com/hikikomori82/osifont/raw/${_commit}/README.md

)

sha256sums=('c25475f0596cac572adde4a52bcff276a7d7e53fd9a47e8bada9023d68b3e6e2'
            'b42f97241fd3b84c2c1a74e5c9efd1582c6a2bac8d6198dad8b2d862cdf72f67'
            'SKIP')

package() {
  install -Dm644 osifont.ttf "${pkgdir}/usr/share/fonts/TTF/osifont.ttf"
  install -Dm644 osifont-italic.ttf "${pkgdir}/usr/share/fonts/TTF/osifont-italic.ttf"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
