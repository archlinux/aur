pkgname=linvst
pkgver=1.9.1
pkgrel=1
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine')
source=("https://github.com/osxmidi/LinVst/releases/download/1.9/LinVst-${pkgver}-Debian-Stretch.zip")
sha256sums=('b81ea4ace70b0e70e6641a795dab523aa8f1a3d7ddcfd15980132576f87050d8')

package() {
  for file in "${srcdir}/LinVst-${pkgver}-Debian-Stretch/embedded-version/"*.{exe,so}; do
     filename=`basename "${file}"`
     install -D -m755 "${file}" "${pkgdir}/usr/bin/${filename}"
  done
}
                                                                                                                                                                                                                            
