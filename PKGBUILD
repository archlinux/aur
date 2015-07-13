# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Nowaker

# see http://www.microsoft.com/typography/fonts/product.aspx?PID=161
# see https://en.wikipedia.org/wiki/Microsoft_fonts
pkgname='ttf-win7-fonts-cjk'
pkgver='7.1'
pkgrel='1'
pkgdesc='Microsoft Windows 7 CJK TrueType Fonts'
arch=('any')
url='http://www.microsoft.com'
license=('custom')
makedepends=('samba')
install="${pkgname}.install"
_winpath=('/mnt/windows') #path of windows c:/ drive
# smbclient -L '192.168.50.11' -U 'guest%'
# sudo mkdir -p /mnt/windows
# sudo mount -t cifs '//192.168.1.11/C' '/mnt/windows' -o 'username=guest,password='
# makepkg -scCfi
# sudo umount -R /mnt/windows
# sudo rmdir /mnt/windows

package(){
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/fonts/TTF"
  cd "${_winpath}/Windows/Fonts"
  cp -p \
    'msjh.ttf' 'msjhbd.ttf' \
    'msyh.ttf' 'msyhbd.ttf' \
    'simhei.ttf' 'simfang.ttf' 'simkai.ttf' 'simsun.ttc' 'simsunb.ttf' \
    'mingliu.ttc' 'mingliub.ttc' \
    'kaiu.ttf' \
    'meiryo.ttc' 'meiryob.ttc' \
    'msgothic.ttc' \
    'msmincho.ttc' \
    'batang.ttc' \
    'gulim.ttc' \
    'malgun.ttf' \
    "${pkgdir}/usr/share/fonts/TTF"
}
