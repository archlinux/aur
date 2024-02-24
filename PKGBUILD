# Maintainer:  Philip Sequeira <qmega+aur@sksm.net>

pkgname=otf-exo
pkgver=2.1
pkgrel=1
pkgdesc='A geometric sans serif font with a technological feel'
arch=('any')
url='https://ndiscover.com/exo-2-0/'
license=('OFL')
depends=('fontconfig' 'xorg-mkfontdir')
_ref=182060cd38adf3cde0d22add3f8009d30bd48cde
source=("https://raw.githubusercontent.com/NDISCOVER/Exo-2.0/$_ref/fonts/otf/Exo2-"{BlackItalic,Black,BoldItalic,Bold,ExtraBoldItalic,ExtraBold,ExtraLightItalic,ExtraLight,Italic,LightItalic,Light,MediumItalic,Medium,Regular,SemiBoldItalic,SemiBold,ThinItalic,Thin}'.otf')
sha256sums=(
  '9e1903671402b0ef268320609350c63e36c6c90f56c6747c24ba8bbbe4a14303'
  '1c91dcce2229c304347a89f7e6f5bd9c93dfad7b01fe5aec15bf3c1a9bae6a51'
  '4ee677c03732ceb48c319406693e367d370148b6511e15f1a48bb0bb5e71adc9'
  'ef629216a9f181b1154c0120ba3cef89a991110b0d05926524f33e73b4de2738'
  '966fe9c1374b812c193fb1633188121c6678e1b5a81e0d9a445f583e558ca5d7'
  'e3ab15d8ea441a605520f53751901d15ffece8ebc4e95fe55a0a0d3373b38a81'
  '46fa0491c69600b43f7872fc50dd6ad50083182d6c924331d1328763e4d28ebe'
  '27efce12c7410ddfdf6e6372b678fd7d254a9b4936055ab9499b305c44329ee3'
  '1884ddcdda5a4f7d896e861f377eaa8bc37c45f687c27bdeaefb6c2531c73073'
  'bbb2632ca91d9ccb4548a38ca00a2f2d0b6eccc74b4430eacc732c500e4ee7ed'
  'ca0960299c0f1871a969118254c34b615f0b92fb6c5f44ba6d4702c831b983e3'
  '03e336986e72ca4fc7cb18dd8229753ac70ed1048de908b272b1a455112771a6'
  'c7fd92c038d7735a1246f39a778c3a97cbe2eab8b792c5943d6bfe9ee0e28ac2'
  '95c14b0a5e340df62d427f1013d4dd0923af65cc2ec997c19e51a3aa0c24758a'
  '39caa90dccf331a88e4baf817bd7937d91026a0955ed2c83b20b5114c320edd6'
  '4e5dbe59005c419665cdb3d45e98ff2772629c563af1d34b21c040e206d6f72a'
  '9e57e75f065ef67ba9477df9923674e3828a3c94958fb7fc7b7cd191b07ee80e'
  'fc20e87c74246c0dde390cf2828872f7049a6fb3b43706fd6fe7718a669b8595'
)

package() {
  install -Dm644 -t "${pkgdir}/usr/share/fonts/OTF" "${srcdir}"/Exo2-*.otf
}
