# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgbase=chromeos-extra-fonts
pkgname=("ttf-chromeosextra-font"
	"ttf-lohit-font"
	"ttf-anjali-old-lipi" 
	"ttf-my-paduk"
	"ttf-ko-nanum-font"
	"ttf-tbt-jomolhari"
	"ttf-roboto-font"
	"ttf-droid-font"
	"ttf-th-sarabun-font")
pkgver=2013.02.14
_crosextraver=20130214
_lohitver=2.5.0
_mlver=0.740
_paduk=2.50
_knanum=3.10.0
_jomol=0.0.3c
_robover=20150625
_droidver=20140815
_sarabun=1.3.2
pkgrel=8
depends=("fontconfig" "xorg-font-utils")
optdepends=("ttf-chromeos-fonts: Part of the Chromium OS fonts suite"
	"otf-ipafont: Part of the Chromium OS fonts suite, IPA support"
	"ttf-dejavu: Part of the Chromium OS fonts suite"
	"ttf-sil-fonts: Part of the Chromium OS fonts suite"
	"ttf-carlito: Part of the Chromium OS fonts suite"
	"noto-fonts: Part of the Chromium OS fonts suite"
	"noto-fonts-cjk: Part of the Chromium OS fonts suite, CJK support"
	"noto-fonts-emoji: PArt of the Chromium OS fonts suite, Emoji support"
	)
pkgdesc="Extra fonts from Chromium OS fonts suite by various author"
arch=("any")
provide=("ttf-font")
license=("GPL")
url="http://git.chromium.org/gitweb/00"
source=("http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/crosextrafonts-${_crosextraver}.tar.gz"
	"http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/lohitfonts-cros-${_lohitver}.tar.gz"
	"http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/ml-anjalioldlipi-${_mlver}.tar.gz"
	"http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/my-padauk-${_paduk}.tar.gz"
	"http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/ko-nanumfonts-${_knanum}.tar.gz"
	"http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/tibt-jomolhari-${_jomol}.tar.gz"
	"http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/robotofonts-${_robover}.tar.bz2"
	"http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/droidfonts-cros-${_droidver}.tar.gz"
	"http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/th-sarabun-fonts-${_sarabun}.tar.gz")

install="chromeos-extra-fonts.install"



