_pkgname=sast-evento
pkgname=${_pkgname}-bin

pkgver="2.0.42"
_hotfix=1
_pkgrel=0
pkgrel="$((_pkgrel+_hotfix))"
replace=('sast-evento-appimage')

pkgdesc='An event management system developed and used by NJUPT SAST (binary package)'

license=('MIT')

arch=('x86_64')

url="https://github.com/NJUPT-SAST/sast-evento"

provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.${_hotfix}-pacman-linux-x64.pkg.tar.zst")
#source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('1627c226d673e0ac703e47c2c5dffd38ce76c678714a3b8e472e29650fc2dffd')
#sha256sums_aarch64=('673f5e094a4732983cc924161435c51c5f455a3debb3711f07393416e50910df')

package() {
    cp -r ${srcdir}/* ${pkgdir}
}
