# Contributor: Radostin Stoyanov <rstoyanov1 at gmail dot com>

pkgname=antconc
pkgver=3.5.8
_appname=AntConc_64bit
pkgrel=1
pkgdesc="A freeware corpus analysis toolkit for arrying out corpus linguistics research and data-driven learning."
arch=('x86_64')
url="http://www.laurenceanthony.net/software/antconc/"
license=('custom')
options=("!strip")
source=(http://www.laurenceanthony.net/software/antconc/releases/AntConc357/AntConc_64bit.tar.gz
	http://www.laurenceanthony.net/software/antconc/releases/AntConc357/license.pdf
	${pkgname}.png ${pkgname}.desktop)
sha256sums=('2c9a64ca08ba4c7252d2f5e5001877b00f1f29cba77f4b451eecb0d96c2c5029'
            'f4c95eaa31e273e7e7fe59a9e9f40afb044708fa61c2c7f0d317c9eaed20e81a'
            '2961431f1dd2c11a7af92e5ab594ddfd43e42ccc582cddca70128c781101525e'
            '56fa958a9100000a16bf95c0d7d082aee166ac376ec007ab1746def1adafa3f1')

package() {
  install -Dm755 "$srcdir"/${_appname} "$pkgdir"/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.png "$pkgdir"/usr/share/pixmaps/${pkgname}.png 
  install -Dm644 ${pkgname}.desktop "$pkgdir"/usr/share/applications/${pkgname}desktop 
  install -Dm644 license.pdf "$pkgdir"/usr/share/licenses/$pkgname/license.pdf
}
