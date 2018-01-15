pkgname=linvst
pkgver=1.8.2
pkgrel=1
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine')
source=("https://github.com/osxmidi/LinVst/releases/download/1.8/LinVst-${pkgver}-Debian-Stretch.zip")
sha256sums=('5160964b03d9c87be66f65fa90989577ba5add47da99f404a31dbb0d4bbfbdca')

package() {
  for file in "${srcdir}/LinVst-${pkgver}-Debian-Stretch/embedded-version/"*.{exe,so}; do
     filename=`basename "${file}"`
     install -D -m755 "${file}" "${pkgdir}/usr/bin/${filename}"
  done
}
                                                                                                                                                                                                                            
