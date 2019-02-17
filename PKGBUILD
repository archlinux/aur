# Maintainer: Gabriel Moura <develop@srmoura.com.br>

pkgname=akarixb
pkgver=0.7
pkgrel=1
pkgdesc="Is a bot for the decentralized Jabber/XMPP network, with a GUI. It is free as in freedom."
arch=('x86_64')
url="http://akarixb.nongnu.org/"
license=('GPL2')
depends=('qxmpp' 'qt5-base')


sha512sums=('99a9e0d6158f5569b9803307a716adf7ecaff29664f2276ea1b64e2dbddd0ab3c7da253555fddd86ab37c4eb6a8c7eef840d3e4793b0e4e1e7091763a679a684'
            'SKIP')

validpgpkeys=('DDE43DEA10CA4EED5D7F881E76CE3619A00292AF')

source=("http://distrib-coffee.ipsl.jussieu.fr/pub/linux/Mageia/distrib/cauldron/x86_64/media/core/release//akarixb-0.7-1.mga7.x86_64.rpm" 
"akarixb-0.7-1.mga7.x86_64.rpm.sig")

package() {
        cp -dr --no-preserve=ownership ./usr "${pkgdir}"/
}
