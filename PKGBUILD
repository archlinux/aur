# Maintainer: Zach Himsel <zach [at] himsel [dot] net>

pkgname=kwin-scripts-ultrawide-tiling
_reponame=Kwin-Ultrawide-Tiling
_scriptname=ultrawide-tiling
pkgdesc="Kwin script to add useful keyboard shortcuts for tiling-like window management"
pkgver=1.1.2
pkgrel=2
arch=('any')
url="https://github.com/zhimsel/${_reponame}"
license=('GPL2')
depends=('kwin>=5.26.1')
source=("https://github.com/zhimsel/${_reponame}/archive/${pkgver}.tar.gz")
sha512sums=('cde68007904267888b5689ed4124e6f155b8cc039e66b4c6c65f63e744e226382ebfd91517fb00e2ef5a2e4a04272310a495751772d9cc98bafbcbc4ba112fe9')

package() {
  install -d "${pkgdir}/usr/share/kwin/scripts/${_scriptname}"
  cp -r "${srcdir}/${_reponame}-${pkgver}"/{contents,metadata.json} "${pkgdir}/usr/share/kwin/scripts/${_scriptname}"
}
