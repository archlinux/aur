# Maintainer: Byeonghoon Yoo <bh322yoo gmail com>
# Contributor: Byeonghoon Yoo <bh322yoo gmail com>

_pkgname=dynamic_workspaces
pkgname=kwin-scripts-dynamic-workspaces
pkgver=3.0
pkgrel=1
pkgdesc='A kwin script that creates and deletes desktops as you move windows on the last one'
arch=('any')
url="https://github.com/maurges/${_pkgname}"
license=('BSD-3-Clause')
depends=('kwin')
source=("https://github.com/maurges/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3f3984ae71e78fdf15a918ab14d1f763b3a99f2d6ddb1f1c5e260a80b6998507')

package() {
  install -d "${pkgdir}/usr/share/kwin/scripts/${_pkgname}"
  cp -r "${srcdir}"/${_pkgname}-${pkgver}/{contents,metadata.json} "${pkgdir}/usr/share/kwin/scripts/${_pkgname}"
}
