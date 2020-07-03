# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: pzl <alsoelp@gmail.com>
# Contributor: Pablo Olmos de Aguilera C. <pablo at glatelier dot org>
# Contributor: David Goodlad <david at goodlad dot ca>
# Contributor: William Sheldon <tang0th at gmx dot com>

pkgname=ttf-meslo
pkgver=1.2.1
pkgrel=3
pkgdesc="Meslo LG is a customized version of Apple's Menlo font with various line gap and dotted zero"
arch=('any')
url="http://github.com/andreberg/Meslo-Font"
license=('Apache')
source=(${pkgname}-${pkgver}.zip::${url}/blob/master/dist/v${pkgver}/Meslo%20LG%20v${pkgver}.zip?raw=true
        ${pkgname}-dz-${pkgver}.zip::${url}/blob/master/dist/v${pkgver}/Meslo%20LG%20DZ%20v${pkgver}.zip?raw=true)
sha256sums=('d0bcb7668dda8fa1a0f8162d626adb434c32854e243b5bd52a717cf569af08d0'
            'e5201a6816281872c23a2b2f43ac91dc8c1f9d91e9f4b82d64e9bfcb769ecb52')

package()
{
    install -Dm644 Meslo\ LG\ {DZ\ ,}v${pkgver}/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
}
