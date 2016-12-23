# Maintainer: Samuel Vincent Creshal <samuel@creshal.de>

pkgname=x62-alsa-hacks
pkgver=0.0.2
pkgrel=1
pkgdesc='ALSA configuration files / scripts for 51nb X62 notebooks'
arch=('any')
url='https://dev.yaki-syndicate.de'
license=('MIT')
depends=('hda-verb')
source=(
	'snd-hda-intel-x62.conf' 
	'x62-alsa-config.service'
)
sha512sums=('2116b6e3521793531999811343777d12e0b8b416756f1f924e46ec67751215bd743018e575621ce7fd4eb2df646b146f8a70a970930a58cd28e105818919068e'
            '38632d2215b54fb795fb19b573508a5391c284b68304f9131652bc4a2324ecc433e79ddfe6b41855faec9e2cbd0df3db0f3ecab33249f49b148964978ebfbb14')

package () {
	install -m 644 -D snd-hda-intel-x62.conf "${pkgdir}/etc/modprobe.d/snd-hda-intel-x62.conf"
	install -m 644 -D x62-alsa-config.service "${pkgdir}/usr/lib/systemd/system/x62-alsa-config.service"
}

