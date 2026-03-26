# Maintainer: Your Name <your.email@example.com>

_pkgname=opencode-codebase-index
pkgname=opencode-codebase-index-bin
pkgver=0.5.2
pkgrel=1
pkgdesc='Semantic codebase indexing and search for OpenCode with an MCP server'
arch=('x86_64')
url='https://github.com/Helweg/opencode-codebase-index'
license=('MIT')
depends=('nodejs>=18' 'gcc-libs' 'glibc')
makedepends=('npm' 'jq')
provides=("opencode-codebase-index=$pkgver")
conflicts=('opencode-codebase-index')

source=(
  "$_pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz"
  "package-lock-v$pkgver.json::https://raw.githubusercontent.com/Helweg/opencode-codebase-index/v$pkgver/package-lock.json"
  'npm-hono-node-server-1.19.9.tgz::https://registry.npmjs.org/@hono/node-server/-/node-server-1.19.9.tgz'
  'npm-modelcontextprotocol-sdk-1.26.0.tgz::https://registry.npmjs.org/@modelcontextprotocol/sdk/-/sdk-1.26.0.tgz'
  'npm-ajv-8.18.0.tgz::https://registry.npmjs.org/ajv/-/ajv-8.18.0.tgz'
  'npm-json-schema-traverse-1.0.0.tgz::https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse-1.0.0.tgz'
  'npm-opencode-ai-plugin-1.1.21.tgz::https://registry.npmjs.org/@opencode-ai/plugin/-/plugin-1.1.21.tgz'
  'npm-zod-4.1.8.tgz::https://registry.npmjs.org/zod/-/zod-4.1.8.tgz'
  'npm-opencode-ai-sdk-1.1.21.tgz::https://registry.npmjs.org/@opencode-ai/sdk/-/sdk-1.1.21.tgz'
  'npm-accepts-2.0.0.tgz::https://registry.npmjs.org/accepts/-/accepts-2.0.0.tgz'
  'npm-ajv-formats-3.0.1.tgz::https://registry.npmjs.org/ajv-formats/-/ajv-formats-3.0.1.tgz'
  'npm-ajv-8.18.0.tgz::https://registry.npmjs.org/ajv/-/ajv-8.18.0.tgz'
  'npm-json-schema-traverse-1.0.0.tgz::https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse-1.0.0.tgz'
  'npm-body-parser-2.2.2.tgz::https://registry.npmjs.org/body-parser/-/body-parser-2.2.2.tgz'
  'npm-bytes-3.1.2.tgz::https://registry.npmjs.org/bytes/-/bytes-3.1.2.tgz'
  'npm-call-bind-apply-helpers-1.0.2.tgz::https://registry.npmjs.org/call-bind-apply-helpers/-/call-bind-apply-helpers-1.0.2.tgz'
  'npm-call-bound-1.0.4.tgz::https://registry.npmjs.org/call-bound/-/call-bound-1.0.4.tgz'
  'npm-content-disposition-1.0.1.tgz::https://registry.npmjs.org/content-disposition/-/content-disposition-1.0.1.tgz'
  'npm-content-type-1.0.5.tgz::https://registry.npmjs.org/content-type/-/content-type-1.0.5.tgz'
  'npm-cookie-0.7.2.tgz::https://registry.npmjs.org/cookie/-/cookie-0.7.2.tgz'
  'npm-cookie-signature-1.2.2.tgz::https://registry.npmjs.org/cookie-signature/-/cookie-signature-1.2.2.tgz'
  'npm-cors-2.8.6.tgz::https://registry.npmjs.org/cors/-/cors-2.8.6.tgz'
  'npm-cross-spawn-7.0.6.tgz::https://registry.npmjs.org/cross-spawn/-/cross-spawn-7.0.6.tgz'
  'npm-debug-4.4.3.tgz::https://registry.npmjs.org/debug/-/debug-4.4.3.tgz'
  'npm-depd-2.0.0.tgz::https://registry.npmjs.org/depd/-/depd-2.0.0.tgz'
  'npm-dunder-proto-1.0.1.tgz::https://registry.npmjs.org/dunder-proto/-/dunder-proto-1.0.1.tgz'
  'npm-ee-first-1.1.1.tgz::https://registry.npmjs.org/ee-first/-/ee-first-1.1.1.tgz'
  'npm-encodeurl-2.0.0.tgz::https://registry.npmjs.org/encodeurl/-/encodeurl-2.0.0.tgz'
  'npm-es-define-property-1.0.1.tgz::https://registry.npmjs.org/es-define-property/-/es-define-property-1.0.1.tgz'
  'npm-es-errors-1.3.0.tgz::https://registry.npmjs.org/es-errors/-/es-errors-1.3.0.tgz'
  'npm-es-object-atoms-1.1.1.tgz::https://registry.npmjs.org/es-object-atoms/-/es-object-atoms-1.1.1.tgz'
  'npm-escape-html-1.0.3.tgz::https://registry.npmjs.org/escape-html/-/escape-html-1.0.3.tgz'
  'npm-etag-1.8.1.tgz::https://registry.npmjs.org/etag/-/etag-1.8.1.tgz'
  'npm-eventemitter3-5.0.1.tgz::https://registry.npmjs.org/eventemitter3/-/eventemitter3-5.0.1.tgz'
  'npm-eventsource-3.0.7.tgz::https://registry.npmjs.org/eventsource/-/eventsource-3.0.7.tgz'
  'npm-eventsource-parser-3.0.6.tgz::https://registry.npmjs.org/eventsource-parser/-/eventsource-parser-3.0.6.tgz'
  'npm-express-5.2.1.tgz::https://registry.npmjs.org/express/-/express-5.2.1.tgz'
  'npm-express-rate-limit-8.2.1.tgz::https://registry.npmjs.org/express-rate-limit/-/express-rate-limit-8.2.1.tgz'
  'npm-fast-deep-equal-3.1.3.tgz::https://registry.npmjs.org/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz'
  'npm-fast-uri-3.1.0.tgz::https://registry.npmjs.org/fast-uri/-/fast-uri-3.1.0.tgz'
  'npm-finalhandler-2.1.1.tgz::https://registry.npmjs.org/finalhandler/-/finalhandler-2.1.1.tgz'
  'npm-forwarded-0.2.0.tgz::https://registry.npmjs.org/forwarded/-/forwarded-0.2.0.tgz'
  'npm-fresh-2.0.0.tgz::https://registry.npmjs.org/fresh/-/fresh-2.0.0.tgz'
  'npm-function-bind-1.1.2.tgz::https://registry.npmjs.org/function-bind/-/function-bind-1.1.2.tgz'
  'npm-get-intrinsic-1.3.0.tgz::https://registry.npmjs.org/get-intrinsic/-/get-intrinsic-1.3.0.tgz'
  'npm-get-proto-1.0.1.tgz::https://registry.npmjs.org/get-proto/-/get-proto-1.0.1.tgz'
  'npm-gopd-1.2.0.tgz::https://registry.npmjs.org/gopd/-/gopd-1.2.0.tgz'
  'npm-has-symbols-1.1.0.tgz::https://registry.npmjs.org/has-symbols/-/has-symbols-1.1.0.tgz'
  'npm-hasown-2.0.2.tgz::https://registry.npmjs.org/hasown/-/hasown-2.0.2.tgz'
  'npm-hono-4.12.1.tgz::https://registry.npmjs.org/hono/-/hono-4.12.1.tgz'
  'npm-http-errors-2.0.1.tgz::https://registry.npmjs.org/http-errors/-/http-errors-2.0.1.tgz'
  'npm-iconv-lite-0.7.2.tgz::https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.7.2.tgz'
  'npm-inherits-2.0.4.tgz::https://registry.npmjs.org/inherits/-/inherits-2.0.4.tgz'
  'npm-ip-address-10.0.1.tgz::https://registry.npmjs.org/ip-address/-/ip-address-10.0.1.tgz'
  'npm-ipaddr.js-1.9.1.tgz::https://registry.npmjs.org/ipaddr.js/-/ipaddr.js-1.9.1.tgz'
  'npm-is-promise-4.0.0.tgz::https://registry.npmjs.org/is-promise/-/is-promise-4.0.0.tgz'
  'npm-isexe-2.0.0.tgz::https://registry.npmjs.org/isexe/-/isexe-2.0.0.tgz'
  'npm-jose-6.1.3.tgz::https://registry.npmjs.org/jose/-/jose-6.1.3.tgz'
  'npm-json-schema-typed-8.0.2.tgz::https://registry.npmjs.org/json-schema-typed/-/json-schema-typed-8.0.2.tgz'
  'npm-math-intrinsics-1.1.0.tgz::https://registry.npmjs.org/math-intrinsics/-/math-intrinsics-1.1.0.tgz'
  'npm-media-typer-1.1.0.tgz::https://registry.npmjs.org/media-typer/-/media-typer-1.1.0.tgz'
  'npm-merge-descriptors-2.0.0.tgz::https://registry.npmjs.org/merge-descriptors/-/merge-descriptors-2.0.0.tgz'
  'npm-mime-db-1.54.0.tgz::https://registry.npmjs.org/mime-db/-/mime-db-1.54.0.tgz'
  'npm-mime-types-3.0.2.tgz::https://registry.npmjs.org/mime-types/-/mime-types-3.0.2.tgz'
  'npm-ms-2.1.3.tgz::https://registry.npmjs.org/ms/-/ms-2.1.3.tgz'
  'npm-negotiator-1.0.0.tgz::https://registry.npmjs.org/negotiator/-/negotiator-1.0.0.tgz'
  'npm-object-assign-4.1.1.tgz::https://registry.npmjs.org/object-assign/-/object-assign-4.1.1.tgz'
  'npm-object-inspect-1.13.4.tgz::https://registry.npmjs.org/object-inspect/-/object-inspect-1.13.4.tgz'
  'npm-on-finished-2.4.1.tgz::https://registry.npmjs.org/on-finished/-/on-finished-2.4.1.tgz'
  'npm-once-1.4.0.tgz::https://registry.npmjs.org/once/-/once-1.4.0.tgz'
  'npm-p-queue-9.1.0.tgz::https://registry.npmjs.org/p-queue/-/p-queue-9.1.0.tgz'
  'npm-p-timeout-7.0.1.tgz::https://registry.npmjs.org/p-timeout/-/p-timeout-7.0.1.tgz'
  'npm-parseurl-1.3.3.tgz::https://registry.npmjs.org/parseurl/-/parseurl-1.3.3.tgz'
  'npm-path-key-3.1.1.tgz::https://registry.npmjs.org/path-key/-/path-key-3.1.1.tgz'
  'npm-path-to-regexp-8.3.0.tgz::https://registry.npmjs.org/path-to-regexp/-/path-to-regexp-8.3.0.tgz'
  'npm-pkce-challenge-5.0.1.tgz::https://registry.npmjs.org/pkce-challenge/-/pkce-challenge-5.0.1.tgz'
  'npm-proxy-addr-2.0.7.tgz::https://registry.npmjs.org/proxy-addr/-/proxy-addr-2.0.7.tgz'
  'npm-qs-6.15.0.tgz::https://registry.npmjs.org/qs/-/qs-6.15.0.tgz'
  'npm-range-parser-1.2.1.tgz::https://registry.npmjs.org/range-parser/-/range-parser-1.2.1.tgz'
  'npm-raw-body-3.0.2.tgz::https://registry.npmjs.org/raw-body/-/raw-body-3.0.2.tgz'
  'npm-require-from-string-2.0.2.tgz::https://registry.npmjs.org/require-from-string/-/require-from-string-2.0.2.tgz'
  'npm-router-2.2.0.tgz::https://registry.npmjs.org/router/-/router-2.2.0.tgz'
  'npm-safer-buffer-2.1.2.tgz::https://registry.npmjs.org/safer-buffer/-/safer-buffer-2.1.2.tgz'
  'npm-send-1.2.1.tgz::https://registry.npmjs.org/send/-/send-1.2.1.tgz'
  'npm-serve-static-2.2.1.tgz::https://registry.npmjs.org/serve-static/-/serve-static-2.2.1.tgz'
  'npm-setprototypeof-1.2.0.tgz::https://registry.npmjs.org/setprototypeof/-/setprototypeof-1.2.0.tgz'
  'npm-shebang-command-2.0.0.tgz::https://registry.npmjs.org/shebang-command/-/shebang-command-2.0.0.tgz'
  'npm-shebang-regex-3.0.0.tgz::https://registry.npmjs.org/shebang-regex/-/shebang-regex-3.0.0.tgz'
  'npm-side-channel-1.1.0.tgz::https://registry.npmjs.org/side-channel/-/side-channel-1.1.0.tgz'
  'npm-side-channel-list-1.0.0.tgz::https://registry.npmjs.org/side-channel-list/-/side-channel-list-1.0.0.tgz'
  'npm-side-channel-map-1.0.1.tgz::https://registry.npmjs.org/side-channel-map/-/side-channel-map-1.0.1.tgz'
  'npm-side-channel-weakmap-1.0.2.tgz::https://registry.npmjs.org/side-channel-weakmap/-/side-channel-weakmap-1.0.2.tgz'
  'npm-statuses-2.0.2.tgz::https://registry.npmjs.org/statuses/-/statuses-2.0.2.tgz'
  'npm-toidentifier-1.0.1.tgz::https://registry.npmjs.org/toidentifier/-/toidentifier-1.0.1.tgz'
  'npm-type-is-2.0.1.tgz::https://registry.npmjs.org/type-is/-/type-is-2.0.1.tgz'
  'npm-unpipe-1.0.0.tgz::https://registry.npmjs.org/unpipe/-/unpipe-1.0.0.tgz'
  'npm-vary-1.1.2.tgz::https://registry.npmjs.org/vary/-/vary-1.1.2.tgz'
  'npm-which-2.0.2.tgz::https://registry.npmjs.org/which/-/which-2.0.2.tgz'
  'npm-wrappy-1.0.2.tgz::https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz'
  'npm-zod-3.25.76.tgz::https://registry.npmjs.org/zod/-/zod-3.25.76.tgz'
  'npm-zod-to-json-schema-3.25.1.tgz::https://registry.npmjs.org/zod-to-json-schema/-/zod-to-json-schema-3.25.1.tgz'
)