package_ttf-chromeosextra-font() {
pkgver=${_crosextraver}
conflicts=("ttf-caladea")
license=("Apache")
pkgdesc="Caladea font for ChromeOS by Huerta Tipografia"
	install -d -m 755 "${pkgdir}/usr/share/fonts/TTF"
	install -m 644 "${srcdir}/crosextrafonts-${_crosextraver}/"*.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
package_ttf-lohit-font(){
pkgver=${_lohitve}
conflicts=("lohit-fonts")
license=("custom:OFL-1.1")
pkgdesc="6 Lohit fonts for Indic scripts"
url="http://fedorahosted.org/lohit"
	install -d -m 755 "${pkgdir}/usr/share/fonts/TTF"
	install -m 644 "${srcdir}/lohitfonts-cros-${_lohitver}/"*.ttf "${pkgdir}/usr/share/fonts/TTF/"
	install -d -m 755 "${pkgdir}/usr/share/doc/${pkgname}/lohitfonts-cros"
	install -m 644 "${srcdir}/lohitfonts-cros-${_lohitver}/LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/lohitfonts-cros"
}

package_ttf-anjali-old-lipi(){
pkgver=${_mlver}
conflicts=("ttf-malayalam-font-anjalioldlipi")
license=("custom:OFL-1.1")
pkgdesc="AnjaliOldLipi font for the correct Malayalam rendering"
url="https://sites.google.com/site/cibu/anjalioldlipi-font"
	install -d -m 755 "${pkgdir}/usr/share/fonts/TTF"
	install -m 644 "${srcdir}/ml-anjalioldlipi-${_mlver}/"*.ttf "${pkgdir}/usr/share/fonts/TTF/"
	install -d -m 755 "${pkgdir}/usr/share/doc/${pkgname}/ml-anjalioldlipi"
	install -m 644 "${srcdir}/ml-anjalioldlipi-${_mlver}/LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/ml-anjalioldlipi"
}

package_ttf-my-paduk(){
pkgver=${_paduk}
conflicts=("ttf-padauk")
license=("custom:OFL-1.1")
pkgdesc="Padauk font for Myanmar/Birmania"
url="http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=padauk"
	install -d -m 755 "${pkgdir}/usr/share/fonts/TTF"
	install -m 644 "${srcdir}/my-padauk-${_paduk}/"*.ttf "${pkgdir}/usr/share/fonts/TTF/"
	install -d -m 755 "${pkgdir}/usr/share/doc/${pkgname}/my-padauk"
}

package_ttf-ko-nanum-font(){
pkgver=${_knamum}
conflicts=("ttf-nanum-fonts")
license=("custom:OFL-1.1")
pkgdesc="Korean fonts released by Naver Inc. under OFL : NanumGothic (regular, bold), NanumMyeongjo (regular, bold)"
url="http://hangeul.naver.com/index.nhn"
	install -d -m 755 "${pkgdir}/usr/share/fonts/TTF"
	install -m 644 "${srcdir}/ko-nanumfonts-${_knanum}/"*.ttf "${pkgdir}/usr/share/fonts/TTF/"
	install -d -m 755 "${pkgdir}/usr/share/doc/${pkgname}/ko-nanumfonts"
	install -m 644 "${srcdir}/ko-nanumfonts-${_knanum}/LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/ko-nanumfonts"
}

package_ttf-tbt-jomolhari(){
pkgver=${_jomol}
conflicts=("ttf-jomolhari")
license=("custom:OFL-1.1")
pkgdesc="Jomolhari font for Tibetan"
url="https://sites.google.com/site/chrisfynn2/home/fonts/jomolhari"
	install -d -m 755 "${pkgdir}/usr/share/fonts/TTF"
	install -m 644 "${srcdir}/tibt-jomolhari-${_jomol}/"*.ttf "${pkgdir}/usr/share/fonts/TTF/"
	install -d -m 755 "${pkgdir}/usr/share/doc/${pkgname}/tibt-jomolhari"
}
package_ttf-roboto-font(){
pkgver=${_robover}
conflict=("ttf-roboto")
license=("Apache")
pkgdesc="Roboto fonts by Google for Material Design"
	install -d -m 755 "${pkgdir}/usr/share/fonts/TTF"
        install -m 644 "${srcdir}/robotofonts-${_robover}/"*.ttf "${pkgdir}/usr/share/fonts/TTF/"
        install -d -m 755 "${pkgdir}/usr/share/doc/${pkgname}/robotofonts"
}

package_ttf-droid-font(){
pkgver=${_droidver}
conflict=("ttf-droid")
license=("Apache")
pkgdesc="DroidSansFallback and DroidSansMono"
	install -d -m 755 "${pkgdir}/usr/share/fonts/TTF"
        install -m 644 "${srcdir}/droidfonts-cros-$_droidver/"*.ttf "${pkgdir}/usr/share/fonts/TTF/"
        install -d -m 755 "${pkgdir}/usr/share/doc/${pkgname}/droidfonts-cros"
}

package_ttf-th-sarabun-font(){
pkgver=${_sarabun}

license=("Apache")
pkgdesc="Sara bun font for Thai writting system"
	install -d -m 755 "${pkgdir}/usr/share/fonts/TTF"
	install -m 644 "${srcdir}/th-sarabun-fonts-${_sarabun}/"*.ttf "${pkgdir}/usr/share/fonts/TTF/"
	install -d -m 755 "${pkgdir}/usr/share/doc/${pkgname}/th-sarabun-fonts"
}

# Md5? is the default in pacman -g blame Allan
md5sums=('368f114c078f94214a308a74c7e991bc'
         '2626c1d45edbff72ec2667bc81c801eb'
         '85a7927441264d3845f8aea874e2df98'
         'da54672600f62c72bc81b08f35329024'
         'ae8f913acbff9c0106d75c1a6106d443'
         '715d38f358da74afbb6117492f3ae1b9'
         '0d0724d422efdec32deb1e932a945c9d'
         'cc62e181e017c9259b985dc6839160e9'
         '1bd3b17c213f6a2858a38efca44b2d3e')
