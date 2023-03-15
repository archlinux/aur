# Maintainer: Dimitris Zervas <dzervas@dzervas.gr>
pkgname=estlcam-wine
pkgver=11245
pkgrel=1
pkgdesc="Estlcam: 2D / 3D CAM und CNC Steuerung... - wine installation"
arch=(i686 x86_64)
url="https://www.estlcam.de"
license=(Unknown)
depends=(wine)
makedepends=()
source=(Estlcam.desktop Estlcam.png estlcam  https://www.estlcam.de/downloads/Estlcam_64_$pkgver.exe)
sha512sums=(702e0a76a803174b0bdd4c46e15e38f6684c00a91050fe41e28af4e844368613a9600dd6e1687dd736217dadf806668397481a50cfd642e03dc9e4a98fd620f1 e30ddb57e30a8de5c26da07edd453c6413c45866f589fb59dd1f1fa75cf51c0939f31353f6f84c8723f5496db04f44367645fdd8637ce067b49c8603e0d25293 1c2efc3801a1ae49a388d92b0bcb52bd965759f628b16ba970833adf86615060ef02f29bbe6ce6ff993e97775046f0902991f000197a317692dc1b83ee303e93  SKIP)
options=(!strip)

package() {
  mkdir -p "\/usr/share/estlcam-wine"

  mkdir -p ${pkgdir}/usr/bin ${pkgdir}/usr/share/${pkgname} ${pkgdir}/usr/share/applications ${pkgdir}/usr/share/pixmaps; cp Estlcam_64_${pkgver}.exe ${pkgdir}/usr/share/${pkgname}/Estlcam_setup.exe; cp Estlcam.png ${pkgdir}/usr/share/${pkgname}; cp Estlcam.desktop ${pkgdir}/usr/share/applications; cp Estlcam.png ${pkgdir}/usr/share/pixmaps; cp estlcam ${pkgdir}/usr/bin

  echo "Please check out the license at https://www.estlcam.de"
}
