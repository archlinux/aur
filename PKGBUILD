# Maintainer: hanchain <85230240+HanchaiN@users.noreply.github.com>

_fname='sarabun-new'
_fnamecap="TH-Sarabun-New"
_filename="THSarabunNew.zip"
_licename='GPL-2.0-with-font-exception'
_licepath="./GPL-2.0-with-font-exception"
_fontpath="./"

pkgname="ttf-sipa-${_fname}"
groups=("ttf-sipa-fonts")
pkgver=1.35
pkgrel=1
pkgdesc="Thailand national fonts: ${_fnamecap}"
arch=(any)
url='https://www.f0nt.com/release/13-free-fonts-from-sipa/'
license=("GPL-2.0-only WITH Font-exception-2.0")
source=("https://www.f0nt.com/?dl_name=sipafonts/${_filename}" 'GPL-2.0-with-font-exception')
sha256sums=('7a3db732e475b0b8adb10adf4058e7d8161ecef157f56f9711c229c73bedc592'
            'f06c9f3b40731b8f7df6d58ffda5fc3ffa501fe89eaf221e99924021a7b83910')
b2sums=('59d44ceb518f788207a872fb774ae22ffe96eef1ed7e61930b3ef046f7e31ec39d7204630ab81ff1177aae56ba6e228d08d8020c8e8b4e58785efaa804ca0d5e'
        '6f3f713b39faac0f110b1ad56edc584bc56468d54345430da96c1517ef54a8342c9dd9a1554db9348b25419a0f354182d75a3a5771a53f5e9258668b953d9450')

package() {
  [ -f "${_licepath}" ] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licepath}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/SIPA" *.ttf
}
