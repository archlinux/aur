# Maintainer: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>
# Last modified on 2018-05-02

pkgname="trougnouf-backgrounds"
pkgver=1.2
pkgrel=1
pkgdesc='Wallpapers created by User:Trougnouf, with gnome integration and transitions built-in'
url='https://commons.wikimedia.org/wiki/User:Trougnouf'
_url='https://commons.wikimedia.org/wiki/Special:Redirect/file/'
makedepends=()
license=('CCPL')
arch=('any')
img02='Inside_an_abandoned_military_building_in_Fort_de_la_Chartreuse,_Liege,_Belgium_(DSCF3343).jpg'
img03='Pears_covered_in_snow_at_Marché_de_Boitsfort_(Belgium).jpg'
img04='Fagne_Tirifaye_with_the_Hill_river_in_Waimes,_Belgium_(DSCF3679).jpg'
img05='View_through_the_shattered_glass_of_a_door_in_the_SNCB_B22490_type-K3_carriage,_looking_at_a_yellow_H._Weyhausen_KG_backhoe_loader_in_As,_Belgium_(DSCF3088-hdr).jpg'
img06='Pipes_in_the_water_treatment_plant_of_an_abandoned_steel_factory_in_Oupeye,_Belgium_(DSCF3276).jpg'
img07='Water_treatment_plant_in_an_abandoned_steel_factory_in_Oupeye,_Belgium_(DSCF3285).jpg'
img_tree='A_tree_South_of_Doel,_Belgium_(DSCF3811).jpg'
img09='Street_art_in_the_tunnel_at_Rue_des_Tanneurs_under_the_railway_(Brussels,_Belgium).jpg'
img10='Tunnel_Belliard,_coming_out_on_Rue_de_la_Loi.jpg'
img_cranes='Container_cranes_at_the_MPET-_MSC_PSA_European_Terminal_in_Port_of_Antwerp_(Kieldrecht,_Belgium)_during_the_sunset_civil_twilight_(DSCF3901).jpg'
img_ard='Beginning_of_Grande_Randonnée_en_Haute_Ardennes,_BE.jpg'
img12='Parc_Tenreuken_looking_South_from_the_West_side_during_the_sunset_civil_twilight,_Auderghem,_Belgium_(DSCF3745,DSCF3746-b1).jpg'
img13='Antwerpen-Centraal_railway_station_platform_21,_Belgium_(DSCF4760).jpg'
source=("${_url}${img02}" "${_url}${img03}"
	"${_url}${img04}" "${_url}${img05}" "${_url}${img06}"
	"${_url}${img07}" "${_url}${img_tree}" "${_url}${img09}"
	"${_url}${img10}" "${_url}${img_cranes}" "${_url}${img12}"
	"${_url}${img_ard}" "${_url}${img13}")
sha256sums=('816c37d71c5b3594aec28be8fe81699441007d9bbd1f240137f56691d2af51ad'
	'0381dac0c5cfdb7d3068d9758222708fcc281f4b45d115d93ed524894d723ccd'
	'34e13f84a99c20b7ba7280db25d6993675b17f953a327c144e57ad04abefd08f'
	'4890081d1a7cdacb036da85e54f900c5effc40741c2a76816ad316b41931ad2b'
	'ed2e76aedadc5e776fe8c350f1120cc3879d1888b33c9a898d85133dcc8165c9'
	'631f15689afb347757dedf3f9cc9e8b4dcb152cfffd9dbcb31d78d7955c5949e'
	'f5e476019deb0af38230da66a7749527001cb32f1f101966ab60ae082a38870b'
	'cf08f4598bd569eb8df860a83fd44110f5a25282e508732e924de1c3fab581c2'
	'a53cf0da1c9ff59bf7fff014a880154b154140ee5bc1e46fe1d099c7d6f36423'
	'21ca6228fa574de64975fb48306d59e98f345fcd75a2c5571d89216fa3ba8aa6'
	'f8fc6e64a19fab1aa6a7c676ef7eb6978abed3a115e5d3a73bd2a6a583195651'
	'decdcae46f94604ae65c0cc212e6eddd3eba16ec57613755afe5c75ab833cc1c'
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

<!-- alt: 11h35: End of a tunnel in Fort de la Chartreuse, Liege, Belgium (DSCF3456-hdr).jpg -->

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

<!-- alt: 13h56: View of an abandoned train track from the back of the SNCB B22495 type-K3 carriage in As, Belgium (DSCF3109-hdr).jpg -->

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

<!-- 14h56 to 15h30 = 34 minutes -->
<static>
<duration>2040</duration>
<file>/usr/share/backgrounds/trougnouf/${img07}</file>
</static>

<!-- alt: 15h36: Parc_Seny_on_a_snowy_day,_entering_from_Rue_Charles_Lemaire_(Auderghem,_Belgium)_-_road.jpg -->

<!-- 15h30 - 16h35 = 65 minutes -->
<static>
<duration>3900</duration>
<file>/usr/share/backgrounds/trougnouf/${img08}</file>
</static>

<!-- alt: 16h44: View through a broken window from a room in Sanatorium du Basil, Stoumont, Belgium (DSCF3542,DSCF3545).jpg -->

<!-- 16h35 to 17h16 = 41 minutes -->
<static>
<duration>2460</duration>
<file>/usr/share/backgrounds/trougnouf/${img09}</file>
</static>

<!-- 17h16 to 17h48 = 32 minutes -->
<static>
<duration>1920</duration>
<file>/usr/share/backgrounds/trougnouf/${img10}</file>
</static>

<!-- 17h48 to 18h06 = 18 minutes -->
<static>
<duration>1080</duration>
<file>/usr/share/backgrounds/trougnouf/${img_cranes}</file>
</static>

<!-- 18h06 to 19h55 = 109 minutes -->
<static>
<duration>6540</duration>
<file>/usr/share/backgrounds/trougnouf/${img12}</file>
</static>

<!-- 19h55 to 22h46 = 171 minutes -->
<static>
<duration>10260</duration>
<file>/usr/share/backgrounds/trougnouf/${img_ard}</file>
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
    <filename>/usr/share/backgrounds/trougnouf/${img_tree}</filename>
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
    <name>${img_cranes}</name>
    <filename>/usr/share/backgrounds/trougnouf/${img_cranes}</filename>
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
    <name>${img_ard}</name>
    <filename>/usr/share/backgrounds/trougnouf/${img_ard}</filename>
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