noextract=("${source[@]%%::*}")

sha256sums=('c1a915b43c2abf551c3d87978e72917b86db43cb35d1f1b8ddde4e1607b00ac9'
            '2d9f0e7a9a87e80103d22d878acd6b36e8028dcd41fefdb2a48f5ed9f2c29158'
            'a6c2c236d9a9a0191b4ec19f06b7cf20bc0578bbe6422ffd7eeebc92d1d136e9'
            'd932597ad68dabf54fc3899cb5afb74939443e36af65d50ea709c9bd0ea1e9a8'
            '522a6e330be5f537ca152618413b34e857ee8ff9e3f6a8ae17a2bffe788c9cc0'
            '023222622df29fc274bde5d3590e47aa1d4a8e3c1d6e2aba029948ed79799b21'
            '9ee15ffc9a4dc3af76999912351e98126d2c852854b4b970418cbae2b5ec4114'
            '193e3a33dc66d679d522c40e6a5138788646d3c6a5039d0c5c2b3bede83b6635'
            'e388e075b0f024421a03b1bb3bd1b975f9aa84894071e9ebf8a3eb4e5c38c126'
            '173d915f7d88df8cd4db2129a030c3b1c9cafd3b7aee5b89465bf3ad18372542'
            'f4d6980fd367381fd29199066911e863db8d97496613b6c2c5b91563a150acc5'
            '522a6e330be5f537ca152618413b34e857ee8ff9e3f6a8ae17a2bffe788c9cc0'
            '023222622df29fc274bde5d3590e47aa1d4a8e3c1d6e2aba029948ed79799b21'
            'c28d97347e805dacc05973a20ab0052b8c25cf2468f1a6da4ac03141da73a30b'
            '835e37ad5a40da45eaed6e32d99847627a15b2a4671741182521fe48dee3c581'
            '073e9ff9dbabedf5c128020a677381e9f92c90188d118830b30a7656a7c37d2c'
            '32086f492fedf1b9b34811f2ee50ca2cca53da5c783f7cd5f939d3f1e86bbd32'
            'ddd2e9efc936c376fe08d95a55fcb379c1f42dcc3dcd7a1f6ff34bdc3f782a19'
            'ac31d098405f0242dd712218f38a14a6202bd4eb01067db05db765d9a9bd12c8'
            '76b160f8251c630a116a2e0acf03557b0758975b2c0df800607248fc9aae9e20'
            '4d2bbaaf1c299e60ef0d7df952b52af95b20d56cbcbd4468d4210650083553d3'
            '32242124397140800e1238a252b4cd74669d58c81b655d9d3721789b56c1c1ff'
            '188c320cdc413adfec03098fda72af7a9b02152ba13d3a8f87f172d93ced38ea'
            '89c1ac9c946ee8905a875837114528e97eeae35e03be3190584b2216af43e4a7'
            '28a58a2056093441f1d00d677d95918d2e4b3e98bac86237159101cae315d4a7'
            'ed1342228c82c10df9921c59d684df516a0cd6ed25b61e5f9d6330895326cfdb'
            '5148e8eb7e222b2a09127618bbdb5033daf6262cfc735d3101ea98620128b99c'
            '9b2e418b8851b8f9e7a13d5ada3bd4d3c5ef042885867261f556347d4bbefb29'
            '5986b8b13121340a8b0d5c7d8f0f961aa80ef3a74515ca9cb7a78d86ed0385f7'
            'd14dd1c35b4bd3b8aca3219fd3627eb7f3eb49cf6b4c8a7ca58b91fd7a190993'
            '3e18e4d757818aee7bf1921686c6c3e7f9676d17c5c6fec560567c6beee579ce'
            'a101155c3cbdfb1e4f98f2f83c8b5e392db6accfa606df0eba8b87a5762b0366'
            'f6a96c78a973d2ab660c9efeee6aa74a399cd9e770625ba1ed95e1aca9fd0faf'
            '3188d3a05772c99cf0ccf44f6cd8530bcbaf02ce0addcc47c33f26daff0f952c'
            '7c62d4bb196e59b39c5af79e550d6fe4261649a74d9f5e605b071e1da6081c92'
            '445c647d0fe2228184a66b2bfbcea173aa758ebb606fb2f079ce9b328c9537e9'
            '1773a16c02b4422653479b9c4d211268f7022bdac0d817b5698535bb485dd005'
            '03a5c127d279bb56d8877d029f19b892ef61c0699520feeab1c3fb03f91a742c'
            'b019a0980f27638dc3f85836b0e478f188e00d7a6e5852c0819fa86f56e47b8f'
            '3ad33c6b4bd8cc1d5f867b7453cc783a96ffc89101a9ad3a8bcfe7905a83581d'
            '22949bfc51a620b3598bbe67d65619a9efd781d52704a38d7ba675e248a8b872'
            '9b5a5de95fb85fcb58db5e4fcd94ce8ab9f0476d02202e20a5225cec60431c99'
            'ad08397ab05f62b2b507682e23aad699cf8cc33922e0030be0cb640a23277ad7'
            '704402651b02a1454f17d445fc7dd716efc282d059407126d58ef30a47e807aa'
            '662e27e54e00fe46fbb08f9f4aacb054e3695dbe72cc14b436613fbcfb780544'
            'eb2cc52afb1f1fd82c5fc2a58c2380f0f16fdcdb5631538f3c66887435d70681'
            'd536d0de4dd285dc1468fbb7f39334a47ee0eec9c27f9b626a6e71466c9fda82'
            '4460c7532f28b8df2ddc9a1ec17816d43c24d4b9591dc6c5936b82f7f86ae7c5'
            '50cdc4d2cd11ae04b6ee29f328d09022244962e5dfab303c8fc223ff8dfa807d'
            'cb50d2cad8cb407b4db0ea9b84b63cca9dee44aaca07c7ab98f310b0d7ae8fcf'
            'ad62bbb11baf079699a3f269ed089efdb589be16083ceed94a1117801e1a6c61'
            '61d46769e71f9235ae4d2f5652e5742e3beb83fb096a9d84247103624e8da03e'
            'd94dbc6c1bb3c5ac0fb12a73ade187108fc60de273a1b754f55044eb5e24afaf'
            'd982f74562cf75298360feb59bdc49f81ce8a897599adbb16c301a01bffa286c'
            '7441d9623f67fe4160eccfd82ae9a404dcd55e1e4f1b68e06e2374dade4e8fee'
            '853891173876fa03b8762cf63e7f0c0d60e524947f4e4d5852d94c22acb445a7'
            '47cfe872e088e28c53b736fef305324b57cc1cfc9f72a9b0f769f92731cb8359'
            '52a8cf8404d8be32ce804bca1c5b0823861cf9c4e3df1324dd9b170b56e047e0'
            'e7dc4126e4fcf4c3073b3f7e99531eadc8633f7837b20ec97359a8d7add06bc9'
            'b8c2c35575493dc086df88cfc468a9e2651b6617336480ab3f00fcf853f443a7'
            'b5dc531e1d1efc92cfb659be11e74e7e697caef935c233e05016a7b2997c19be'
            'ae88322a5fc71952d3990ae999a7afc7a4bf7cba086b9ccc1c9482432b101dce'
            '2b21054e65d0eabd58c5002d2713e968dd47b15700bfed4b7281a344ded1c420'
            '2f9dd28353c303ff8750fbf68e474755b01c54a989883d227d605f7bfa3dd2ac'
            'f6616e15e530ed552f9daa2d3ce71963947c6bc7c98c9b64fd3e673fd02622c6'
            'b5a2dfee1dc0ac52c623cd5c0304be5a8a41cfad40e09f1a13606972cb2dbc04'
            '782d726a263ba7b26cced612af97b80035516df4b0cd788524e7b2cebc4e29ed'
            '8324967a3afd8a45b0401e3554aebc1843f493bec46a89a7ce8cf072e62e90bf'
            'f64d42f1049c386cdac5204737e09564271639b2b7d203a3ea07ec07d5ddbd0a'
            'cf51460ba370c698f68b976e514d113497339ba018b6003e8e8eb569c6fccfcf'
            '651ee0909da8e8988c3d83c3c6df9e39852990f9f55fb7df588068354b0d17be'
            '0a39ef5e2e147e571a668c47a1e8b33961ae6764379ce65bc523e6bc80b13c02'
            '56ef4bfa11e097ce8196b26fa04b42d6091c32498fcab4478e6dd298435f021a'
            '4b8999acb914830edcd3c5b8fec632b32c6bc759ac3edc86336f5a9e08ba7b92'
            '80ca8c4a6c57c1b6e19ec238b69b6fa75a43aa412fcc0cc7dc56faf0001dfa45'
            'd1fcbbae5bc05562d13de7c520c2951699e8262a8317fa6c8bbcd8dcff3bea70'
            'a0d1b6f34f6d4e733429ba95f7adb7833c8ceab916ba574a93f8a8476bee46d9'
            '6c4f1565a52098c5ae7b45d7bb7441778452fdaacb6a0a92ab97c116b832d5bf'
            '905266e2662590b009e38dc096d4e4e103aafda9cb67e658ca985b2d0ad2f926'
            '66de2a025036de58bbe50ab1d42a24ec6d33eda338b8115a3ebf942dae8419db'
            'cb694a4965908f7775a0c757f00cf4e624d193cd71d77988fbcca0f597b88d82'
            'b144af37b39a9517f7a89f1d867e9c2cf29f13f4147d3e80c499fe6ffab69461'
            '78812f65ae3b98071ce1c9bacbe0666f4220d0b2753c2a11530eb27df440a3b3'
            'fa254fb316dd23ddcb2beebd533b23788aec4cf6a3dba58af34150170435c472'
            '36d4f72bb59372eb18202fee25ff3d8bf46655f0121830fbe32e32cbdc625f43'
            'c83bcc6ea632567e3f6928a83a1c0c7073519aaca9b88b847a3b404417eadfe2'
            '9acba5bd18a51e9cdf5898380e4df63f803e1844def64ae1a46f88cff86d556e'
            'fedbabaa6db26c6be0183f82777dfa852d59a62f8885de93bd32ebc28758958f'
            '8493e77b990b242efebd824d0912df161bf640fc75071d5bc844ce0d7706a485'
            '58074eb0c2ebc8aca9945cdbe405dbed0b43106ae5265879b7049424b27d1ccd'
            '3b256b6421300bcc962d891b1588fd4b64e84e339b9c29f78c61b72f2a7116d6'
            '3b2a54f0c5e7ad898c8f0ffda2a6805fb2cc5d68f53addf0b4a9ec0db9d0d06e'
            'ca800a24710488b568f4e73e8f570dd6b911c122cbf42b06930dee7c25949fe0'
            '186fcc77488de327daf911d362d4e773bab9909f1df2a5f0c20b875205b92e08'
            '18bf29ba4ea8a544df6f4645284f26f4200480f5bdadfa46aa1526da784975dd'
            '2dfb5e06d1d4bf1fe9f0fa7f633c4a2fde04d8b41cf0b9bd249a42561d5edfb6'
            '7378860671377a35e7a443ecfdca0745cfd066f595c90d581b827defea246e71'
            'a13adf5fddeb769655edce551e81fbb11904b9c9be76d95e41da8c4c499d4edc'
            'aff3730d91b7b1e143822956d14608f563163cf11b9d0ae602df1fe1e430fdfb'
            '9e1f1a05f0dd0c1dab64ee91ceb9bf55cd44d35368c70edda80a2fdc70a88377'
            '765275304b344f7773309e7e8d975eff73335c8cc981c1b06ec5b0ccf87786d2')

