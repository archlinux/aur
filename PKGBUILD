# Maintainer: Daniel Peukert <daniel@peukert.cc>
_ca='ica'
pkgname="ca-certificates-$_ca"
pkgver='20260119'
pkgrel='1'
pkgdesc='I.CA root & issuing certificates'
arch=('any')
url="https://www.$_ca.cz/korenove-certifikaty"
license=('unknown')
depends=('ca-certificates-utils')
source=(
	# I.CA Root CA/ECC 05/2022
	"$pkgname-$pkgver-rca22_ecc.pem::https://www.$_ca.cz/sites/default/files/download/2025/rca22_ecc.pem"								# CN=I.CA Root CA/ECC 05/, expires 2047/05/03
	"$pkgname-$pkgver-2qca22_ecc.pem::https://www.$_ca.cz/sites/default/files/download/2025/2qca22_ecc.pem"								# CN=I.CA EU Qualified CA2/ECC 06/2022, expires 2032/06/17
	"$pkgname-$pkgver-pca22_ecc.pem::https://www.$_ca.cz/sites/default/files/download/2025/pca22_ecc.pem"								# CN=I.CA Public CA/ECC 06/2022, expires 2032/06/17

	# I.CA Root CA/RSA 05/2022
	"$pkgname-$pkgver-rca22_rsa.pem::https://www.$_ca.cz/sites/default/files/download/2025/rca22_rsa.pem"								# CN=I.CA Root CA/RSA 05/2022, expires 2047/05/03
	"$pkgname-$pkgver-qcask22_rsa.pem::https://www.$_ca.cz/sites/default/files/download/2025/qcask22_rsa.pem"							# CN=I.CA EU Qualified CA-SK/RSA 10/2022, expires 2032/10/10
	"$pkgname-$pkgver-2qca22_rsa.pem::https://www.$_ca.cz/sites/default/files/download/2025/2qca22_rsa.pem"								# CN=I.CA EU Qualified CA2/RSA 06/2022, expires 2032/06/17
	"$pkgname-$pkgver-pca22_rsa.pem::https://www.$_ca.cz/sites/default/files/download/2025/pca22_rsa.pem"								# CN=I.CA Public CA/RSA 06/2022, expires 2032/06/17
	"$pkgname-$pkgver-2tsaca22_rsa.pem::https://www.$_ca.cz/sites/default/files/download/2025/2tsaca22_rsa.pem"							# CN=I.CA TSA CA/RSA 06/2022, expires 2032/06/17

	# I.CA TLS Root CA/RSA 05/2022
	"$pkgname-$pkgver-rcatls22_rsa.pem::https://www.$_ca.cz/sites/default/files/download/2025/rcatls22_rsa.pem"							# CN=I.CA TLS Root CA/RSA 05/2022, expires 2047/05/03
	"$pkgname-$pkgver-qcw22_rsa.pem::https://www.$_ca.cz/sites/default/files/download/2025/qcw22_rsa.pem"								# CN=I.CA TLS EV CA/RSA 06/2022, expires 2032/06/19
	"$pkgname-$pkgver-sca22_rsa.pem::https://www.$_ca.cz/sites/default/files/download/2025/sca22_rsa.pem"								# CN=I.CA TLS DV/OV CA/RSA 06/2022, expires 2032/06/19

	# I.CA Root CA/ECC 12/2016
	"$pkgname-$pkgver-rca16_ecc.pem::https://www.$_ca.cz/sites/default/files/download/2025/rca16_ecc.pem"								# CN=I.CA Root CA/ECC 12/2016, expires 2041/12/07
	"$pkgname-$pkgver-2qca19_ecc.pem::https://www.$_ca.cz/sites/default/files/download/2025/2qca19_ecc.pem"								# CN=I.CA Qualified 2 CA/ECC 06/2019, expires 2029/06/16
	"$pkgname-$pkgver-pca16_ecc.pem::https://www.$_ca.cz/sites/default/files/download/2025/pca16_ecc.pem"								# CN=I.CA Public CA/ECC 12/2016, expires 2026/12/05

	# I.CA Root CA/RSA
	"$pkgname-$pkgver-rca15_rsa.pem::https://www.$_ca.cz/sites/default/files/download/2025/rca15_rsa.pem"								# CN=I.CA Root CA/RSA, expires 2040/05/27
	"$pkgname-$pkgver-2qca16_rsa.pem::https://www.$_ca.cz/sites/default/files/download/2025/2qca16_rsa.pem"								# CN=I.CA Qualified 2 CA/RSA 02/2016, expires 2026/02/08
	"$pkgname-$pkgver-qca15_rsa.pem::https://www.$_ca.cz/sites/default/files/download/2025/qca15_rsa.pem"								# CN=I.CA Qualified CA/RSA 07/2015, expired 2025/07/05, included for verifying past signatures
	"$pkgname-$pkgver-pca15_rsa.pem::https://www.$_ca.cz/sites/default/files/download/2025/pca15_rsa.pem"								# CN=I.CA Public CA/RSA 07/2015, expired 2025/07/05, included for verifying past signatures
	"$pkgname-$pkgver-tsaca22_rsa.pem::https://www.$_ca.cz/sites/default/files/download/2025/tsaca22_rsa.pem"							# CN=I.CA TSACA/RSA 03/2022, expires 2032/03/14
	"$pkgname-$pkgver-tsaca17_rsa.pem::https://www.$_ca.cz/sites/default/files/download/2025/tsaca17_rsa.pem"							# CN=I.CA TSACA/RSA 05/2017, expires 2027/05/02
	"$pkgname-$pkgver-qcw17_rsa.pem::https://www.$_ca.cz/sites/default/files/download/2025/qcw17_rsa.pem"								# CN=I.CA SSL EV CA/RSA 10/2017, expires 2027/10/24
	"$pkgname-$pkgver-sca15_rsa.pem::https://www.$_ca.cz/sites/default/files/download/2025/sca15_rsa.pem"								# CN=I.CA SSL CA/RSA 07/2015, expired 2025/07/05, included for verifying past signatures

	# I.CA - Qualified Certification Authority, 09/2009
	"$pkgname-$pkgver-qica_root_key_20090901.pem::https://www.$_ca.cz/sites/default/files/download/2025/qica_root_key_20090901.pem"		# CN=I.CA - Qualified Certification Authority, 09/2009, expired 2019/09/01, included for verifying past signatures

	# I.CA - Qualified root certificate (2008)
	"$pkgname-$pkgver-qica_root_20080311.pem::https://www.$_ca.cz/sites/default/files/download/2025/qica_root_20080311.pem"				# CN=I.CA - Qualified root certificate, expired 2018/04/01, included for verifying past signatures

	# I.CA - Qualified root certificate (2005)
	"$pkgname-$pkgver-rootcert_qican.pem::https://www.$_ca.cz/sites/default/files/download/2025/rootcert_qican.pem"						# CN=I.CA - Qualified root certificate, expired 2011/06/01, included for verifying past signatures

	# I.CA - Standard Certification Authority, 09/2009
	"$pkgname-$pkgver-sica_root_key_20090901_0.pem::https://www.$_ca.cz/sites/default/files/download/2025/sica_root_key_20090901_0.pem"	# CN=I.CA - Standard Certification Authority, 09/2009, expired 2019/09/01, included for verifying past signatures

	# I.CA - Standard root certificate (2008)
	"$pkgname-$pkgver-sica_root_20080311.pem::https://www.$_ca.cz/sites/default/files/download/2025/sica_root_20080311.pem"				# CN=I.CA - Standard root certificate, expired 2018/04/01, included for verifying past signatures

	# I.CA - Standard root certificate (2004)
	"$pkgname-$pkgver-rootcert_newsica.pem::https://www.$_ca.cz/sites/default/files/download/2025/rootcert_newsica.pem"					# CN=I.CA - Standard root certificate, expired 2010/03/01, included for verifying past signatures
)
b2sums=('a5232370d3dd3ffed123e7d84da789c99cd9e96b979c45b2121d3e318c78610a01617c22c0b9a1f3cf55d93465fc339c440c558a77292a1318331d93919921c1'
        'cf08b04f4c16aca67915d7048c31fed7657479b1111bb6c9d7f45d6535e26ad805b95c87d4dac94d0ffc7ec9971ae2049b2403d3df593283a5581a1bd741ce35'
        '943fceadebb3aff8f68a594e67a36266a528a6f8679c902528218dfe0742ffbc911f69b5141d8b8c22b4fe88cf4c8e224483067e36820948647a8d3087dd77c3'
        '6536dd4158e04ca72e9240cb297ac2be7d59cbdbe708361bb9a22513d13c165c5d820ea5593ea2fa5e6ca6d07837a1d8a3ce1a7b5353bb510818d5c098f53642'
        '643477e835979102487e77d43666f0b5d913a65a2c89179993f1190cad84659c2491d6260861f08823721a608d26486cfbff3771850e5cfac26bd4af6874d720'
        'ed6c8a44559964932e2e8b0b85bb2177df2ce36fde3a9fd4bd8e169636b5032ea16b664820ab0f78799d410257a445dcb1f3a5807a4112c366a3a7f3cc5d33fb'
        'ec06b51291f394ee08b20b4c08f088de1973fc905348452184ae5d29e3a26858d53125c20e678e304d926f6b535b3216db6884d5b2bc237bd37ba047f541e4ab'
        '7fa8d958192cad8cf2a4b4c9825888e12f1ade7d0fef477aceef2b56310d7b55bf153ac8cb7097dcd292cab13f3cc1092680acea751ac7e2b1009c971ca03f7e'
        'f4f5f59101e0bc0598117a1ea20ffa6730d8a8c83ea8347ae549e817427937a4532eba0b7407d1cea2c1d6a9681fedc58c370514c8a8335328958e54fbc07b58'
        'f68ab182add6a9930468e13d92a0ef35d419a36c2c43e4bbe62547ef17edbdc2bed84414abb91cdf826cc6faefb90e85168dc5ac3626d649c66a29802a75602d'
        '73711f368af1efc5fc6a541ef5915d9c1cd80c3aa5375cdaa07ff98dd8347f7896ce007e4039a19c020f0e1a2385200bed66e6dd979197a37214dce07c20722c'
        '09a6856b88e9d2fef7a4b95cfaf0509a24cbb236655e70d9789f55b729b393b1ddffdc12826cefabacba29997ab790dc9507eafef9404b64238938e8058ca2e4'
        '5af00ef9e877d3710e79a625354f6385159d384dada8b7e165154de787159e13255a7c3fff70a840df378f13379dc42c957b36d95d3b06af9ab63ff17a71d61a'
        '1fabb7dd92141b07267ba19a7c3f20dcdf4b035db4bbc9e59d8b017fbf591bcada66e7afaeb66d86bd03320061902d52c930fcf98aa6b22dea0a3ba25eb9314a'
        'fe088d789c14c3b27859b0750e4c2a919253a4eca4288797a10127d3a16e86e3b0f1c6a2c396e1ee9bf479c7f7c3a2c527152caa11d0ecad4ca443fe8122d062'
        '120c4e0409c6290326b10d259e0801ca683083e14839df1a8b32b75690a75c9fbf6e15e7cbbc588472b320533f33c9fb9e2a6dd58550c87f61e754ebc5c84e9f'
        '2d7c9520b319fe8ebc06c65b1ba4f5b5483a6cd0f3c949e11f2fbca58d45482e751f03868a34822def681c0192f3b021d7059565f36a4f283091f6db2fe4b89d'
        'a1a95ed8b717544eacbd66223eeb6033ed978f5abaaa5fdb5758ab08760dc493adcd3ad5d9a9814f3980b132f912e580651e2745015bfb25bf83c0c2de43bdee'
        '1048847d17e408a634d410b9ce971024d918656571cb702ad029ba0664b3b72fbe37aed24424bcb75cd9982d9c7a6ecbefeae533e61087c85e60f809c22bfd3a'
        '328a3144a132f8de87ec4cb678a9af8549a02e94c6f8d357c5a91e64ad7baad30e728964ec57c2f2a98a341ae603a54e60ae40ba06b843dea7a2bd1dbb527bfe'
        '100307b3e57258963956fe428185e28a2a93b894d3190252ec2af6355bcd12234729d901e483930a8aac2f1de008132075e53980cdd51a451d88fea686fdda1e'
        'fae479ccbe43f490ebe27ab5a38e4a3276e991fd258efdf406ff4ac68e71c2272aa8de08f3b81dcc4c68e06bb15b112c7c4c651e4f3778dd807d2d17b3105bfe'
        '52375a20b2d39cb666033287c361b17bc612854e8bfb4a105c28dd6489185908804b319f4b8ade38d89846ce6571a81a982a0454169953d31c3db96312771aee'
        '13f85d5318c208d71601f10cb58bae1af8e18ef03211d9035affe12bf2fc3cbbab29c57c241bd7f6db5e7c0288598527619fb2337b4b599281b06c36a147bca6'
        '5a5fb860b561ab2e94351ce7e291d331e02c909bef8b2a6d720439b6d1195b4c5a688d270b66b337e1c83966363b992cc9eea01702a80f4e54393ef98f5dde85'
        'ea6bef630b1d52ae86dfbd25708a316ffa3a2b993a5da66a7beb93a70c525203ea67283f75fc701ca9f599c3619e7f7877fc54d98ad567ad097cdf83b69ec0c8'
        '6b4f37dee5f73df25549d2a9dbbde86a9dfb71acada907c8d98342016c91674d39be0fe65f9b97b9b7539dab8faab6d82ea0558820060b6e97e5acce5da604bb'
        '307ca19a58222dec4f69441fcd9e3f0121f16724c1a3b7c5ced2b776398935ea0b75e0283fac8d0ab672730719afe3b95fc12a3bf5a2c3b4951c047766684a6c')

