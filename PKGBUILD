# Maintainer: maoyaotang <292898660@qq.com>

pkgbase=ttf-honorsans-git
pkgname=(ttf-honorsans-git ttf-honorsansarabic-git ttf-honorsanscn-git ttf-honorsanstc-git)
_pkgname=HONORSans
_pkgname1=HONORSansArabic
_pkgname2=HONORSansCN
_pkgname3=HONORSansTC
pkgver=1.2.r6.g9e4dbb0
pkgrel=1
pkgdesc='华为HONORSans中文简繁字体添加nerd补丁    '
arch=('any')
url='https://developer.honor.com/cn/doc/guides/100681'
license=('custom')
provides=('HONORSans')
source=("git+https://github.com/maoyaotang12/HONORSans.git")
sha256sums=('SKIP')
pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

package_ttf-honorsans-git() {
  cd "${_pkgname}"
  install -dm 755 "${pkgdir}/usr/share/fonts/$_pkgname"
  cp -r ${srcdir}/$_pkgname/$_pkgname "${pkgdir}/usr/share/fonts/$_pkgname"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

package_ttf-honorsansarabic-git() {
  cd "${_pkgname}"
  install -dm 755 "${pkgdir}/usr/share/fonts/$_pkgname"
  cp -r ${srcdir}/$_pkgname/$_pkgname1 "${pkgdir}/usr/share/fonts/$_pkgname"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

package_ttf-honorsanscn-git() {
  cd "${_pkgname}"
  install -dm 755 "${pkgdir}/usr/share/fonts/$_pkgname"
  cp -r ${srcdir}/$_pkgname/$_pkgname2 "${pkgdir}/usr/share/fonts/$_pkgname"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

package_ttf-honorsanstc-git() {
  cd "${_pkgname}"
  install -dm 755 "${pkgdir}/usr/share/fonts/$_pkgname"
  cp -r ${srcdir}/$_pkgname/$_pkgname3 "${pkgdir}/usr/share/fonts/$_pkgname"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
