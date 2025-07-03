# Mainstainer: Josef Vybíhal <josef.vybihal@gmail.com>
# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=kpscript
pkgver=2.58
pkgrel=2
pkgdesc="KeePass scripting utility"
arch=('any')
url="http://keepass.info/plugins.html#kpscript"
license=('GPL')
depends=('keepass')

# TODO: use source and build it! https://keepass.info/extensions/v2/kpscript/KPScript-2.58-Source.zip
source=("http://keepass.info/extensions/v2/kpscript/KPScript-${pkgver}.zip"
        "kpscript")
install="$pkgname.install"

sha256sums=('07bc724d5e47de3349b5b0151eff6372d39f6d3c9aa756008a57ded26e9ce846'
            '964802ff1320abc1b1d20b181ef8e4a8cdaf01c5b11fae1bc76c4a0d4c0aea59')

package() {
  cd "${srcdir}"
  install -D -m644 KPScript.exe "${pkgdir}/usr/share/keepass/KPScript.exe"
  install -D -m755 kpscript "${pkgdir}/usr/bin/kpscript"
}

# vim:set ts=2 sw=2 et:
