# Maintainer: Daniel Peukert <daniel@peukert.cc>
_ca='eidentity'
pkgname="ca-certificates-$_ca"
pkgver='20260119'
pkgrel='1'
pkgdesc='eIdentity root & issuing certificates'
arch=('any')
url="https://www.$_ca.cz/certifikaty-certifikacnich-autorit/"
license=('unknown')
depends=('ca-certificates-utils')
source=(
	# ACAeID3
	"$pkgname-$pkgver-root3.pem::https://www.$_ca.cz/root3/root3.pem"							# CN=ACAeID3 - Root Certificate, expires 2042/10/24
	"$pkgname-$pkgver-aca3-1.pem::https://www.$_ca.cz/aca3.1/aca3-1.pem"						# CN=ACAeID3.1 - Issuing Certificate, expired 2024/10/24, included for verifying past signatures
	"$pkgname-$pkgver-aca3-2.pem::https://www.$_ca.cz/wp-content/uploads/2021/09/aca3-2.pem"	# CN=ACAeID3.2 - Issuing Certificate, expires 2028/06/21
	"$pkgname-$pkgver-aca3-3.pem::https://www.$_ca.cz/wp-content/uploads/2025/06/aca3-3.pem"	# CN=ACAeID3.3 - Issuing Certificate, expires 2032/02/14
	"$pkgname-$pkgver-cca3-1.pem::https://www.$_ca.cz/cca3.1/cca3-1.pem"						# CN=CCAeID3.1 - Commercial Issuing Certificate, expired 2025/05/08, included for verifying past signatures
	"$pkgname-$pkgver-cca3-2.pem::https://www.$_ca.cz/wp-content/uploads/2021/09/cca3-2.pem"	# CN=CCAeID3.2 - Commercial Issuing Certificate, expires 2028/06/21
	"$pkgname-$pkgver-cca3-3.pem::https://www.$_ca.cz/wp-content/uploads/2025/06/cca3-3.pem"	# CN=CCAeID3.3 - Commercial Issuing Certificate, expires 2032/06/13
	"$pkgname-$pkgver-tsu3-1.pem::https://www.$_ca.cz/tsa3/tsu3-1.pem"							# CN=TSU3.1, expired 2024/10/24, included for verifying past signatures
	"$pkgname-$pkgver-tsu3-2.pem::https://www.$_ca.cz/tsa3/tsu3-2.pem"							# CN=TSU3.2, expired 2024/10/24, included for verifying past signatures
	"$pkgname-$pkgver-tsu3-3.pem::https://www.$_ca.cz/tsa3/tsu3-3.pem"							# CN=TSU3.3, expired 2024/10/24, included for verifying past signatures
	"$pkgname-$pkgver-tsu3-4.pem::https://www.$_ca.cz/tsa3/tsu3-4.pem"							# CN=TSU3.4, expired 2024/10/24, included for verifying past signatures
	"$pkgname-$pkgver-tsu3-5.pem::https://www.$_ca.cz/tsa3/tsu3-5.pem"							# CN=TSU3.5, expired 2024/10/24, included for verifying past signatures
	"$pkgname-$pkgver-tsu3-6.pem::https://www.$_ca.cz/tsa3/tsu3-6.pem"							# CN=TSU3.6, expired 2024/10/24, included for verifying past signatures
	"$pkgname-$pkgver-tsu3-10.pem::https://www.$_ca.cz/wp-content/uploads/2021/09/tsu3-10.pem"	# CN=TSU3.10, expires 2028/06/21
	"$pkgname-$pkgver-tsu3-11.pem::https://www.$_ca.cz/wp-content/uploads/2021/09/tsu3-11.pem"	# CN=TSU3.11, expires 2028/06/21
	"$pkgname-$pkgver-tsu3-12.pem::https://www.$_ca.cz/wp-content/uploads/2021/09/tsu3-12.pem"	# CN=TSU3.12, expires 2028/06/21
	"$pkgname-$pkgver-tsu3-13.pem::https://www.$_ca.cz/wp-content/uploads/2024/06/tsu3-13.pem"	# CN=TSU3.13, expires 2030/03/27
	"$pkgname-$pkgver-tsu3-14.pem::https://www.$_ca.cz/wp-content/uploads/2024/06/tsu3-14.pem"	# CN=TSU3.14, expires 2030/03/27
	"$pkgname-$pkgver-tsu3-15.pem::https://www.$_ca.cz/wp-content/uploads/2025/04/tsu3-15.pem"	# CN=TSU3.15, expires 2032/02/14
	"$pkgname-$pkgver-tsu3-16.pem::https://www.$_ca.cz/wp-content/uploads/2025/04/tsu3-16.pem"	# CN=TSU3.16, expires 2032/02/14

	# ACAeID2
	"$pkgname-$pkgver-root2.pem::https://www.$_ca.cz/root2/root2.pem"							# CN=ACAeID2 - Qualified Root Certificate (kvalifikovaný systémový certifikát kořenové CA), expired 2022/02/22, included for verifying past signatures
	"$pkgname-$pkgver-aca2.pem::https://www.$_ca.cz/aca2/aca2.pem"								# CN=ACAeID2 - Qualified Issuing Certificate (kvalifikovaný systémový certifikát vydávající CA), expired 2016/02/22, included for verifying past signatures
	"$pkgname-$pkgver-aca2.1.pem::https://www.$_ca.cz/aca2.1/aca2.1.pem"						# CN=ACAeID2.1 - Qualified Issuing Certificate (kvalifikovaný systémový certifikát vydávající CA), expired 2021/02/01, included for verifying past signatures
	"$pkgname-$pkgver-cca2.pem::https://www.$_ca.cz/cca2/cca2.pem"								# CN=CCAeID2 - Commercial Certificate Authority (kvalifikovaný systémový certifikát komerční CA), expired 2016/02/22, included for verifying past signatures
	"$pkgname-$pkgver-cca2.1.pem::https://www.$_ca.cz/cca2.1/cca2.1.pem"						# CN=CCAeID2.1 - Commercial Certificate Authority (kvalifikovaný systémový certifikát komerční CA), expired 2021/02/01, included for verifying past signatures
	"$pkgname-$pkgver-tsu2.pem::https://www.$_ca.cz/tsa1/tsu2.pem"								# CN=TSU2, expired 2021/03/17, included for verifying past signatures

	# ACAeID
	"$pkgname-$pkgver-root.pem::https://www.$_ca.cz/root/rca.pem"								# CN=ACAeID - Qualified Root Certificate (kvalifikovaný systémový certifikát kořenové CA), expired 2017/11/15, included for verifying past signatures
	"$pkgname-$pkgver-aca.pem::https://www.$_ca.cz/aca/aca.pem"									# CN=ACAeID - Qualified Issuing Certificate (kvalifikovaný systémový certifikát vydávající CA), expired 2011/11/15, included for verifying past signatures
	"$pkgname-$pkgver-cca.pem::https://www.$_ca.cz/cca/cca.pem"									# CN=CCAeID - Commercial Certificate Authority (certifikát komerční certifikační autority), expired 2012/03/17, included for verifying past signatures
)
sha1sums=('715e002a6f8f3624a36efe581ff65dd7bc382aee'
          'a0b0e60557b846315299ee2387919d42bef7c640'
          '3d3a2c4e2522fd415e91c198e7bb3c05a830625b'
          '1fa9433d3911eaebc6e6684c7695f56aa6ea5891'
          '27ef7622f11866823963f4effa44145984410215'
          '89e8443761c4ddcd4e81da5bad66f727565e24fa'
          'b32b777359d6caa5af67d5feb6c96271ef919dc3'
          'acf122d62dbcf79280a822fc0a8c79d39bdf04db'
          '4e5b46773f8ebba8cd90b19bd6f3eea2352fcdbd'
          '1a93de263d298e7e7aa452b85a70946f06c0dcdc'
          '9034c108305be40cd7766b4922e73eef3fda4b35'
          'd8150ffb47c58f2500deffdfecef5066045d5e5b'
          '2f8b5627520df1db461f0494a69f54d4b7155aa2'
          'b94cff87c5116ca21bde1ef60676247a7dfaa410'
          '50e2c3dbe373f4e4a5a57586b2275008b5a1811f'
          '292dbc0ef20eec73812596c345f4f0575c1e8438'
          '990f590b053741eccaa91aedf54b252d6f228e04'
          '4f636573642feff9c800f7a9d9362fa03c79dfef'
          '1f6c07d5ec1d139aa87cd4c6aea3c1a572f5f8be'
          '3f71e2afac915d0d29df91c21911eaca8cd53513'
          '7dbc7fa38623d3e909c448ef91ca32f1aea37395'
          '30797723845dfd9082990c6e19312d9b27010794'
          '668e650f13dca6f07d6f43d6ef23968f7a9ba72b'
          '37bb1ecf39d22ae211ff287218ba8b8f87ec22e3'
          '5c1a41b11c3e432ffc042a5be9a79f54013a8c86'
          '6c7945145d78270d302eae681e02d66812f77f58'
          '02378409ed8128a48a4f6a64bae224eb47f675cf'
          'e2dd4121756fdcde2388de038be51ab294f96bc0'
          '29e33fdb901eb8d19e148fdf7e0cc7aeddad3845')

