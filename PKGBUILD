# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=pony-plataforming-project
pkgver=4
pkgrel=4
pkgdesc="Pony Plataformimng Poject 4: A colection of pony games (not all are plataforming games)"
arch=(any)
url="http://www.dragon-mango.com/ponygame"
license=("freeware")
depends=("flashplayer-standalone>=10"
"java-environment>=6")
source=("minuette.swf::http://www.dragon-mango.com/ponygame/tardy/PPP4.swf"
"minty.swf::http://www.dragon-mango.com/ponygame/Minty/intro.swf"
#"colgate.swf::http://www.dragon-mango.com/ponygame/colgate.swf"
"minuette.png::http://www.deviantart.com/download/298768764/minuette__s_cutie_mark__aka_colgate__by_wuzzyfuzzybunny-d4xvngc.png"
"minuette.desktop" "minuette.sh"
"minty.png::http://www.dragon-mango.com/ponygame/CherryMint.png"
"minty.desktop" "minty.sh"
#"colgate.png::http://img3.wikia.nocookie.net/__cb20120305215447/mlpfanart/images/thumb/d/d8/Colgate_by_lKittyTaill.png/200px-Colgate_by_lKittyTaill.png"
#"colgate.desktop" "colgate.sh"
"PataPony.zip::http://folk.ntnu.no/oddvahu/Permanent/PataPony.zip"
"patapony.png::http://fc00.deviantart.net/fs71/f/2011/114/a/a/pinkie_pie_cutie_mark_by_blackgryph0n-d3e1k3f.png"
"patapony.desktop" "patapony.sh")

package() {
# Minuette VS Lazyness
 install -Dm644 "${srcdir}/minuette.swf" "${pkgdir}/usr/share/PPP/minuette/minuette.swf"
 install -Dm755 "${srcdir}/minuette.sh" "${pkgdir}/usr/bin/minuette"
 install -Dm644 "${srcdir}/minuette.desktop" "${pkgdir}/usr/share/applications/minuette.desktop"
 install -Dm644 "${srcdir}/minuette.png" "${pkgdir}/usr/share/icons/minuette.png"

# Minty Adventures
 install -Dm644 "${srcdir}/minty.swf" "${pkgdir}/usr/share/PPP/minty/minty.swf"
 install -Dm755 "${srcdir}/minty.sh" "${pkgdir}/usr/bin/minty"
 install -Dm644 "${srcdir}/minty.desktop" "${pkgdir}/usr/share/applications/minty.desktop"
 install -Dm644 "${srcdir}/minty.png" "${pkgdir}/usr/share/icons/minty.png"

# Colgate
# install -Dm644 "${srcdir}/colgate.swf" "${pkgdir}/usr/share/PPP/colgate/colgate.swf"
# install -Dm755 "${srcdir}/colgate.sh" "${pkgdir}/usr/bin/colgate"
# install -Dm644 "${srcdir}/colgate.desktop" "${pkgdir}/usr/share/applications/colgate.desktop"
# install -Dm644 "${srcdir}/colgate.png" "${pkgdir}/usr/share/icons/colgate.png"

# PataPony
 mkdir -p "${pkgdir}/usr/share/PPP/patapony"
 cp -dpr --no-preserve=ownership ${srcdir}/PataPony/* ${pkgdir}/usr/share/PPP/patapony/
 install -Dm644 "${srcdir}/patapony.desktop" "${pkgdir}/usr/share/applications/patapony.desktop"
 install -Dm755 "${srcdir}/patapony.sh" "${pkgdir}/usr/bin/patapony"
 install -Dm644 "${srcdir}/patapony.png" "${pkgdir}/usr/share/icons/patapony.png"
}



md5sums=('6e02cab8d0e9d6012196f453586604b1'
         'ea95a08b7d4149011c14dec7be066507'
#         '017fc4bea4906ba7f6c4485c0eef9a71'
         '6cdc5f665479a80751493c9018894651'
         'eda9a884b7946ce29cd67a0ccbb8d1a3'
         '6ee227d859f62cf3beea8c8d6abf8b4c'
         '0c58817c93dadc1e4f5eeffecce0ce74'
         '9f9a34b90aba0f6d6866ae5a7cae52af'
         '6632ae1f002feb65899b2b492440da48'
#         '026b601b4a2881785af3473931619c2a'
#         'd77454c7e03b14a238ec67a6ef2f58b6'
#         '047c55448dd142c97dd763ed9476e217'
         'a747897dcd1ce231452da43e74dbc0c0'
         'e89d937080ee5b651393d9cba5feee82'
         'f90e0fc8c237c5f6afa806642afdff8e'
         '2af74b2a676127a7c3550575668bc17f')
