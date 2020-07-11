# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Malte Ohmstede <malte.ohmstede at gmail youknow>

# Based on PKGBUILD from https://aur.archlinux.org/packages/canon-pixma-mg5500-complete
# Scanner icon source: http://openiconlibrary.sourceforge.net/gallery2/open_icon_library-full/icons/png/64x64/devices/scanner-3.png
# The icon source URL isn't alive anymore

# Too many models to list in Package Description. List them all for a Google search.
# Model list assembled from Google and ugp01.c-ij.com.

# Canon PIXMA  E460   series E460 E461 E464 E468
# Canon PIXMA  E470   series E470 E471 E474 E477 E478
# Canon PIXMA  E480   series E480 E481 E484 E488 E489
# Canon PIXMA  G3000  series G3000 G3100 G3101 G3102 G3200 G3400 G3500 G3501 G3600 G3800 G3900
# Canon PIXMA  G4000  series G4000 G4100 G4102 G4200 G4400 G4500 G4600 G4800 G4900 G4902
# Canon MAXIFY iB4000 series iB4010 iB4020 iB4030 iB4040 iB4050 iB4060 iB4070 iB4080 iB4090
# Canon MAXIFY iB4100 series iB4110 iB4120 iB4130 iB4140 iB4150 iB4160 iB4170 iB4180 iB4190
# Canon PIXMA  iP110  series
# Canon MAXIFY MB2000 series MB2010 MB2020 MB2030 MB2040 MB2050 MB2060
# Canon MAXIFY MB2100 series MB2110 MB2120 MB2130 MB2140 MB2150 MB2155 MB2160
# Canon MAXIFY MB2300 series MB2320 MB2330 MB2340 MB2350 MB2360 MB2390
# Canon MAXIFY MB2700 series MB2710 MB2720 MB2730 MB2740 MB2750 MB2755 MB2760 MB2790
# Canon MAXIFY MB5000 series MB5020 MB5030 MB5040 MB5050 MB5060 MB5070 MB5080 MB5090
# Canon MAXIFY MB5100 series MB5110 MB5120 MB5130 MB5140 MB5150 MB5155 MB5160 MB5170 MB5180 MB5190
# Canon MAXIFY MB5300 series MB5310 MB5320 MB5330 MB5340 MB5350 MB5360 MB5370 MB5390
# Canon MAXIFY MB5400 series MB5410 MB5420 MB5430 MB5440 MB5450 MB5455 MB5460 MB5470 MB5480 MB5490
# Canon PIXMA  MG2900 series MG2910 MG2920 MG2922 MG2924 MG2929 MG2940 MG2945 MG2950S MG2950 MG2955 MG2960 MG2965S MG2970 MG2980 MG2990
# Canon PIXMA  MG3000 series MG3010 MG3020 MG3022 MG3040 MG3050 MG3051 MG3052 MG3053 MG3060 MG3070S MG3070 MG3077S MG3077 MG3080 MG3090
# Canon PIXMA  MG3600 series MG3610 MG3620 MG3630 MG3640 MG3640S MG3650 MG3650S MG3660 MG3670 MG3680
# Canon PIXMA  MG5600 series MG5610 MG5620 MG5622 MG5630 MG5640 MG5650 MG5655 MG5660 MG5670 MG5680
# Canon PIXMA  MG5700 series MG5710 MG5720 MG5721 MG5722 MG5730 MG5740 MG5750 MG5751 MG5752 MG5753 MG5760 MG5765 MG5766 MG5770 MG5780 MG5790 MG5795
# Canon PIXMA  MG6600 series MG6610 MG6620 MG6640 MG6650 MG6660 MG6670 MG6680
# Canon PIXMA  MG6800 series MG6810 MG6820 MG6821 MG6822 MG6840 MG6850 MG6851 MG6852 MG6853 MG6860 MG6865 MG6866 MG6870 MG6880
# Canon PIXMA  MG6900 series MG6930
# Canon PIXMA  MG7500 series MG7510 MG7520 MG7530F MG7530 MG7540 MG7550 MG7560 MG7570 MG7580
# Canon PIXMA  MG7700 series MG7710 MG7720 MG7730F MG7730 MG7740 MG7750 MG7751 MG7752 MG7753 MG7760 MG7765 MG7766 MG7770 MG7780 MG7790
# Canon PIXMA  MX490  series MX491 MX492 MX494 MX495 MX496 MX497 MX498 MX499
# Canon PIXMA  TS5000 series TS5010 TS5020 TS5022 TS5030 TS5030S TS5040 TS5050 TS5051 TS5053 TS5055 TS5060 TS5070 TS5080 TS5090
# Canon PIXMA  TS6000 series TS6010 TS6020 TS6030 TS6040 TS6050 TS6051 TS6052 TS6060 TS6070 TS6080
# Canon PIXMA  TS8000 series TS8010 TS8020 TS8030 TS8040 TS8050 TS8051 TS8052 TS8053 TS8060 TS8070 TS8080 TS8090
# Canon PIXMA  TS9000 series TS9010 TS9020 TS9030 TS9040 TS9050 TS9055 TS9060 TS9080

