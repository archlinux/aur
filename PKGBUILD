# Maintainer: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>

pkgname="trougnouf-backgrounds"
pkgver=1.0.0
pkgrel=1
pkgdesc='Wallpapers created by User:Trougnouf, with gnome integration and transitions built-in'
url='https://commons.wikimedia.org/wiki/User:Trougnouf'
_url='https://upload.wikimedia.org/wikipedia/commons/'
makedepends=()
license=('CCPL')
arch=('any')
img02='Inside_an_abandoned_military_building_in_Fort_de_la_Chartreuse,_Liege,_Belgium_(DSCF3343).jpg'
img03='Pears_covered_in_snow_at_Marché_de_Boitsfort_(Belgium).jpg'
img04='Fagne_Tirifaye_with_the_Hill_river_in_Waimes,_Belgium_(DSCF3679).jpg'
img05='View_through_the_shattered_glass_of_a_door_in_the_SNCB_B22490_type-K3_carriage,_looking_at_a_yellow_H._Weyhausen_KG_backhoe_loader_in_As,_Belgium_(DSCF3088-hdr).jpg'
img06='Pipes_in_the_water_treatment_plant_of_an_abandoned_steel_factory_in_Oupeye,_Belgium_(DSCF3276).jpg'
img07='Water_treatment_plant_in_an_abandoned_steel_factory_in_Oupeye,_Belgium_(DSCF3285).jpg'
img08='Parc_Seny_on_a_snowy_day,_entering_from_Rue_Charles_Lemaire_(Auderghem,_Belgium)_-_road.jpg'
img09='Street_art_in_the_tunnel_at_Rue_des_Tanneurs_under_the_railway_(Brussels,_Belgium).jpg'
img10='Tunnel_Belliard,_coming_out_on_Rue_de_la_Loi.jpg'
img11='Sunset_(civil_twilight)_in_Maasmechelen,_Belgium_(DSCF3215-hdr).jpg'
img12='Parc_Tenreuken_looking_South_from_the_West_side_during_the_sunset_civil_twilight,_Auderghem,_Belgium_(DSCF3745,DSCF3746-b1).jpg'
img13='Antwerpen-Centraal_railway_station_platform_21,_Belgium_(DSCF4760).jpg'
source=("${_url}3/3c/${img02}" "${_url}1/15/${img03}"
	"${_url}0/00/${img04}" "${_url}5/51/${img05}" "${_url}1/13/${img06}"
	"${_url}7/78/${img07}" "${_url}8/89/${img08}" "${_url}2/2c/${img09}"
	"${_url}1/11/${img10}" "${_url}a/a8/${img11}" "${_url}f/f4/${img12}"
	"${_url}1/10/${img13}")
sha256sums=('816c37d71c5b3594aec28be8fe81699441007d9bbd1f240137f56691d2af51ad'
	'0381dac0c5cfdb7d3068d9758222708fcc281f4b45d115d93ed524894d723ccd'
	'34e13f84a99c20b7ba7280db25d6993675b17f953a327c144e57ad04abefd08f'
	'4890081d1a7cdacb036da85e54f900c5effc40741c2a76816ad316b41931ad2b'
	'ed2e76aedadc5e776fe8c350f1120cc3879d1888b33c9a898d85133dcc8165c9'
	'631f15689afb347757dedf3f9cc9e8b4dcb152cfffd9dbcb31d78d7955c5949e'
	'632d96c32dd6a29b266859b42c34a09782de65a6d6151f4d31e466034713a4e1'
	'cf08f4598bd569eb8df860a83fd44110f5a25282e508732e924de1c3fab581c2'
	'a53cf0da1c9ff59bf7fff014a880154b154140ee5bc1e46fe1d099c7d6f36423'
	'0bdd3c9704f481f822013e1689cb4f67ba2adda0f3fa25b1e79ea5faf5cde6a9'
	'f8fc6e64a19fab1aa6a7c676ef7eb6978abed3a115e5d3a73bd2a6a583195651'
	'3411929c2eb43edbc190dbb694f32b8257b13f953278f39e54a70178ca035e1c')