package() {
	cd "$srcdir/"

	# I.CA Root CA/ECC 05/2022
	install -Dm644 "$pkgname-$pkgver-rca22_ecc.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-rca22_ecc.pem"
	install -Dm644 "$pkgname-$pkgver-2qca22_ecc.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-2qca22_ecc.pem"
	install -Dm644 "$pkgname-$pkgver-pca22_ecc.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-pca22_ecc.pem"

	# I.CA Root CA/RSA 05/2022
	install -Dm644 "$pkgname-$pkgver-rca22_rsa.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-rca22_rsa.pem"
	install -Dm644 "$pkgname-$pkgver-qcask22_rsa.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-qcask22_rsa.pem"
	install -Dm644 "$pkgname-$pkgver-2qca22_rsa.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-2qca22_rsa.pem"
	install -Dm644 "$pkgname-$pkgver-pca22_rsa.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-pca22_rsa.pem"
	install -Dm644 "$pkgname-$pkgver-2tsaca22_rsa.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-2tsaca22_rsa.pem"

	# I.CA TLS Root CA/RSA 05/2022
	install -Dm644 "$pkgname-$pkgver-rcatls22_rsa.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-rcatls22_rsa.pem"
	install -Dm644 "$pkgname-$pkgver-qcw22_rsa.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-qcw22_rsa.pem"
	install -Dm644 "$pkgname-$pkgver-sca22_rsa.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-sca22_rsa.pem"

	# I.CA Root CA/ECC 12/2016
	install -Dm644 "$pkgname-$pkgver-rca16_ecc.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-rca16_ecc.pem"
	install -Dm644 "$pkgname-$pkgver-2qca19_ecc.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-2qca19_ecc.pem"
	install -Dm644 "$pkgname-$pkgver-pca16_ecc.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-pca16_ecc.pem"

	# I.CA Root CA/RSA
	install -Dm644 "$pkgname-$pkgver-rca15_rsa.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-rca15_rsa.pem"
	install -Dm644 "$pkgname-$pkgver-2qca16_rsa.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-2qca16_rsa.pem"
	install -Dm644 "$pkgname-$pkgver-qca15_rsa.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-qca15_rsa.pem"
	install -Dm644 "$pkgname-$pkgver-pca15_rsa.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-pca15_rsa.pem"
	install -Dm644 "$pkgname-$pkgver-tsaca22_rsa.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-tsaca22_rsa.pem"
	install -Dm644 "$pkgname-$pkgver-tsaca17_rsa.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-tsaca17_rsa.pem"
	install -Dm644 "$pkgname-$pkgver-qcw17_rsa.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-qcw17_rsa.pem"
	install -Dm644 "$pkgname-$pkgver-sca15_rsa.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-sca15_rsa.pem"

	# I.CA - Qualified Certification Authority, 09/2009
	install -Dm644 "$pkgname-$pkgver-qica_root_key_20090901.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-qica_root_key_20090901.pem"

	# I.CA - Qualified root certificate (2008)
	install -Dm644 "$pkgname-$pkgver-qica_root_20080311.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-qica_root_20080311.pem"

	# I.CA - Qualified root certificate (2005)
	install -Dm644 "$pkgname-$pkgver-rootcert_qican.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-rootcert_qican.pem"

	# I.CA - Standard Certification Authority, 09/2009
	install -Dm644 "$pkgname-$pkgver-sica_root_key_20090901_0.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-sica_root_key_20090901_0.pem"

	# I.CA - Standard root certificate (2008)
	install -Dm644 "$pkgname-$pkgver-sica_root_20080311.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-sica_root_20080311.pem"

	# I.CA - Standard root certificate (2004)
	install -Dm644 "$pkgname-$pkgver-rootcert_newsica.pem" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_ca-rootcert_newsica.pem"
}
