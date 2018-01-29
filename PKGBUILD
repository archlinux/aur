pkgname=linvst
pkgver=1.9
pkgrel=1
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine')
source=("https://github.com/osxmidi/LinVst/releases/download/1.9/LinVst-${pkgver}-Debian-Stretch.zip")
sha256sums=('e39f78ebc2132a4f527cbc3942959bf1cd17df8c8bcadda5d6347c24705a77ba')

package() {
  for file in "${srcdir}/LinVst-${pkgver}-Debian-Stretch/embedded-version/"*.{exe,so}; do
     filename=`basename "${file}"`
     install -D -m755 "${file}" "${pkgdir}/usr/bin/${filename}"
  done
}
                                                                                                                                                                                                                            
