# Maintainer: chn <g897331845@gmail.com>

pkgname=chinaiplist
pkgver=1
_commit="7c702551fb72f572d9629b883243c2253996d856"
pkgrel=1
pkgdesc="IP list in China."
arch=('any')
url="https://github.com/17mon/china_ip_list"
license=('CC-BY-NC-SA 4.0')
source=("https://raw.githubusercontent.com/17mon/china_ip_list/$_commit/china_ip_list.txt"
        "https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode.txt"
)
md5sums=('e3a877e93b0c1b764fc7de892695fe89'
         '136c671dba2d2f644b882e31c3e289e8')

package() {
    mkdir -p "${pkgdir}/usr/share/chinaiplist"
    install -Dm644 "${srcdir}/china_ip_list.txt" "${pkgdir}/usr/share/chinaiplist/list.txt"
    mkdir -p "${pkgdir}/usr/share/licenses/chinaiplist"
    install -Dm644 "${srcdir}/legalcode.txt" "${pkgdir}/usr/share/licenses/chinaiplist/LICENSE"
}
