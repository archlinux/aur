pkgname=linvst
pkgver=1.7
pkgrel=1
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine')
source=("https://github.com/osxmidi/LinVst/releases/download/1.7/LinVst-${pkgver}.zip")
md5sums=('b39bbfb4da7525d7ca4a199052b3a1ca')

package() {
  for file in "${srcdir}/LinVst-${pkgver}/embedded-version/"*.{exe,so}; do
     filename=`basename "${file}"`
     install -D -m755 "${file}" "${pkgdir}/usr/bin/${filename}"
  done
}
                                                                                                                                                                                                                            
