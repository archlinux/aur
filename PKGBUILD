pkgname=linvst
pkgver=1.6.7
pkgrel=1
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine')
source=("https://github.com/osxmidi/LinVst/releases/download/1.6/LinVst-${pkgver}.zip")
md5sums=('21640d5512d2f7d71b477c416557be4c')

package() {
  for file in "${srcdir}/LinVst-${pkgver}/embedded-version/"*.{exe,so}; do
     filename=`basename "${file}"`
     install -D -m755 "${file}" "${pkgdir}/usr/bin/${filename}"
  done
}
                                                                                                                                                                                                                            
