# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-3d
pkgver=3
pkgrel=5
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
            '9fd3ccd2622c53e4f12e2662fb1e98461a08547f81783cccb6d38026eb772a3ee82280de303a790027db846c7a03be17d7608ea975fd95215ad26cf9763d9250'
            '6e1aa5ecfea46181ec0ef89cc6403bb6d9da68c29f41fd0fafb4d5bafafc9ed1948c2d949be09e4f5240543ae706979b74a9a699aa1cb2796b0100aa4de285c6')

package() {
  install -Dm655 {,"${pkgdir}"/usr/share/xsessions/}pantheon-compiz.desktop
  install -Dm655 {,"${pkgdir}"/usr/share/gnome-session/sessions/}pantheon-compiz.session
}

