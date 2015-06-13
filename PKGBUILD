 Maintainer: procrastinator

pkgname=gyazo
pkgver=1.0_1
pkgrel=3
pkgdesc="Launch the Gyazo app and drag your mouse to grab the screen. "
arch=('any')
url="http://gyazo.com/"
license=('GPL')
groups=(multimedia)
depends=('ruby' 'xclip' 'imagemagick')
source=("https://github.com/gyazo/Gyazo-for-Linux/archive/master.zip")
sha256sums=('58567d7c2a77bae20551c66d203385b64037df7599f431c92f66e3aafe4a6b3f')

package() {
	cd "${srcdir}"

  install -D -m755 "${srcdir}/Gyazo-for-Linux-master/src/gyazo.rb" \
					"${pkgdir}/usr/bin/gyazo"

  install -D -m664 "${srcdir}/Gyazo-for-Linux-master/src/gyazo.desktop" \
					"${pkgdir}/usr/share/applications/gyazo.desktop"

  install -D -m664 "${srcdir}/Gyazo-for-Linux-master/icons/gyazo.png" \
					"${pkgdir}/usr/share/pixmaps/gyazo.png"
}