prepare() {
  rm -rf "$srcdir/$_pkgname-$pkgver"
  rm -f "$srcdir/runtime-closure.tsv"
  mkdir -p "$srcdir/$_pkgname-$pkgver"

  bsdtar -xpf "$srcdir/$_pkgname-$pkgver.tgz" \
    -C "$srcdir/$_pkgname-$pkgver" \
    --no-same-owner \
    --no-same-permissions \
    --strip-components=1

  jq '
    .dependencies = {
      "@modelcontextprotocol/sdk": "1.26.0",
      "@opencode-ai/plugin": "1.1.21",
      "p-queue": "9.1.0",
      "zod": "3.25.76"
    }
    | del(.peerDependencies, .peerDependenciesMeta)
  ' "$srcdir/$_pkgname-$pkgver/package.json" > "$srcdir/$_pkgname-$pkgver/package.json.tmp"

  mv "$srcdir/$_pkgname-$pkgver/package.json.tmp" \
    "$srcdir/$_pkgname-$pkgver/package.json"
  chmod 644 "$srcdir/$_pkgname-$pkgver/package.json"

  python - <<PY
import json
from collections import deque

lock_path = "$srcdir/package-lock-v$pkgver.json"
out_path = "$srcdir/runtime-closure.tsv"
roots = [
    "node_modules/p-queue",
    "node_modules/@modelcontextprotocol/sdk",
    "node_modules/@opencode-ai/plugin",
    "node_modules/zod",
]

with open(lock_path, "r", encoding="utf-8") as fh:
    lock = json.load(fh)

pkgs = lock["packages"]
all_paths = set(pkgs)


def resolve_dep(from_path, dep_name):
    parts = from_path.split("/") if from_path else []
    while True:
        prefix = "/".join(parts)
        candidate = (prefix + "/" if prefix else "") + "node_modules/" + dep_name
        if candidate in all_paths:
            return candidate
        if not parts:
            return None
        parts = parts[:-1]


def alias(path, version):
    name = path.rsplit("node_modules/", 1)[-1].replace("/node_modules/", "/")
    return f"npm-{name.replace('@', '').replace('/', '-')}-{version}.tgz"


seen = set()
queue = deque(roots)

while queue:
    path = queue.popleft()
    if path in seen or path not in pkgs:
        continue
    seen.add(path)
    pkg = pkgs[path]
    for field in ("dependencies", "optionalDependencies"):
        for dep_name in (pkg.get(field) or {}):
            resolved = resolve_dep(path, dep_name)
            if resolved:
                queue.append(resolved)

with open(out_path, "w", encoding="utf-8") as fh:
    for path in sorted(seen):
        pkg = pkgs[path]
        fh.write(f"{path}\t{alias(path, pkg['version'])}\n")
PY
}

