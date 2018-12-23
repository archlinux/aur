# Maintainer: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>
# Last images added on 2018-12-23

pkgname="trougnouf-backgrounds"
pkgver=1.6
pkgrel=2
pkgdesc='Wallpapers created by User:Trougnouf, with gnome integration and transitions built-in'
url='https://commons.wikimedia.org/wiki/User:Trougnouf'
_url='https://commons.wikimedia.org/wiki/Special:Redirect/file/'
makedepends=()
license=('CCPL')
arch=('any')

_images=(
    'Inside_an_abandoned_military_building_in_Fort_de_la_Chartreuse,_Liege,_Belgium_(DSCF3343).jpg'
	'Pears_covered_in_snow_at_Marché_de_Boitsfort_(Belgium).jpg'
	'Fagne_Tirifaye_with_the_Hill_river_in_Waimes,_Belgium_(DSCF3679).jpg'
	'View_through_the_shattered_glass_of_a_door_in_the_SNCB_B22490_type-K3_carriage,_looking_at_a_yellow_H._Weyhausen_KG_backhoe_loader_in_As,_Belgium_(DSCF3088-hdr).jpg'
	'Stawamus_Chief_Provincial_Park,_BC_(DSCF7828).jpg'
	'Rock_dove_(Columba_livia)_standing_on_place_de_la_Bourse,_Brussels,_Belgium_(DSCF4429).jpg'
	'Pipes_in_the_water_treatment_plant_of_an_abandoned_steel_factory_in_Oupeye,_Belgium_(DSCF3276).jpg'
	'Water_treatment_plant_in_an_abandoned_steel_factory_in_Oupeye,_Belgium_(DSCF3285).jpg' # 14h56 to 15h30
	'A_tree_South_of_Doel,_Belgium_(DSCF3811).jpg'  # 15h30 to 16h21
	'Lac de Virelles (frozen), Chimay (DSC 0251).jpg'   # 16h21 to 16h35
	'Street_art_in_the_tunnel_at_Rue_des_Tanneurs_under_the_railway_(Brussels,_Belgium).jpg'
	'Tunnel_Belliard,_coming_out_on_Rue_de_la_Loi.jpg'
	'Container_cranes_at_the_MPET-_MSC_PSA_European_Terminal_in_Port_of_Antwerp_(Kieldrecht,_Belgium)_during_the_sunset_civil_twilight_(DSCF3901).jpg'
	'Parc_Tenreuken_looking_South_from_the_West_side_during_the_sunset_civil_twilight,_Auderghem,_Belgium_(DSCF3745,DSCF3746-b1).jpg'
	'Beginning_of_Grande_Randonnée_en_Haute_Ardennes,_BE.jpg'
	'Garden_of_Kunstberg_viewed_from_Mont_des_Arts_during_nautical_twilight_(DSCF1028).jpg'
	'Antwerpen-Centraal_railway_station_platform_21,_Belgium_(DSCF4760).jpg'
	)

_stimes=(
	8100 # 10h16 to 12h31 = 135 minutes
	2160 # 12h31 to 13h07 = 36 minutes
	2580 # 13h07 to 13h50 = 43 minutes
	1080 # 13h50 to 14h08 = 18 minutes
	900 # 14h08 to 14h23 = 15 minutes
	900 # 14h23 to 14h38 = 15 minutes
	1080 # 14h38 to 14h56 = 18 minutes
	2040 # 14h56 to 15h30 = 34 minutes
	3900 # 15h30 to 16h21 = 65 minutes
	840 # 16h21 to 16h35 = 14 minutes
	2460 # 16h35 to 17h16 = 41 minutes
	1920 # 17h16 to 17h48 = 32 minutes
	1080 # 17h48 to 18h06 = 18 minutes
	6540 # 18h06 to 19h55 = 109 minutes
	1800 # 19h55 to 20h25 = 30 minutes
	8460 # 20h25 to 22h46 = 141 minutes
	41400 # 22h46 to 10h16 = 690 minutes
)
	
