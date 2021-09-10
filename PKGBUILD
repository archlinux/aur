# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-3d
pkgver=7
pkgrel=1
pkgdesc='Pantheon 3d Session (replaces Gala with Compiz)'
arch=('any')
url='https://www.youtube.com/playlist?list=PLYkgvMpJJEaIOF5pDFk50eCPWYtkN70yC'
license=('GPL3')
groups=('pantheon-qq')
depends=('compiz' 'csd-background' 'pantheon-qq-common')
source=(pantheon-compiz.{desktop,session}
        'cinnamon-settings-daemon-background-pantheon.desktop')
sha512sums=('4c7518fd824a6114ea615c223bd3af87130ac948448481e15ae3ff545eb1de482e4a175a9f6f1b15969a06f16284bddca97d8da228c09ade774c47da42496695'
            '8eda0a25ee90eabc7262e7f57d764457d651225ed841d5b1235b4792da5421132599e0b58eb41db7e8546a23791785c9a68f3b9860891d37ee5443daed4f17a3'
            'e3f549d9d0ef69b2b6595131758ca3f8a0cdb6f4c7a865e2b207853f878a14479902496952adc1963266c5369e5c69b4c272486b128c9b89c674ee1c1f626ac9')

package() {
  install -Dm644 {,"${pkgdir}"/usr/share/xsessions/}pantheon-compiz.desktop
  install -Dm644 {,"${pkgdir}"/usr/share/gnome-session/sessions/}pantheon-compiz.session
  install -Dm644 {"${srcdir}","${pkgdir}"/etc/xdg/autostart}/cinnamon-settings-daemon-background-pantheon.desktop
}
