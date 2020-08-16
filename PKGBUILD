# Maintainer: 40Two (https://forum.dwg.ru/member.php?u=141931)

pkgname=ttf-gost
pkgver=1.0
pkgrel=1
pkgdesc="Font GOST 2.304-81 type A and type B"
license=(custom)
arch=(any)
provides=('ttf-font')
url="https://dwg.ru/dnl/14411"
source=('GOST2304_TypeA.ttf'
        'GOST2304_TypeA_italic.ttf'
        'GOST2304_TypeB.ttf'
        'GOST2304_TypeB_italic.ttf')
md5sums=('4010fba09f4fdf729951bf9e629d9781'
         '8cbfe2c5abc618cdec1e3c2b550f0679'
         '825e24a8642afb9144e0dcbdf8cba287'
         'f86234dc5a6c9f06d1913e35ab403d0a')

package() {
    install -d "${pkgdir}"/usr/share/fonts/TTF
    install -Dm644 "${srcdir}"/*.ttf "${pkgdir}"/usr/share/fonts/TTF/
}
