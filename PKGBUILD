# Maintainer: chn <g897331845@gmail.com>
# Contributor: AkinoKaede <autmaple@protonmail.com>
# Contributor: DuckSoft <realducksoft@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>

pkgname=xray-bin
pkgver=1.5.4
pkgrel=1
pkgdesc="The best v2ray-core, with XTLS support."
arch=(x86_64 i686 aarch64 armv5h armv6h armv7h mips64el mipsel mips64 mips ppc64el ppc64 riscv64 s390x)
url="https://github.com/XTLS/Xray-core"
license=('MPL2')
depends=('glibc' 'v2ray-domain-list-community' 'v2ray-geoip')
backup=('etc/xray/config.json')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
#validpgpkeys=()  # ?

sha512sums=(
  '2000211cbf987adaee7f278cc8cb23268965caab3bc46401f9324f2beaad95bec11012f5f4500f1016f4b75f097f3ac96cc5be2da7a6df0261582b3f23b3d78d'
  '9914fd3da02511b716951e521ca22006a6e8ad66e64d32cc7dd7dc3544a754174b37e35df6108ca217130f02763265d74f8bc56c4e52b262bdd48dcdb5310eb5'
  '532f66fe19196de0cc43df1812d6f32cbca7bbcacaa0cd4141bd80b3121b17eb8b23e0464765cf05a97b11e0213fb688eade83e393e36b3e7ebded6f0925de97'
  'b9bfe018e0b04e9269d4a779c50222dbf5653051533f78a511cdbd17bd9744715ea4f9127b30a6c74d8ffcbca1f22a271c53997758a3190f4dde6d17f313d8ac'
  '7c96cbea8d8e34d2458c3aeb31b03e9f322e3774193e0458f003f2336c7ff39b65a94840942f09b7c5e96287c74cdd8b7b96717e38ff230161ad887d34a86d8f'
  #''
)
b2sums=(
  '526946157d16bec475d727881194362370d70d06c316c4d9134872a5993f58023de649250dcfc90268c90eda526f5607947ab389e827a0cf81b99c01425887d2'
  '28d479130bac57fccf4a699df516c14737ecfde3f183fdd7c29f7c318b1b87cb0415f4ddba4ac947448df19e118bd9c9d1bd01e0b36b838268873c35dbe7115e'
  '3be47a2439dccfdcd6f0ee86a63e74c15731a70c9fe4ec801a009e62e54d4cae17adce723a704ed1effe81b367e51bbf1055cfeba82346f88a35f3f2dac08b32'
  'fd2c42bd5bd213060aaa31d946d7bc2c3bd2a00fd022cfab094da4c7e5f08e395f8fda2525c157081a7ef45c937f8712a6d1aad10d36c9b590ddd1d279b14b8b'
  '24486760e187641a49c84756b433a41643bb90aa24de2bd827dc039a3e25faabf109309082e8f6c9a2677ecc595c19446d4eef838cd5565a4b02ec022ade625f'
  #''
)
b3sums=(
  'b024e591aed189dbd7e8472cc431574fddbb26d2a5d345ebd7fef7a88a28016c'
  '40277afc77611025e5a508f2403105be2849d3b99b743bf357fe0ad79ca93c4d'
  '355f1d9de26e27996600762a5ea67fa59491245e2527a0780a3a83a8c78ada80'
  '84fb38b1876fe21c3553916a855ee63a8dfc16b72ac6d3e83edadc20a767f4ac'
  '58e7027bae7dfeeed9a87a5d69296bec2658b6f4807895afa6162cfe19067705'
  #''
)
_KERNEL="$(uname -s)"

