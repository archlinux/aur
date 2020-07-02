# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: pzl <alsoelp@gmail.com>
# Contributor: Pablo Olmos de Aguilera C. <pablo at glatelier dot org>
# Contributor: David Goodlad <david at goodlad dot ca>
# Contributor: William Sheldon <tang0th at gmx dot com>

pkgname=ttf-meslo
pkgver=1.2.1
pkgrel=2
pkgdesc="Meslo LG is a customized version of Apple's Menlo font with various line gap and dotted zero"
arch=('any')
url="http://github.com/andreberg/Meslo-Font"
license=('Apache')
source=(${pkgname}-${pkgver}.zip::${url}/blob/master/dist/v${pkgver}/Meslo%20LG%20v${pkgver}.zip?raw=true
        ${pkgname}-dz-${pkgver}.zip::${url}/blob/master/dist/v${pkgver}/Meslo%20LG%20DZ%20v${pkgver}.zip?raw=true)
md5sums=('07615beca5ddd4d2cf1d789518c6a292'
         'e4ab271b44d1a36812170f916282aa45')

package()
{
    install -Dm644 Meslo\ LG\ {DZ\ ,}v${pkgver}/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
}
