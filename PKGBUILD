# Maintainer: Claudia Pellegrino <auerhuhn@archlinux.org>

pkgname=ttf-vcr-osd-mono
pkgver=1.001
pkgrel=2
pkgdesc='Retro pixel font resembling on-screen displays and title generators of the analog CRT/VCR era by Riciery Leal'
arch=('any')
url='https://www.dafont.com/vcr-osd-mono.font'
license=('LicenseRef-custom')
source=('vcr_osd_mono.zip::https://img.dafont.com/dl/?f=vcr_osd_mono')
sha512sums=('abb0f7c04be2b84906b0a25d20aa611bfc1b862415a1d579fa2f8537a2d99b798e0840c389b5f61f3ca036df423430a6591a8c7e2a0187a44136112742117a63')

package() {
  install -Dm644 -t "${pkgdir}"/usr/share/fonts/TTF/ "VCR_OSD_MONO_${pkgver}.ttf"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  printf > "${pkgdir}/usr/share/licenses/${pkgname}/license.txt" '%s\n' \
    'Copyright (c) 2014-2026 by Riciery Leal <santosleal.riciery@gmail.com>.' \
    'The author did not publish a license file but stated that the font is free, even for commercial purposes. See also:' \
    'https://www.dafont.com/font-comment.php?file=vcr_osd_mono'
}
