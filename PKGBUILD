pkgname=linvst
pkgver=1.5.1
pkgrel=1
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine' 'steinberg-vst36')
source=("https://github.com/osxmidi/LinVst/releases/download/1.5/LinVst-${pkgver}.zip")
md5sums=('bebb40bc1cced47cd6845cdf0b693bdd')

package() {
  for file in "${srcdir}/LinVst-${pkgver}/"*.{exe,so}; do
     filename=`basename "${file}"`
     install -D -m755 "${file}" "${pkgdir}/usr/bin/${filename}"
  done
}
                                                                                                                                                                                                                            
