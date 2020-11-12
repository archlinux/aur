# Maintainer: Alex Leray <alexandre@stdin.fr>

pkgname=inkscape-axidraw
pkgver=2.7.0
pkgrel=1
pkgdesc="Inkscape extension for Axidraw."
provides=('inkscape-axidraw' 'inkscape-eggbot')
url="https://github.com/evil-mad/EggBot/"
depends=('python' 'inkscape>=1.0.0' )
license=('GPLv3')
arch=('any')
source=("https://cdn.evilmadscientist.com/dl/ad/public/ad-ink_270.zip")
sha256sums=('146da0738a3e002058045cb0a3a4c3593ba2f36425a5a2ba41e3c55cfa3d71f0')

package() {
	mkdir -p "$pkgdir/usr/share/inkscape/extensions"

    cp -R $srcdir/ad-ink_270/axidraw_deps "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/axidraw_conf.py "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/axidraw_control.py "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/axidraw_disableMotors.inx "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/axidraw_hatch.inx "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/axidraw.inx "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/axidraw_naming.inx "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/axidraw_naming.py "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/axidraw_svg_reorder.inx "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/axidraw_svg_reorder.py "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/eggbot_conf.py "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/eggbot_hatch.inx "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/eggbot_hatch.py "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/eggbot.inx "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/eggbot_presethatch.inx "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/eggbot_presethatch.py "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/eggbot.py "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/eggbot_reorder.inx "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/eggbot_stretch.inx "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/eggbot_stretch.py "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/empty_eggbot.inx "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/empty_eggbot.py "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/hershey_axi_ink1.inx "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/plot_utils_import.py "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/wcb_color.inx "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/wcb_color.py "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/wcb_conf.py "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/wcb_hatch.inx "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/wcb.inx "$pkgdir/usr/share/inkscape/extensions/"
    cp $srcdir/ad-ink_270/wcb.py "$pkgdir/usr/share/inkscape/extensions/"
}
