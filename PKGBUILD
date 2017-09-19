pkgname=linvst
pkgver=1.6.1
pkgrel=1
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine')
source=("https://github.com/osxmidi/LinVst/releases/download/1.6/LinVst-${pkgver}.zip")
md5sums=('df22d9c306e949d62b7ba78ab183fad2')

package() {
  for file in "${srcdir}/LinVst-${pkgver}/emedded-window-version/"*.{exe,so}; do
     filename=`basename "${file}"`
     install -D -m755 "${file}" "${pkgdir}/usr/bin/${filename}"
  done
}
                                                                                                                                                                                                                            