package() {
	cd "$srcdir/"

	# ACAeID3
	install -Dm644 "$pkgname-$pkgver-root3.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-root3.pem"
	install -Dm644 "$pkgname-$pkgver-aca3-1.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-aca3-1.pem"
	install -Dm644 "$pkgname-$pkgver-aca3-2.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-aca3-2.pem"
	install -Dm644 "$pkgname-$pkgver-aca3-3.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-aca3-3.pem"
	install -Dm644 "$pkgname-$pkgver-cca3-1.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-cca3-1.pem"
	install -Dm644 "$pkgname-$pkgver-cca3-2.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-cca3-2.pem"
	install -Dm644 "$pkgname-$pkgver-cca3-3.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-cca3-3.pem"
	install -Dm644 "$pkgname-$pkgver-tsu3-1.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-tsu3-1.pem"
	install -Dm644 "$pkgname-$pkgver-tsu3-2.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-tsu3-2.pem"
	install -Dm644 "$pkgname-$pkgver-tsu3-3.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-tsu3-3.pem"
	install -Dm644 "$pkgname-$pkgver-tsu3-4.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-tsu3-4.pem"
	install -Dm644 "$pkgname-$pkgver-tsu3-5.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-tsu3-5.pem"
	install -Dm644 "$pkgname-$pkgver-tsu3-6.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-tsu3-6.pem"
	install -Dm644 "$pkgname-$pkgver-tsu3-10.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-tsu3-10.pem"
	install -Dm644 "$pkgname-$pkgver-tsu3-11.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-tsu3-11.pem"
	install -Dm644 "$pkgname-$pkgver-tsu3-12.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-tsu3-12.pem"
	install -Dm644 "$pkgname-$pkgver-tsu3-13.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-tsu3-13.pem"
	install -Dm644 "$pkgname-$pkgver-tsu3-14.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-tsu3-14.pem"
	install -Dm644 "$pkgname-$pkgver-tsu3-15.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-tsu3-15.pem"
	install -Dm644 "$pkgname-$pkgver-tsu3-16.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-tsu3-16.pem"

	# ACAeID2
	install -Dm644 "$pkgname-$pkgver-root2.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-root2.pem"
	install -Dm644 "$pkgname-$pkgver-aca2.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-aca2.pem"
	install -Dm644 "$pkgname-$pkgver-aca2.1.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-aca2.1.pem"
	install -Dm644 "$pkgname-$pkgver-cca2.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-cca2.pem"
	install -Dm644 "$pkgname-$pkgver-cca2.1.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-cca2.1.pem"
	install -Dm644 "$pkgname-$pkgver-tsu2.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-tsu2.pem"
	
	# ACAeID
	install -Dm644 "$pkgname-$pkgver-root.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-rca.pem"
	install -Dm644 "$pkgname-$pkgver-aca.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-aca.pem"
	install -Dm644 "$pkgname-$pkgver-cca.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-cca.pem"
	
}
