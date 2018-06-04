# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-3d
pkgver=3
pkgrel=9
pkgdesc='Pantheon 3d Session (replaces Gala with Compiz)'
arch=('i686' 'x86_64')
url='https://bbs.archlinux.org/viewtopic.php?pid=1401967#p1401967'
license=('GPL3')
groups=('pantheon-qq')
depends=('compiz' 'pantheon-workarounds'
         'plank' 'cerbere' 'wingpanel-standalone-git')
provides=("pantheon-3d")
conflicts=()
source=(pantheon-compiz.{desktop,session}
        Default.profile)
sha512sums=('4c7518fd824a6114ea615c223bd3af87130ac948448481e15ae3ff545eb1de482e4a175a9f6f1b15969a06f16284bddca97d8da228c09ade774c47da42496695'
            '19c998fd88c238a9a4be8bf034809bd8f49baeb166190658dc5a0a73fa87256fa51b7aebbd0965d8452d9e1e8225dccb85feb54078312582313fe702c5bc2df6'
            'e2d685d178be6ae4a55f26e9e9f0ea16da2dc9d6c055d1a8520594e7dd8017dad40d3c2b965311ec8f86ff863750d8524255b9161091aa0e41fd01d97776418f')

package() {
  install -Dm655 {,"${pkgdir}"/usr/share/xsessions/}pantheon-compiz.desktop
  install -Dm655 {,"${pkgdir}"/usr/share/gnome-session/sessions/}pantheon-compiz.session
}