package() {
  install -dm755 "$pkgdir/usr/lib/node_modules"
  cp -a "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/lib/node_modules/$_pkgname"

  while IFS=$'\t' read -r _pkgpath _tarball; do
    _dest="$pkgdir/usr/lib/node_modules/$_pkgname/$_pkgpath"
    mkdir -p "$_dest"
    bsdtar -xpf "$srcdir/$_tarball" \
      -C "$_dest" \
      --no-same-owner \
      --no-same-permissions \
      --strip-components=1
  done < "$srcdir/runtime-closure.tsv"

  ln -sf tool.js \
    "$pkgdir/usr/lib/node_modules/$_pkgname/node_modules/@opencode-ai/plugin/dist/tool"

  find "$pkgdir/usr/lib/node_modules/$_pkgname" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/lib/node_modules/$_pkgname" -type f -exec chmod 644 {} +
  find "$pkgdir/usr/lib/node_modules/$_pkgname" -name '*.node' -exec chmod 755 {} +

  install -dm755 "$pkgdir/usr/bin"
  ln -s "../lib/node_modules/$_pkgname/dist/cli.js" \
    "$pkgdir/usr/bin/opencode-codebase-index-mcp"
  chmod 755 "$pkgdir/usr/lib/node_modules/$_pkgname/dist/cli.js"

  rm -f "$pkgdir/usr/lib/node_modules/$_pkgname/native/codebase-index-native.darwin-arm64.node"
  rm -f "$pkgdir/usr/lib/node_modules/$_pkgname/native/codebase-index-native.darwin-x64.node"
  rm -f "$pkgdir/usr/lib/node_modules/$_pkgname/native/codebase-index-native.linux-arm64-gnu.node"
  rm -f "$pkgdir/usr/lib/node_modules/$_pkgname/native/codebase-index-native.win32-x64-msvc.node"

  find "$pkgdir/usr/lib/node_modules/$_pkgname" \
    \( -name 'package-lock.json' -o -name '.package-lock.json' \) \
    -delete

  while IFS= read -r -d '' _pkgjson; do
    jq 'with_entries(select(.key | startswith("_") | not)) | del(.man)' \
      "$_pkgjson" > "$_pkgjson.tmp"
    mv "$_pkgjson.tmp" "$_pkgjson"
    chmod 644 "$_pkgjson"
  done < <(find "$pkgdir/usr/lib/node_modules/$_pkgname" -name package.json -print0)

  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
