pkgname=infocom-docs
pkgdesc="Infocom documentation & feelies"
url="http://infodoc.plover.net"
pkgver=1989
pkgrel=3
arch=('any')
depends=('infocom')
license=('none')
options=('!strip')

_pdf_mirror=('http://infodoc.plover.net/manuals')
_feelmirror=('http://infocom.elsewhere.org/gallery')

source=("${_pdf_mirror}/"{amfv,bureaucr,leather,planetfa,stationf,wishbrin,zork1,zork2,zork3}".pdf"

	"${_pdf_mirror}/temp/"{arthur,ballyhoo,borderzo,cutthroa,deadline,enchante,hollywoo,infidel,journey,lurking,moonmist,nordandb,plundere,seastalk,sherlock,sorcerer,spellbre,starcros,suspect,suspende,trinity,witness,zork0}".pdf")

md5sums=('e48ca9b9c7e233e3d152956f1ea823cc'
	 'ffd1e92a2f6287606a0c068da5eae25b'
	 '3365ae559c7494443a00799bc124eaec'
	 'bd33e3a81291f0b76374b336fa286798'
	 '528d0a658c85a738ef11f10a9904c617'
	 'b3ffd2a1f62ff651bcd3d3d6d2eaff25'
	 'e75713e190353c4aa6625102832ba551'
	 'a0c7309e8a20e0cdc348c228bf6cc274'
	 '89f8dc0d3e20a68176ad46d19839d825'
	 'e2af5225474703b956286393df02b1e8'
	 '37c8ae32909c0c5a48a8fab45e64d64e'
	 'bebf3f57675c5f4d18034fc2bf7cfb8f'
	 '9d98e6ce97f39b8d04cbe9ee49fa2b03'
	 '7054cc1d31abad5ecf9d1a42ad9ae9fc'
	 'dc116a59f51a2bd60eba261d4e307917'
	 'caa56cba84e6c5c6480f835984978c48'
	 '327467734572b6708ba7e20769b2540b'
	 '847f0c4938bf50cf7e0ff9acf04a370b'
	 '78bc6e7f8f86d3fde42674db56a7fbce'
	 '40912f77d9b8c2ca4486bbae70654d71'
	 'ddf0b95b21b6a6ecd5b84739b15b3fa8'
	 '774583deb2c424b97667d36b3c61710d'
	 '2e3fe17f239a60e538abf096de25ea33'
	 '6f27837d0ce5c3dc884b6349ec31a3e7'
	 '645aab6ef8d6373e585c1745bbb55ff6'
	 '18435b15a461240814ff944485ab025b'
	 '9c1a3fbe26a6c907af7488318f7493ca'
	 '4fbc8967e18b697addeb4ddd9df2385c'
	 'a3a8eb1913bc5cae9f9557a6d94390e4'
	 '9fe396eaa7bd52d4b99f8c29588309ee'
	 '9da5e20888f8bca25c829c59caaef272')


package() {

    cd "${srcdir}"

    mkdir -p "${pkgdir}"/opt/xyz/infocom/manuals
    install -Dvpm644 *.pdf "${pkgdir}"/opt/xyz/infocom/manuals/

}
