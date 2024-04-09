# Maintainer: Jonatan Steuernagel <jonatan+aur[at]jsteuernagel[dot]de>
# Contributor: Javier Tia <javier[dot]tia[at]gmail[dot]com>
# Contributor: Viliam Pucik <viliam[dot]pucik[at]gmail[dot]com>
# Contributor: jevv

pkgname=hpmyroom
pkgver=12.13.0.0749
pkgrel=1
pkgdesc="HPE MyRoom a collaborative conferencing meetings software"
url="https://www.myroom.hpe.com"
arch=('x86_64')
license=('unknown')
depends=('alsa-lib>=1.0.16' 'fontconfig>=2.11.94' 'freetype2>=2.6' 'glib2>=2.31.8' 'glibc>=2.17' 'gst-plugins-base-libs>=1.0.0' 'gstreamer>=1.4.0' 'libcups>=1.4.0' 'libdrm>=2.4.30' 'libgl' 'libglvnd' 'libpulse>=0.99.1' 'util-linux-libs' 'libvdpau' 'libx11' 'libxcb>=1.8' 'libxfixes' 'libxi>=1.5.99.2' 'libxrender' 'libxss' 'libxtst' 'systemd-libs>=183' 'zlib>=1.2.3.4' 'libtiff5')
source=("${url}/downloadfiles/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
  ar x ${pkgname}_${pkgver}_amd64.deb
  tar xf data.tar.xz --no-same-permissions --no-overwrite-dir -C ${pkgdir}
}