case "${_KERNEL,}" in
  freebsd) case "${CARCH}" in
    x86_64)
      _CARCH="64"
      sha512sums+=('4c70dcab0022ffaed778b575d2efd7b9e3b48521aaf82d5259b838b940b50ab133a938a67070250a13cc839fbc2837d5aa4dbb75de51a75d04a58fb3471f789a')
      b2sums+=(    '65335aa2ab79413087042c22a024b802e5f909ce8d9a4153fcb61073ba1ea04ef77372a3c07bb4db3c30ca1f21c393674cd9a2d747ae13c5f6c31c785bc5a9b6')
      b3sums+=(    '84244b17921f7feb1b89a343585dec8c7be2846f288ef40041e1d8b687eb0781')
    ;;
    i*86)
      _CARCH="32"
      sha512sums+=('0bd00c813aa2eb37805b80f9c0cd92ca6d35c697dd766d91b4420bf72bcd3dbeaed2f455768a03b0832c5a44047a55edbd2b28a2740f26eb8ed59d5e93c0ae9b')
      b2sums+=(    '3ff6b494c8fbef8f1b7a71e45eafdc41f677f6ad12cb0ecb7641e336d371b018eff9a2c88e102862ebe88177b51109ad3ee3689c280ef46ea73719d082a36c20')
      b3sums+=(    '00001ee22f64ac542a9d34381dc2563c7e8b39f0b777a895292add7c2d4e5265')
    ;;
    aarch64)
      _CARCH="arm64-v8a"
      sha512sums+=('8029af7348ed8cb8d8c23b5959eb06609ae3aad89051ede87ce0153210779644785503f18597d7a3e77808749d9d1d8cf6159439ad7690dc85f4a2ef8c242a46')
      b2sums+=(    'cc49f3f1dda987aa44c57d2a931004c2f1493d272e90b66ad17feebb4aba028e8b7222ee3bc1dc57b576a7d2a4746824a237e82a1e0a61490fa870ca06661c9d')
      b3sums+=(    'b02a4adc2b31cc0f46952351de83213920b95cdcac7489c37711be5daf0ed49d')
    ;;
    armv7*)
      _CARCH="arm32-v7a"
      sha512sums+=('2634171ceb0e575f6922ca677c96961edfdc1fad19e6ae790ed98be4b8e5c026a5f8799679d76c8f4bc5ddbf835bb4e59ea104f89bc512b9be5d764e49014b54')
      b2sums+=(    '0dd270d5d035684d0b95fab1781e08e988a5cbfd395f3a4eaec0055cdc1cdef292f1be86724d61e641c229014e97ab30b7f16fe351d13aa67fe817b3e99f1bec')
      b3sums+=(    '168b9ac62ab24878eda5ec1c7531347ed767546a317718ae620e84a3c1e9e951')
    ;;
  esac;;
  linux) case "${CARCH}" in
    x86_64)
      _CARCH="64"
      sha512sums+=('914dfbe7d6e80378b5eaefba1e3305d2bee58ac3237d5c31a24536e68d53ec6316329802a1a61798024cf82b7f84681f585316c69627581050c749208ebb0546')
      b2sums+=(    '73b3d6b51414f8152fc76a4d0700692de155f8b0ad54d1ccae150a29c06e9084d459f0163cee70d299164611ddd5a053c6118f7c5214150ad3383c4d2722c655')
      b3sums+=(    '0d81c15472b3f3ab06cf0995bbb36bda704b023132ab4e18a47feef7262086e5')
    ;;
    i*86)
      _CARCH="32"
      sha512sums+=('b5f5e521f4555d854c01937e9e9ce3dc590c4fdb2c569893f9e444842b55b515189854355cde7b59903e90d7808abb4b60fb6708f96c6c1f06a02bc9e70784c1')
      b2sums+=(    '0cf41fd0d6168d23973cbafbe746536197160992ddc05122c7926ca65f984273bc826f9a82abcfca0de11cf09e12cebcd2b1ab7be9a4e0b81bd86c9cbc659ee7')
      b3sums+=(    '14983a1d338daf245d2510d453bbae37b988d913e95514533c6b0bdaafd5031b')
    ;;
    aarch64)
      _CARCH="arm64-v8a"
      sha512sums+=('ca48e6a997ef64a7563474fc97ff319c15eca1627fe37d63488da26203e01d1d5cd56e564c4ca749a14106fc7ab8b298416fc83101ce7ac4afc0307a353e9b8e')
      b2sums+=(    '9aa4e1d6af82712a3b2dd943c91b7c21379325c93421eaa49ff77730e59870524c56b2eb2afafcad6f5aa351cbac854d6b9bf804599ea6607e653acff524c4b8')
      b3sums+=(    'd0c93e13ada1451034cee9ce19a6102f1e564fb24cc1647f75b3006c564579e8')
    ;;
    armv5*)
      _CARCH="arm32-v5"
      sha512sums+=('36341cd3b2c19cbf830740e837b1229e7949e419ea3a43f39405f647ec5f4b140d278253edb3f4d7bd8113a5bd598fc19f3f269cc88e3be7ee067c1766935afc')
      b2sums+=(    'e3b1778d45afb915c8741f30a482bc8f0915eb53c2d1c35c270d965238d375ab0767cbe7dbebf5f45c316706670ff214882e9607526f2867cac61185379c7f86')
      b3sums+=(    '08289b71d3c4b58531cd361742e7e3dcfc672da134459fdfe616899f90c1f115')
    ;;
    armv6*)
      _CARCH="arm32-v6"
      sha512sums+=('084b74de62028df4648001a6900c8e90dd189ce6b8b90e781610864be40a4ca9f377e874c8cead1ec4cab55d49f48da068f074a89233e5d942f587f5a5458f9e')
      b2sums+=(    '0d9e9333173bb3215fc066ecd0240ea45e1e3dac4ba7e2765a29b88db4c9fea01d0461d6aecfa14cc9793f660daa867ba4b1104717a33a2cce80a885455feb9c')
      b3sums+=(    '2c264560b47859f40b43ff1c753bc8dc4ce7e3cd1c49ee4c6803c712d123e7fe')
    ;;
    armv7*)
      _CARCH="arm32-v7a"
      sha512sums+=('3fe7638d862a6be53d7cd7287d3522bb21fe557f30150a86f8f760b8e7dc61e4d173ff7e8a7020ff47539174b216ec60668b4ade25eb86abe886f651b5d30807')
      b2sums+=(    'f2923112de4e19705c25a60acf4c71fec1b77a3d53d0e0d262d5332d0865d1bcd2e19b16de4bddb6dd6dd97dfcc6fccd1cdf6680dc27ec1eb4a3e214240a3ddb')
      b3sums+=(    '46ab6365587b1ead62aca55ed4b3d3d3b98c3775e06902e46a6c58caa451f87e')
    ;;
    mips64el)
      _CARCH="mips64le"
      sha512sums+=('d38b7a8a0e5ab5381b7c2deb7d3ffbf1f726c8b20d074ea342d9195760131f2eeed5e6b9e4163c8f2bd5d32444b1618c619a17655cf31f561c0ab37c142f925f')
      b2sums+=(    'afc12e656b90981ddbb65ba98f4d49df607cc53d044e0edc296c6624d772b090ea7b2f5c74de381a74543640a46b97d7672799bdaf74d2b2c534156195a0af3b')
      b3sums+=(    '210b6f22a92a7e66190b2871a00211e1171421e1a251fc4b60be4171601ffc9c')
    ;;
    mipsel)
      _CARCH="mips32le"
      sha512sums+=('3b2768b2aae8d41884051bdaa7b9771b58d3a5a74a8a491b118b714a4eda62584889660741346c1157547839f74cda2772fb09226bbc20108713110a32e2e3a3')
      b2sums+=(    'f0c05f342920a653eb4a2b67f45421831a992995ddb818ed3f8399282b9ce1279eeb5c6d5ac9d2ed3caec24c70a912f8380ce365719adf762c4e3940c45ac5bb')
      b3sums+=(    'b3ee4d16733c31e7d7639e2401f35299461a9cc9c42029803d6bed2d5fa7c1b6')
    ;;
    mips64)
      _CARCH="mips64"
      sha512sums+=('5bf0fa3d5aa072cd5631242636316511783039a907d94fb6df22370075db25f9efdc6e697481c34a4ac2ab2e83ca98e45f70349d480c00c211356cafbb2e7193')
      b2sums+=(    'dfa46cce1446de932d593c8668d04d4c502cb26f97d8a020d10cb1e74db5221d2517403143f41c668050257c5bbc6786b0e01b38bbeb70f43372ea286c5be03a')
      b3sums+=(    '040ae4b8a635bdb41592c10f13270aea73b85d61b1814e145af1772f526ec359')
    ;;
    mips)
      _CARCH="mips32"
      sha512sums+=('35e3ba357348f92d7e3a0dac85dc9f3bd180a939a2e70b0977fb0d954b4caf949568f56fcbeedd0f75f9079fad92af919efd9f37fe3c97b10357791d548e366c')
      b2sums+=(    '467c9e3bde28ebccb88baf483ae359704d5daf271a46d4a28de863ea384a950820bec7c207dd008e93105e3d8206f2a6d037a0b1675ddc5a9ed3f88cd69f637f')
      b3sums+=(    'efb898c92309a203f3f507b3c307fb3c3e9049458ce995e11650a4f8d201eb10')
    ;;
    ppc64el)
      _CARCH="ppc64le"
      sha512sums+=('53c132a1c2b73b859f12f6fc61e7ae8ee7d2b4852c671cdaf4652a27c8b257e2793fc2070e74f032b29ca67fc4c152114eb47eaa2fa861cd8f7a67a0cc4bcebb')
      b2sums+=(    'cb5a568b17fc6d952d6958c6b8ce76eb7d3c5371ac28a46b4c59252300a377f6c0b0f48514bb22859401b642c8aaeaffa4017705a07f8c6bf2d763d10276a9b9')
      b3sums+=(    '4391e5bad718d1d4cede44442e255ce03c60968ad346c78f73ea3c8af2deea99')
    ;;
    ppc64)
      _CARCH="ppc64"
      sha512sums+=('609b7d5a60754c108026697aa20055fc3d7ff1baff252b7825386cf5d77916bd6f0ffcb54f369801a707bdd0cd8b7df9dfa95e83493206522958f8d37c4328fd')
      b2sums+=(    'b585c60a77013993ff1e9ea2cc34792f6cdb939feaf8605ca3d04a91fb64e467c70c46b7f6e737bbb6652329b9a0d108d5b5ba6b595eaf3579cc0969c9e1c54d')
      b3sums+=(    '707ab41d4c7ff473e6c4146214d680ca1217150d880b0a1b3e2b33fe5db9dfed')
    ;;
    riscv64)
      _CARCH="riscv64"
      sha512sums+=('82efa9164980d235fc59a6c76f7af9e617933f4d42cca987a153a912f0e5fd30564c6041f36580a0b353714b6208b1da3aa32c6ece8d8acdc6ecab660946ef2e')
      b2sums+=(    '0307ac7b318532ed3f98af9437b8e87a7f2ad9c8771006005feeb3b0ec1f03437da7ef3708d28b9b68495527e657d3ea130d5593d94e531cc9e23b7a6577ec92')
      b3sums+=(    'ac8b03852a10be6ce7d8afa8aaca89b5be70ee593651a0408405426ed685177e')
    ;;
    s390x)
      _CARCH="s390x"
      sha512sums+=('054db7d40a79e7ca6fa0813c1e1f5d25cba06f300b6e033d98e788b023b9dea1f56d31c066d68a4889d074c34b5c2779896e2db80f5f732cb158a3ca9af89475')
      b2sums+=(    'd1b7095601c169a274dab8e5e1aac84c0e301b338d24e12a43ba9012160fc2155d290e3a71bb9a08f1079d829b33b96d8389805539089e545d8ea13f4fdb482a')
      b3sums+=(    '61adfe16bef30727d7b9dbb6fd1096316c7708999fefad168d7f478ecf028f34')
    ;;
  esac;;
  openbsd) case "${CARCH}" in
    x86_64)
      _CARCH="64"
      sha512sums+=('08f79a4e979f171e6b5cb9ec8ea2492b7397d3de27dbc913e37e0227974a60dab4a60bc60097deb09fbf487a1c2e8ead627a81e33c583b21cd61386261c39f39')
      b2sums+=(    '8c75eb751e6ed2f809ed4407925d2a684384df12b6d6899de2bc877cb6ef3da11dfdcdc375bf83237ab6354fad11b225da4ed90e5075e028378b20fb80049f81')
      b3sums+=(    'b10cbc59bb151a16d0e36642a08c3ae1c02c0b96b61ba39a393f8d0fcab8a710')
    ;;
    i*86)
      _CARCH="32"
      sha512sums+=('e67f9b5e42e124960284304fe629b34bf60b2a6eb3e0b01e39bc60057bf907c7d43c80ce675ea14c0425f3429642698a00606fa75aaeb3f7b03bbd476cac8a6c')
      b2sums+=(    '53f0f6f36ea70a5b8476ee73087104c8b5b945a8bb90875bae88157e8afe73510d0269d93f82b30c9ac8826e6656f2257c2dd7d20102aa2fef4caa072238158d')
      b3sums+=(    'bc6a80868667a5781b6b9ec02052099fbc6204a656bb9c01d279ba8a15f43d6c')
    ;;
    aarch64)
      _CARCH="arm64-v8a"
      sha512sums+=('056f1179ce272f0f6a16a7191fb883352d818478606497a1e27f66308921d501d3570bf43f1053a3c50ea79c073f0a4fc67dec43d42f6eb024314da240a7c6ea')
      b2sums+=(    'de68d01b611327f05c8ce19b4fe3461d9836689fa6c07b17452e9811686714642f77c2950ce4e4cef9e73e57a72d1996078f79bfda5d42f5da2b636dc4bdeecf')
      b3sums+=(    'acba05b710180bb863fa9025d4e6c9b36f63f520a1f4bd1cf05fbfaf78c2e9cb')
    ;;
    armv7*)
      _CARCH="arm32-v7a"
      sha512sums+=('848d4d3fa665e5ed4c2c1e01d426efe4c6cc480450353f8f4a7e798183abc7962b3de5bb478ef664941f33a930ce40496002ea9e255a7a4ecd0a13c088ee1101')
      b2sums+=(    'd2b13b5e93e9a6149df0029cd593eb29c6c639af936e10ee7b7eb188a3f8068e2d1dfd27b64810188d2d52ddfeddd3202ebdd746c02a53a6c7c82b48b850981b')
      b3sums+=(    'c49f2d769863782c95f7e1236529b294b51dbabbf636bb196ba14291b2f69d46')
    ;;
  esac;;
esac
source=(
    "config.json"
    "vpoint_socks_vmess.json"
    "vpoint_vmess_freedom.json"
    "xray.service"
    "xray@.service"
    #"${pkgname}-${pkgver}-${_KERNEL,}-${_CARCH}.tar.gz.dgst::${url}/releases/download/v${pkgver}/Xray-${_KERNEL,}-${_CARCH}.zip.dgst"
    "${pkgname}-${pkgver}-${_KERNEL,}-${_CARCH}.tar.gz::${url}/releases/download/v${pkgver}/Xray-${_KERNEL,}-${_CARCH}.zip"
)

package() {
    cd "${srcdir}"
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/xray/LICENSE
    install -Dm644 xray.service "${pkgdir}"/usr/lib/systemd/system/xray.service
    install -Dm644 xray@.service "${pkgdir}"/usr/lib/systemd/system/xray@.service
    install -Dm644 *.json -t "${pkgdir}"/etc/xray/
    install -Dm755 xray -t "${pkgdir}"/usr/bin/
}

