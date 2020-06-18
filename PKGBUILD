# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=xcursor-chameleon-darkskyblue
pkgver=0.5
pkgrel=3
pkgdesc="Chameleon X Cursor Theme (darkskyblue flavour)"
arch=('any')
url="https://www.kde-look.org/content/show.php?content=38459"
license=('GPL')
depends=('libxcursor')
source=(https://www.egregorion.net/works/chameleon/Chameleon-DarkSkyBlue-0.5.tar.bz2) 
sha512sums=('647a4f523555d1923b9a0335d91b6f579919636b4107c20c6605ba6df4d5abcb958dedc1e774ae74f80e8ca302fa27251aee35e08bd2ea3fbe7735b9ea7a4235')

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}"/usr/share/icons/{Chameleon-DarkSkyBlue-Large,Chameleon-DarkSkyBlue-Regular,Chameleon-DarkSkyBlue-Small}
  cp -R "${srcdir}"/Chameleon-DarkSkyBlue-Large-0.5/{cursors,index.theme} "${pkgdir}"/usr/share/icons/Chameleon-DarkSkyBlue-Large
  cp -R "${srcdir}"/Chameleon-DarkSkyBlue-Regular-0.5/{cursors,index.theme} "${pkgdir}"/usr/share/icons/Chameleon-DarkSkyBlue-Regular
  cp -R "${srcdir}"/Chameleon-DarkSkyBlue-Small-0.5/{cursors,index.theme} "${pkgdir}"/usr/share/icons/Chameleon-DarkSkyBlue-Small
}