set -u
pkgname='canon-pixma-ts5055-complete'
pkgver='5.40'
_pkgversg='3.40'
pkgrel='2'
pkgdesc='Print Scan for Canon MAXIFY PIXMA series E460 E470 E480 G3000 G4000 iB4000 iB4100 iP110 MB2000 MB2100 MB2300 MB2700 MB5000 MB5100 MB5300 MB5400 MG2900 MG3000 MG3600 MG5600 MG5700 MG6600 MG6800 MG6900 MG7500 MG7700 MX490 TS5000 TS6000 TS8000 TS9000'
arch=('i686' 'x86_64')
#url='https://www.canon.de/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_ts_series/pixma-ts5055.html'
url='https://www.canon-europe.com/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_ts_series/pixma-ts5055.html?type=drivers'
license=('custom')
depends=('popt' 'libusb-compat' 'gtk2')
depends_x86_64=('libpng12' 'libtiff' 'libxml2')
depends_i686=("${depends_x86_64[@]/#/lib32-}")
conflicts=(
  'canon-pixma-mg3000-complete'
  'canon-pixma-mg5700-complete'
  'canon-pixma-mx495-printer'
)
options=('!strip')
install="${pkgname}.install"
_printDrvSrc="cnijfilter2-${pkgver}-1-deb"
_scanDrvSrc="scangearmp2-${_pkgversg}-1-deb"
source=(
  "http://gdlp01.c-wss.com/gds/9/0100008399/01/${_printDrvSrc}.tar.gz"
  "http://gdlp01.c-wss.com/gds/2/0100008402/01/${_scanDrvSrc}.tar.gz"
  "${pkgname}-scangear.desktop"
  "${pkgname}-scangear-icon.png"
)
md5sums=('9fde0c1def36fbd38b4d08cd22a2b7a8'
         '833f71781ba733fec84f4eb06d468fb4'
         '149560a4ef6a661611e12fafe828093b'
         '3feefd413092d7152f47b7451ba79efe')
sha256sums=('3b298716ad8b806fad72ed52714838921dea6f84253446a02d0e669afbc13804'
            'bb8d108b2c3557f3dc258d47b560ce96608a006ec7b052a630e0a5f911da2413'
            '1e9d0f0a8643d0d0d755aa5092a6fb684b24b445d21e7315b3becd15816a7dd1'
            '29dbc682d3f22d79f580bda54801d1f4ef261d857c756eaf4db29e1313406bcc')

_prb="cnijfilter2_${pkgver}-1"
_scb="scangearmp2_${_pkgversg}-1"
_prf="${_prb/_/-}-deb/packages"
_scf="${_scb/_/-}-deb/packages"

#_ppdFile='canonts5000.ppd'

prepare() {
  set -u

  # Unpack debian installer files

  declare -A _cax=([i686]='i386' [x86_64]='amd64')

  cd "${srcdir}/${_prf}"
  bsdtar -xf "${_prb}_${_cax[${CARCH}]}.deb"

  cd "${srcdir}/${_scf}"
  bsdtar -xf "${_scb}_${_cax[${CARCH}]}.deb"

  set +u
}

package() {
  set -u
  cd "${pkgdir}"

  bsdtar --no-same-owner -xf "${srcdir}/${_prf}/data.tar.gz"
  bsdtar --no-same-owner -xf "${srcdir}/${_scf}/data.tar.gz"

  # Move ppd file to where cups expects

  install -d 'usr/share/cups/'
  mv 'usr/share/ppd' 'usr/share/cups/model'

  # Install license files

  find 'usr/share/doc/' -name 'LICENSE*' -execdir install -Dpm644 '{}' -t "${pkgdir}/usr/share/licenses/${pkgname}/" ';'

  # Install entry in application menu, including icon

  install -Dpm644 "${srcdir}/${pkgname}-scangear.desktop" -t 'usr/share/applications/'
  install -Dpm644 "${srcdir}/${pkgname}-scangear-icon.png" -t 'usr/share/pixmaps/'

  # Mark shared libs executable

  find 'usr/lib' -name '*.so*' -exec chmod 755 '{}' '+'

  # grep -he '^*ModelName:' 'usr/share/cups/model'/*.ppd | sort -u > "${startdir}/models.${pkgver}.txt"

  set +u
}
set +u
