# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Alex Leray <alexandre@stdin.fr>

pkgname=inkscape-axidraw
pkgver=2.7.0
pkgrel=1
pkgdesc='Inkscape extension for Axidraw'
provides=('inkscape-axidraw' 'inkscape-eggbot')
url='https://github.com/evil-mad/EggBot/'
depends=('python' 'inkscape')
license=('GPL2')
arch=('any')
source=('https://cdn.evilmadscientist.com/dl/ad/public/ad-ink_270.zip')
sha256sums=('146da0738a3e002058045cb0a3a4c3593ba2f36425a5a2ba41e3c55cfa3d71f0')

package() {
	mkdir -p "${pkgdir}/usr/share/inkscape/extensions"
  cp -R "${srcdir}/ad-ink_270/axidraw_deps" "${pkgdir}/usr/share/inkscape/extensions/"
  install -D -m 644 -t "${pkgdir}/usr/share/inkscape/extensions/" \
    "${srcdir}/ad-ink_270/axidraw_conf.py" \
    "${srcdir}/ad-ink_270/axidraw_control.py" \
    "${srcdir}/ad-ink_270/axidraw_disableMotors.inx" \
    "${srcdir}/ad-ink_270/axidraw_hatch.inx" \
    "${srcdir}/ad-ink_270/axidraw.inx" \
    "${srcdir}/ad-ink_270/axidraw_naming.inx" \
    "${srcdir}/ad-ink_270/axidraw_naming.py" \
    "${srcdir}/ad-ink_270/axidraw_svg_reorder.inx" \
    "${srcdir}/ad-ink_270/axidraw_svg_reorder.py" \
    "${srcdir}/ad-ink_270/eggbot_conf.py" \
    "${srcdir}/ad-ink_270/eggbot_hatch.inx" \
    "${srcdir}/ad-ink_270/eggbot_hatch.py" \
    "${srcdir}/ad-ink_270/eggbot.inx" \
    "${srcdir}/ad-ink_270/eggbot_presethatch.inx" \
    "${srcdir}/ad-ink_270/eggbot_presethatch.py" \
    "${srcdir}/ad-ink_270/eggbot.py" \
    "${srcdir}/ad-ink_270/eggbot_reorder.inx" \
    "${srcdir}/ad-ink_270/eggbot_stretch.inx" \
    "${srcdir}/ad-ink_270/eggbot_stretch.py" \
    "${srcdir}/ad-ink_270/empty_eggbot.inx" \
    "${srcdir}/ad-ink_270/empty_eggbot.py" \
    "${srcdir}/ad-ink_270/hershey_axi_ink1.inx" \
    "${srcdir}/ad-ink_270/plot_utils_import.py" \
    "${srcdir}/ad-ink_270/wcb_color.inx" \
    "${srcdir}/ad-ink_270/wcb_color.py" \
    "${srcdir}/ad-ink_270/wcb_conf.py" \
    "${srcdir}/ad-ink_270/wcb_hatch.inx" \
    "${srcdir}/ad-ink_270/wcb.inx" \
    "${srcdir}/ad-ink_270/wcb.py"
}
