# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-3d
pkgver=5
pkgrel=2
pkgdesc='Pantheon 3d Session (replaces Gala with Compiz)'
arch=('any')
url='https://www.youtube.com/playlist?list=PLYkgvMpJJEaIOF5pDFk50eCPWYtkN70yC'
license=('GPL3')
groups=('pantheon-qq')
depends=('compiz' 'pantheon-workarounds'
         'wingpanel-standalone-git')
provides=("pantheon-3d")
source=(pantheon-compiz.{desktop,session}
        Default.profile)
sha512sums=('4c7518fd824a6114ea615c223bd3af87130ac948448481e15ae3ff545eb1de482e4a175a9f6f1b15969a06f16284bddca97d8da228c09ade774c47da42496695'
            '8eda0a25ee90eabc7262e7f57d764457d651225ed841d5b1235b4792da5421132599e0b58eb41db7e8546a23791785c9a68f3b9860891d37ee5443daed4f17a3'
            '9564ba83860e65b7c235488f8aa901aa3c3f25429c4dc14fff841da9e58923b2c40babc6208d906576fc655a30179202e0b507fad920f86d327f079af6b8778b')

package() {
  install -Dm655 {,"${pkgdir}"/usr/share/xsessions/}pantheon-compiz.desktop
  install -Dm655 {,"${pkgdir}"/usr/share/gnome-session/sessions/}pantheon-compiz.session
}