sha256sums=('60da898f8fb43491594e7466f44294db43795d61de124f590eb2be2d42ea208a'
	'0381dac0c5cfdb7d3068d9758222708fcc281f4b45d115d93ed524894d723ccd'
	'34e13f84a99c20b7ba7280db25d6993675b17f953a327c144e57ad04abefd08f'
	'4890081d1a7cdacb036da85e54f900c5effc40741c2a76816ad316b41931ad2b'
	'799cf4bd62c5ac685acf28fe0fd8555db2fe318020767cc8dee3e377abb18a68'
	'348eaede0251784bd0ecc0357ad5272b760a1457ca6a036fa295a3d37f9c945d'
	'ed2e76aedadc5e776fe8c350f1120cc3879d1888b33c9a898d85133dcc8165c9'
	'563a2acab1c80c2ad4f0f60cc514811191c25406c416415aea9b51151462ef58'
	'f5e476019deb0af38230da66a7749527001cb32f1f101966ab60ae082a38870b'
	'57222827c856252af6631acd494fb6739130b7a8f5fa0b1f45ec405c72f6a4a5'
	'cf08f4598bd569eb8df860a83fd44110f5a25282e508732e924de1c3fab581c2'
	'0f7fed8930d452f4355d1f9026aeedcc74587a7344c9758959de0b329fa08e5e'
	'21ca6228fa574de64975fb48306d59e98f345fcd75a2c5571d89216fa3ba8aa6'
	'f8fc6e64a19fab1aa6a7c676ef7eb6978abed3a115e5d3a73bd2a6a583195651'
	'514845799c8e44b4faaeda29420cb0f2de708ed722f99ce10627704a8d6d6328'
	'c609f60318d57135e43314a81ff5a95c9b8290190d18bb5cb0d720f1616b9f4a'
	'3411929c2eb43edbc190dbb694f32b8257b13f953278f39e54a70178ca035e1c')

source=("${_images[@]/#/${_url}}")

package() {
	mkdir -p "${pkgdir}/usr/share/backgrounds/trougnouf/"
	mkdir -p "${pkgdir}/usr/share/gnome-background-properties"
	cp ${srcdir}/*.jpg "${pkgdir}/usr/share/backgrounds/trougnouf/"

echo "
<!-- Author: trougnouf (Benoit Brummer), license: CC-BY-SA -->
<background>
  <starttime>
    <year>2011</year>
    <month>11</month>
    <day>24</day>
    <hour>10</hour>
    <minute>16</minute>
    <second>00</second>
  </starttime>" > "${pkgdir}/usr/share/backgrounds/trougnouf/trougnouf-timed.xml"
for i in `seq 0 $[${#_images[@]}-1]`
do
	echo "
	<static>
	<duration>${_stimes[$i]}</duration>
	<file>/usr/share/backgrounds/trougnouf/${_images[$i]}</file>
	</static>" >> "${pkgdir}/usr/share/backgrounds/trougnouf/trougnouf-timed.xml"
done
echo '</background>' >> "${pkgdir}/usr/share/backgrounds/trougnouf/trougnouf-timed.xml"

echo "<?xml version=\"1.0\"?>
<!DOCTYPE wallpapers SYSTEM \"gnome-wp-list.dtd\">
<!-- Author: trougnouf (Benoit Brummer), license: CC-BY-SA -->
<wallpapers>
  <wallpaper deleted=\"false\">
    <name>trougnouf-backgrounds</name>
    <filename>/usr/share/backgrounds/trougnouf/trougnouf-timed.xml</filename>
    <options>zoom</options>
    <pcolor>#ffffff</pcolor>
    <scolor>#000000</scolor>
  </wallpaper>" > "${pkgdir}/usr/share/gnome-background-properties/trougnouf-backgrounds.xml"
for _img in ${_images[@]}
do
	echo "<wallpaper deleted=\"false\">
    <name>${_img}</name>
    <filename>/usr/share/backgrounds/trougnouf/${_img}</filename>
    <options>zoom</options>
    <pcolor>#ffffff</pcolor>
    <scolor>#000000</scolor>
</wallpaper>" >> "${pkgdir}/usr/share/gnome-background-properties/trougnouf-backgrounds.xml"
done
echo "</wallpapers>" >> "${pkgdir}/usr/share/gnome-background-properties/trougnouf-backgrounds.xml"
}

