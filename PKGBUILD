# Maintainer: killermoehre <killermoehre@gmx.net>

pkgname='ca-certificates-bundeswehr'
pkgver='20260915'
pkgrel='1'
pkgdesc='Bundeswehr Root Certificates'
arch=('any')
url='https://www.bundeswehr.de/de/organisation/ausruestung-baainbw/vergabe/public-key-infrastructure-der-bundeswehr-pkibw-'
license=('unknown')
depends=('ca-certificates-utils>=20181109-3')

# If `curl` is used without `--compressed`, the download is transport compressed with gzip which is *not* deterministic.
# /usr/bin/env for all our [lix](https://lix.systems/) friends
DLAGENTS=("https::/usr/bin/env curl --compressed -o %o %u")

source=(
    'https://www.bundeswehr.de/resource/blob/6066250/447c0f7e79752d0f293550742617ad62/bw-v-pki-ca-2026-3-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/6066248/0d47997a1698e367f95709b79b1bd027/bw-v-pki-ca-2026-2-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/6066246/0c5011018c28a9052373b8075cfd0ebc/bw-v-pki-ca-2026-1-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/5936722/36fc736b5f43bed485df00cb28a23009/bw-v-pki-ca-2025-3-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/5936720/63d8553e58c3ffca5afbc3ee647a5f24/bw-v-pki-ca-2025-2-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/5936718/4e610c66f06351c77398846f53a7218e/bw-v-pki-ca-2025-1-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/6037168/43b203c85e767c2a05f0c0473eda7e86/bw-v-pki-ca-2024-5-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/6037166/da9a5226a30516f03731312df9084a03/bw-v-pki-ca-2024-4-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/5744858/dc597a8c38f5d41cba0e19060276bf1a/bw-v-pki-ca-2024-3-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/5744860/443273a23479ec1664357a9be209e24e/bw-v-pki-ca-2024-2-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/5744856/50eb1364262fa27da2ee97c5454ff39c/bw-v-pki-ca-2024-1-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/5632876/0fe52053b996c5de1bc3c85f4224cddf/bw-v-pki-ca-2023-2-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/5632874/1a5e9e4466a7796f115f34c19ed493e2/bw-v-pki-ca-2023-1-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/5373488/44bcf002c217220955c6a2860b65a701/bw-v-pki-ca-2022-2-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/5373490/7e4bdfc37270e9adcd45f009b740bc95/bw-v-pki-ca-2022-1-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/5016834/650ed1072fd477447e2e4b4a8bf7fc99/bw-v-pki-ca-2021-2-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/5016832/7c33ed65cfa987418c760eb44ad7403c/bw-v-pki-ca-2021-1-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/229584/bb76125088dd27150675a135625ce373/bw-v-pki-ca-2020-2-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/229586/bd041db5f6449e50847d6a21a6c6cebf/bw-v-pki-ca-2020-1-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/138554/d019fa9c0126f261193b55c0098ad5b4/bw-v-pki-ca-2019-6-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/138522/f771fac6720cb51c4e75ee522ebda496/bw-v-pki-ca-2019-5-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/138518/a00ef761a911ea2934267cf154e743c6/bw-v-pki-ca-2019-4-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/138512/8b042da8f1833956d2bd6c18629cf9b1/bw-v-pki-ca-2019-3-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/138344/0c5fd5ff6f0677430a00d9d89b53b473/bw-v-pki-ca-2019-2-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/138276/69f7d88214c5a66ba3f3248877e566c1/bw-v-pki-ca-2019-1-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/138578/48dec407cccf2c0f29ecfc9f366838f9/bw-v-pki-ca-2018-6-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/138576/7bcf575f52bac63a6d96fff6fcb20f78/bw-v-pki-ca-2018-5-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/138574/efe4480838a948d9de2f042ddfbebaf2/bw-v-pki-ca-2018-4-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/138570/425ddb23c555aa4acf21b711a8de264a/bw-v-pki-ca-2018-3-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/138568/ce7dee21ddc36e4843c5b8c0902e0b3b/bw-v-pki-ca-2018-2-zip-data.zip'
    'https://www.bundeswehr.de/resource/blob/138560/93db0d0c2b2e81fd6d5d6ba28ff147cf/bw-v-pki-ca-2018-1-zip-data.zip'
)
b2sums=(
    '82de81fd19b21f2be80e0bc98eb3f4dd32f3af3a8a8a5cc4d75a992c81ee907da12de4c9186978fe23c6faaf2669a4ba40fba4f561a9aca70ed2afc459f44d41'
    '5851b4bae3b73a0ef08f059afedd83450c463268c20ff3b76e5b8d4c639ea2de6ba0c5d4a85a93da6537bfb08a2fb33a2f1e3e94c775cde2e93d90406852e601'
    '791eefb1cd5c0f6a938550fb259d2be176af808593dc968060e5eeb3e6a47562393956e5cf67a49daaa28419ea2b00340e9658f56b451922167597db467d99b3'
    '068bce170e31f05935047a9c91a7def5d5cdc6b18b339ba5c704a9e5ddcc06809b69d66f1ab4d5a00cbdd2a50d4db0429587ab44d20b3c03235f5e8a0561d003'
    'e8d60dc858517445a773706eac2a535f3ea59b83e6955993ba05e162859c2ca47df64ceeae88e00a98d9061ac8a4c3ec64636fbe3ecd1bbb7f5ddccd57611104'
    '8b8a3a63b9741a2de7f48b98912a1e48e60e01c65bd34028e9c7780bf227755e23d3fcd19a04069074b9091fe1518af4bc0d62e5401c423f218bdd203a8e2625'
    '4a8a9ac07f4c3fde515c3ea5763efa8a6b1fe0c2dea7a8e62f336dce39b2bbbab481923a748884b5e8b1f2c8aea3865738a980a925737e965e865d11c22f3d97'
    'c0f29901430221009bbfab5ac4fbba78a0ac4332510f65d78c1fcdccf2d59141bd6a6cb85a82815245a7173a38d84a627e820b259873d970d6388b311584a2b5'
    'fa839b6900e3bc78c1aaee7f591646cfe151f2af6ff239c3c5f94268073d670a0f1e496c2cafc5c6d7ac4b7df31b1d558549ffead2ec9e0676ef1acd241e2b54'
    '18c8bc42d6423f63f85687416cbfcd356507fe5241e7ae66bf592e34451b1c047be93722efd579c8e4f3500e91970f270eb1615740c0dad431c35ab6bbf21f09'
    '7efaf4a216a01d82d055ccfda7000d54e4677e7451434182459c755ec18b03c55ef62cdfb1286d2a3753c1783222daa36a673718e35ed173ac132233c51532bc'
    '3dfc2f16722d191591fafff1d44c062ad7bb6bf2a39ca64be7e564493409b89d685dd609fa27b45cf2f7723759ca1eee565ade0079a456e75ca9cc5d43e2176f'
    'ec9a46fed0eca8d00ffe69df0573772d076b68f7e4a04e20cb27f5d4dd45565de100c7294f92e940c567fe60824918552168aa6b6db4381d2eb607de4f24ac9d'
    '8103f3022c0495da64f866ec0f7b235a88ae613c02ef91963b237fa78f89298ceef7872666884d62b91252aede094385fffaf9adda923b993f9a3fd793cf32fd'
    'b4b30b8c91c4cf69f7fef4df25d03e58c6dca959f578dc98174fd8b632f8e497ee043feaac2db5f3d9d39833df0fc3f0deb3dc7ce9ce42fbbdbd05743f250db0'
    '12ce18722b7697748ab4431df3b7d7661571618c4cd037a1d4a31ce27c2e0f8bf09f7d6bfaf028624c10998ff88263256239d89e93a638ec64f40dde15089ce7'
    'ffeeb068ca950f6272f6f4ddc2b08a1f80855250b938a522ba78bd2a852b9870ce02efc6753784a41e60f519a1d73185c30f730f210845e335ff1559890621f8'
    '2d2e829b54f9694aa7ff39a0cb460d263b3467a19a99cd9f22f95d1186476a2f7c13863418c386962caf8a0928b5f613216685d98947b374591253e90913b606'
    '1bf22945cbd148d424c1a64aed077a6d3aafd99b2f8f620c037858017affcfa2e8d897dcf8770eb1e78ab50987ba779f7104f5d9237ed7c2dbe87afe4bf23490'
    'be104e6a8e07cb9137a28a1452c1c2a149e845b35570accc1551c6beb50ed9e4fe71790512fa6a367f7214e0162317aa2efd7ea5630088fc3355ba12b23f61bf'
    'eb393802a7d9be9530302f0b40797764449a16897952984635634a65c499e667b4afb74e3fb777a673cb9cfbcf384474bd83474976cd1655d7b5da346c9ae35b'
    '9f81063299dbbc13284119318c5d68f2b63aea21479f09ac9d23eb34134cd29bb1f25e273e28c38787b33d9d2caf40bf39b1cc891b4012fadf180bfc32397d37'
    'a36d823b093826986692340d5d2f011a93d1d6e5ff580fe2a6363f6633b3de10901be3ad847ceb50692217a91e6fd505407b13f101b35269145182cd715aa53d'
    '8b37ac2f45bd4db254c27d898ab67bc26014c88b2efb0880d544f10770d02496a926bc308ea303b0216c8ed13e15edd4c2ba3229ab20901e563fef4edf95e2b2'
    '14018709df5bb0c689fdc7115516c3db267f497fa7649220225f358498860f2e6dfb890a30f1c7b52f52f1a6d32fec019206d910a3b12ff64a346a44f2f62a5f'
    '86e1cba7bffda9b1e6cc7cfe7e5e90d6035ab8504071d4398690314a3414cfb94688f71549a14141e9f6f95abaf382bbbe838eeef01f9b94ae19e43fae97d246'
    '71c52f206aed96ee8f994597146fa7c5341e3b2b0e4cef1b37306ebd514ffb4f93332b37b878a11da5a7881abb64959cb78111a8d7eb0c6f09d25962bcfbf8ba'
    '6b2c0c40bf8ce7f02fe61c8ab73a2ece5b143c2fd5e7233e747284d95ddd1a8e2b75c4f7d1ffded61e5dd4bd2299004b3f1cac943ebcc272bd6d1eaf2731deca'
    '00e780ad6b81675024a4f5f92fcca93ddbf5095609066dc086cf4ddbe392f5f87677ebc1806534b5027265727aeedc660a0ecd46e4256a119657938d8ca4fe40'
    '1f0afd18f12235d1dfa563b47328a2ff88e43913099997fd06892e58d63cfdcb5aceda73cdbae4a830f89a96033613f4570d2fbe087f52bb7780f42c037cc96e'
    '68179dcdebf3770a08e0d4dc21dbcae3ef5b4d1a607e641a4e89d7c928cad150940cbb21ed7fb17d2750aec96b12a1adff2cf2d277b877a01a0200a2c3e9c405'
)

package() {
    local _certdir="${pkgdir}/usr/share/ca-certificates/trust-source/anchors"
    local -a _certs=()
    # only .cer required, as the .pem files in 2018/2019 are the same as the .cer
    mapfile -t _certs < <(find . -name '*.cer')
    install -d "$_certdir"
    install -t "$_certdir" -m644 "${_certs[@]}"
}
