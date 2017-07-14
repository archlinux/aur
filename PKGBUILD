# Maintainer: Lorenzo Carbonell <lorenzo.carbonell.cerezo@gmail.com>
# Maintainer: Gabriel Moura <g@srmoura.com.br>
pkgname=webp-thumbnailer
pkgver="0.0.2"
pkgrel=1
pkgdesc="Creates a thumbnail for the webp."
arch=('i686' 'x86_64')
url='https://github.com/gabrielmoura/webp-thumbnailer'
license=('GPL3')
source=(
	"$pkgname-master.tar.gz::https://github.com/gabrielmoura/webp-thumbnailer/archive/master.tar.gz"
)
sha512sums=('752ba1753d17de00b79329830d3443528afefe167e2282becdde17049c2a4f0f3998821c936959ec537c0077d357bf6a419b489407719f48eb234bffbfa71190')
package() {
  cd $pkgname-master
  install -m755 -D /opt/webp-thumbnailer/bin/webp-thumbnailer "${pkgdir}/opt/webp-thumbnailer/bin/webp-thumbnailer"
  install -m644 -D /usr/share/thumbnailers/webp.thumbnailer "${pkgdir}/usr/share/thumbnailers/webp.thumbnailer"
  install -m644 -D /usr/share/doc/webp-thumbnailer/copyright "${pkgdir}/usr/share/doc/webp-thumbnailer/copyright"
}
# vim:set ts=2 sw=2 et:
