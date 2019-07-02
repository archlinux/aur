# Maintainer: Gabriel Moura <develop@srmoura.com.br>

pkgname=akarixb
pkgver=0.8
pkgrel=1
pkgdesc="Is a bot for the decentralized Jabber/XMPP network, with a GUI. It is free as in freedom."
arch=('x86_64')
url="http://akarixb.nongnu.org/"
license=('GPL2')
depends=('qxmpp' 'qt5-base')


sha512sums=('9361578ef6524e1e91ef6696b5681fa9a0bfb6d7122c9014877d475459233d38d0b1e172a6fae7ca188822cc8f2304b50861c2c148e3d9ca40917e8fa66b633c'
            'SKIP')


validpgpkeys=('DDE43DEA10CA4EED5D7F881E76CE3619A00292AF')

source=("http://distrib-coffee.ipsl.jussieu.fr/pub/linux/Mageia/distrib/cauldron/x86_64/media/core/release/akarixb-0.8-1.mga8.x86_64.rpm" 
"akarixb-0.8-1.mga8.x86_64.rpm.sig")

package() {
        cp -dr --no-preserve=ownership ./usr "${pkgdir}"/
}
