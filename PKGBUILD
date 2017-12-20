pkgname=linvst
pkgver=1.7.6
pkgrel=2
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine')
source=("https://github.com/osxmidi/LinVst/releases/download/1.7/LinVst-${pkgver}-MIX-Debian-Stretch.zip")
sha256sums=('9b055ee70942b2930c3f62c15cfa2a18b7586d356aa53a401012e6e07470ca2b')

package() {
  for file in "${srcdir}/LinVst-${pkgver}-MIX-Debian-Stretch/embedded-version/"*.{exe,so}; do
     filename=`basename "${file}"`
     install -D -m755 "${file}" "${pkgdir}/usr/bin/${filename}"
  done
}
                                                                                                                                                                                                                            
