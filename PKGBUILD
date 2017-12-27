# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-3d
pkgver=3
pkgrel=4
pkgdesc='Pantheon 3d Session (replaces Gala with Compiz)'
arch=('i686' 'x86_64')
url='https://bbs.archlinux.org/viewtopic.php?pid=1401967#p1401967'
license=('GPL3')
groups=('pantheon-qq')
depends=('compiz' 'pantheon-workarounds'
         'plank' 'cerbere' 'wingpanel-standalone-git')
provides=("pantheon-3d")
conflicts=()
source=(pantheon-compiz.{desktop,session})
sha512sums=('18d3e1280c315014645e1f2ecf3bc5667e18fb718a83f46a6209b7d7b0fe407f69f23a567f67cddb0cb3dea8a8a99365529814d8093169b57ec308334bec10de'
            '9fd3ccd2622c53e4f12e2662fb1e98461a08547f81783cccb6d38026eb772a3ee82280de303a790027db846c7a03be17d7608ea975fd95215ad26cf9763d9250')

package() {
  install -Dm655 {,"${pkgdir}"/usr/share/xsessions/}pantheon-compiz.desktop
  install -Dm655 {,"${pkgdir}"/usr/share/gnome-session/sessions/}pantheon-compiz.session
  # If you were prevously using compiz, check your configuration!
  #[[ -f "${HOME}"/.config/compiz-1/compizconfig/config ]] && \
  #  cp "${HOME}"/.config/compiz-1/compizconfig/config{,.bak}
  #[[ -n "$(cat "${HOME}"/.config/compiz-1/compizconfig/config | grep backend)" ]] && \
  #  sed -i 's|backend = ini|backend = gsettings|g' "${HOME}"/.config/compiz-1/compizconfig/config
}