package() {
	mkdir -p "${pkgdir}/usr/share/backgrounds/trougnouf/"
	mkdir -p "${pkgdir}/usr/share/gnome-background-properties"
	cp ${srcdir}/*.jpg "${pkgdir}/usr/share/backgrounds/trougnouf/"



	echo "<background>
  <starttime>
    <year>2011</year>
    <month>11</month>
    <day>24</day>
    <hour>10</hour>
    <minute>16</minute>
    <second>00</second>
  </starttime>

<!-- This animation will start at 10h16. -->

<!-- 10h16 to 12h31 = 135 minutes -->
<static>
<duration>8100</duration>
<file>/usr/share/backgrounds/trougnouf/${img02}</file>
</static>

<!-- 12h31 to 13h07 = 36 minutes -->
<static>
<duration>2160</duration>
<file>/usr/share/backgrounds/trougnouf/${img03}</file>
</static>

<!-- 13h07 to 13h50 = 43 minutes -->
<static>
<duration>2580</duration>
<file>/usr/share/backgrounds/trougnouf/${img04}</file>
</static>

<!-- 13h50 to 14h23 = 33 minutes -->
<static>
<duration>1980</duration>
<file>/usr/share/backgrounds/trougnouf/${img05}</file>
</static>

<!-- 14h23 to 14h56 = 33 minutes -->
<static>
<duration>1980</duration>
<file>/usr/share/backgrounds/trougnouf/${img06}</file>
</static>

<!-- 14h56 to 15h36 = 40 minutes -->
<static>
<duration>2400</duration>
<file>/usr/share/backgrounds/trougnouf/${img07}</file>
</static>

<!-- = 15h36 to 16h35 = 59 minutes -->
<static>
<duration>3540</duration>
<file>/usr/share/backgrounds/trougnouf/${img08}</file>
</static>

<!-- 16h35 to 17h16 = 41 minutes -->
<static>
<duration>2460</duration>
<file>/usr/share/backgrounds/trougnouf/${img09}</file>
</static>

<!-- 17h16 to 17h45 = 29 minutes -->
<static>
<duration>1740</duration>
<file>/usr/share/backgrounds/trougnouf/${img10}</file>
</static>

<!-- 17h45 to 18h06 = 21 minutes -->
<static>
<duration>1260</duration>
<file>/usr/share/backgrounds/trougnouf/${img11}</file>
</static>

<!-- 18h06 to 22h46 = 280 minutes -->
<static>
<duration>16800</duration>
<file>/usr/share/backgrounds/trougnouf/${img12}</file>
</static>

<!-- 22h46 to 10h16 = 690 minutes -->
<static>
<duration>41400</duration>
<file>/usr/share/backgrounds/trougnouf/${img13}</file>
</static>
</background>" > "${pkgdir}/usr/share/backgrounds/trougnouf/trougnouf-timed.xml"



echo "<?xml version=\"1.0\"?>
<!DOCTYPE wallpapers SYSTEM \"gnome-wp-list.dtd\">
<wallpapers>
  <wallpaper deleted=\"false\">
    <name>trougnouf-backgrounds</name>
    <filename>/usr/share/backgrounds/trougnouf/trougnouf-timed.xml</filename>
    <options>zoom</options>
    <pcolor>#ffffff</pcolor>
    <scolor>#000000</scolor>
  </wallpaper>
  <wallpaper deleted=\"false\">
    <name>${img02}</name>
    <filename>/usr/share/backgrounds/trougnouf/${img02}</filename>
    <options>zoom</options>
    <pcolor>#ffffff</pcolor>
    <scolor>#000000</scolor>
  </wallpaper>
  <wallpaper deleted=\"false\">
    <name>${img03}</name>
    <filename>/usr/share/backgrounds/trougnouf/${img03}</filename>
    <options>zoom</options>
    <pcolor>#ffffff</pcolor>
    <scolor>#000000</scolor>
  </wallpaper>
  <wallpaper deleted=\"false\">
    <name>${img04}</name>
    <filename>/usr/share/backgrounds/trougnouf/${img04}</filename>
    <options>zoom</options>
    <pcolor>#ffffff</pcolor>
    <scolor>#000000</scolor>
  </wallpaper>
  <wallpaper deleted=\"false\">
    <name>${img05}</name>
    <filename>/usr/share/backgrounds/trougnouf/${img05}</filename>
    <options>zoom</options>
    <pcolor>#ffffff</pcolor>
    <scolor>#000000</scolor>
  </wallpaper>
  <wallpaper deleted=\"false\">
    <name>${img06}</name>
    <filename>/usr/share/backgrounds/trougnouf/${img06}</filename>
    <options>zoom</options>
    <pcolor>#ffffff</pcolor>
    <scolor>#000000</scolor>
  </wallpaper>
  <wallpaper deleted=\"false\">
    <name>${img07}</name>
    <filename>/usr/share/backgrounds/trougnouf/${img07}</filename>
    <options>zoom</options>
    <pcolor>#ffffff</pcolor>
    <scolor>#000000</scolor>
  </wallpaper>
  <wallpaper deleted=\"false\">
    <name>${img08}</name>
    <filename>/usr/share/backgrounds/trougnouf/${img08}</filename>
    <options>zoom</options>
    <pcolor>#ffffff</pcolor>
    <scolor>#000000</scolor>
  </wallpaper>
  <wallpaper deleted=\"false\">
    <name>${img09}</name>
    <filename>/usr/share/backgrounds/trougnouf/${img09}</filename>
    <options>zoom</options>
    <pcolor>#ffffff</pcolor>
    <scolor>#000000</scolor>
  </wallpaper>
  <wallpaper deleted=\"false\">
    <name>${img10}</name>
    <filename>/usr/share/backgrounds/trougnouf/${img10}</filename>
    <options>zoom</options>
    <pcolor>#ffffff</pcolor>
    <scolor>#000000</scolor>
  </wallpaper>
  <wallpaper deleted=\"false\">
    <name>${img11}</name>
    <filename>/usr/share/backgrounds/trougnouf/${img11}</filename>
    <options>zoom</options>
    <pcolor>#ffffff</pcolor>
    <scolor>#000000</scolor>
  </wallpaper>
  <wallpaper deleted=\"false\">
    <name>${img12}</name>
    <filename>/usr/share/backgrounds/trougnouf/${img12}</filename>
    <options>zoom</options>
    <pcolor>#ffffff</pcolor>
    <scolor>#000000</scolor>
  </wallpaper>
  <wallpaper deleted=\"false\">
    <name>${img13}</name>
    <filename>/usr/share/backgrounds/trougnouf/${img13}</filename>
    <options>zoom</options>
    <pcolor>#ffffff</pcolor>
    <scolor>#000000</scolor>
  </wallpaper>
</wallpapers>" > "${pkgdir}/usr/share/gnome-background-properties/trougnouf-backgrounds.xml"
}

