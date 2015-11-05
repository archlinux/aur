# Maintainer: Michael Oestergaard <michael at bytopia dot dk>

pkgname=aftershotpro
pkgver=2.3.0.99
pkgrel=1
pkgdesc="Professional Workflow and RAW Conversion"
arch=('x86_64' 'i686')
license=('custom')
depends=( 'bzip2' 'expat' 'fontconfig' 'freetype2' 'glib2' 'gstreamer' 'libgl' 'libsm' 'libxdamage' 'libxrender' 'pcre' 'util-linux' )
optdepends=( 'opencl-nvidia' 'opencl-mesa' 'opencl-catalyst' )
source_x86_64=('http://dwnld.aftershotpro.com/updates/v2/2.3.0.99/AfterShotPro2_64bit.rpm' 'LICENSE.rtf')
source_i686=('http://dwnld.aftershotpro.com/updates/v2/2.3.0.99/AfterShotPro2_32bit.rpm' 'LICENSE.rtf')
url="http://www.aftershotpro.com/en/support/updates"
install="aftershotpro.install"

package() {
  mv ${srcdir}/opt ${pkgdir}/
  install -d ${pkgdir}/usr/share
  mv ${srcdir}/usr/bin ${pkgdir}/usr/
  mv ${srcdir}/usr/share/{applications,pixmaps} ${pkgdir}/usr/share/
  install -d ${pkgdir}/usr/share/mime/packages/
  mv ${srcdir}/usr/share/mime/packages/* ${pkgdir}/usr/share/mime/packages/
  install -Dm644 LICENSE.rtf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rtf
}

sha256sums_x86_64=('f5cc12fa212c143f3ad90e5fcc0c546ff9984b4f94d695b7061d79996ef823fe'
                   '45333ed8867b9f09226a4a19bf47ab966e3d735eb4f5dcbc4541a02eda88d2df')

sha256sums_i686=('e0f9ff0685559a7357cd2c092fb7890c053d069484d8a8c60496e45a42b83e29'
                 '45333ed8867b9f09226a4a19bf47ab966e3d735eb4f5dcbc4541a02eda88d2df')
