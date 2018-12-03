# $Id: PKGBUILD 277477 2016-10-01 03:36:40Z foutrelis $
# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=inox-beta
pk=bnox
name=chromium
pkgver=71.0.3578.75	
pkgrel=1
_launcher_ver=5
pkgdesc="A web browser built for speed, simplicity, and security"
arch=('i686' 'x86_64')
url="https://www.chromium.org/Home"
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'pciutils' 'json-glib'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('python2' 'gperf' 'yasm' 'mesa' 'ninja' 'nodejs' 'git' 'atk' 'at-spi2-atk' 'ncurses5-compat-libs')
optdepends=('pepper-flash: support for Flash content'
            'kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet')
install=inox-beta.install
source=(https://commondatastorage.googleapis.com/chromium-browser-official/$name-$pkgver.tar.xz
        chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz
        https://raw.githubusercontent.com/bn0785ac/ih-beta/master/bnox.desktop
        https://raw.githubusercontent.com/bn0785ac/ih-beta/master/breakpad-use-ucontext_t.patch
        https://raw.githubusercontent.com/bn0785ac/ih-beta/master/crc32c-string-view-check.patch
        https://raw.githubusercontent.com/bn0785ac/ih-beta/master/chromium-gn-bootstrap-r17.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/001.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/002.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/004.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/005.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/006.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/007.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/008.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/009.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/010.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/011.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/012.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/013.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/014.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/015.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/016.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/2kb.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/018.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/k1.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/019.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/020.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/021.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/022.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/023.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/024.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/025.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/026.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/027.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/029.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/030.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/031.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/032.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/034.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/035.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/360.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/037.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/038.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/12.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/16.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/20.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/9k.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/048.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/gna.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/gnb.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/3992.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/2992.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/2ka.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/product_logo_{16,22,24,32,48,64,128,256}.png
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/2kc.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/2kd.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/2ke.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/2kf.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/2kg.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/2kh.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/2ki.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/na.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/nb.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/nc.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/nd.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/a.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/b.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/c.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/d.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/e.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/k.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/l.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/l2.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/l3.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/m.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/n.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/o.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/p.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/r21.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/bp.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/CP.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/888.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/narnia1.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/meme.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/p1.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/p2.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/e3.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/pt.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/edgy.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/k2.patch
https://raw.githubusercontent.com/bn0785ac/ih-beta/master/desu.patch
)


sha256sums=('9bcdec32fc570e83ba9b12ecc74e67d13b024a58113e6d28668ba52aa8c55480'
            '4dc3428f2c927955d9ae117f2fb24d098cc6dd67adb760ac9c82b522ec8b0587'
            '1a3a33e34764205c7be280c7436730f5d899bdbc44339ec5df208e09fd102883'
            '6e9a345f810d36068ee74ebba4708c70ab30421dad3571b6be5e9db635078ea8'
            '35435e8dae76737baafecdc76d74a1c97281c4179e416556e033a06a31468e6d'
            'd81319f168dad0e411c8e810f73daa2f56ff579578771bd9c9bb1aa2d7c09a8b'
            'f51c64f334d34a3f498d187b74201f22fe89ad5b8c6fe5883ef52df0b56b7c64'
            '12d446a2f50c80168b07506c9c733447651830ad1b7f04f494256ebfdc8e0655'
            '2a584c6e3938ecc14e591369441a7ffdd4988e02336440614a52f2eee615517f'
            '0a6e050f5acbe9b90de88f3f7c3828bc190f5831ed582a8e49005fe999db306c'
            '5c8c3ad7d5b4ebda7508e3aee13349fc8ad627d7a7e3147168e214f03e433168'
            '885bd27063ebc43b7030e9d9d364a46a248c4744f66c466017b42a83a279e6ab'
            '8696919f69ef927f095944ae7ef869b283450a4b2cdd4efdebc51fc2b1e747e0'
            'ee103b76ddb34069df1f84966cc77b84a3dc6623a5875c5ff8f7a2cdbedc4e62'
            'fd5fdc83665113677951e2e713a4696d999a070d6b59bb57319df357b35d4fad'
            '3850ad42d0cb4ca011d46b9d569a0a2bf83476f0c3da70c74d4f011cec59f885'
            '7beb0f3bbc55960092347767d423415860a3867525f6d1bbb057b3d72fae0618'
            'bcaeeb52d5d17fa9e6d4883cdeef8150f7e6ce440e0fcd3cef17d99f4b5db672'
            'f6a4c02feb5b21f1814d0b835b94a8b6222628ff97800b5411dc86852bfa5883'
            'b5532de9e402a7d0b12258e9de56722e7eec84dc54cd53b9fe25d62c7354c0af'
            'd64928f6542292b4191a001fc475ef8ea02ea966f5292841ede47a7e70f5d785'
            '0aeb560922cb5d628528fbd33fad23a3d33c3b0caa06a6fa799da2e55741f5cb'
            '1632b2d3b9062e6ec8872b9df180f82a93099a50eda6f15125ffe56dd45beca6'
            '098391051a6c0d0300f438a18b96bd84074d26aa31b11f95afd67def062116c0'
            '9be24cb424d59cea12944bdb451690728e373ece6e4e93dbae8b92078da2130d'
            'b35247d9ca4a7a40d9ca59e95ee9457245d903542e4c29033d200b6198396820'
            '7cde4208b87ba4632e2c83aa13163d3b34935d6175c868b671c74bb17b752fb5'
            '519965231b125f40a644829e50529befe496e02ca2e03ebc38d8791706bf2162'
            '369d0cb944c75820b36cbfb891fa7c9dacd9618e4921bfd0128261796c872795'
            '4986d92d922af8a8adbc66883e6dc07e91c330aa2d911d724928e903b42dca21'
            'd975a6abd6cb8ff2a2178d9a4755ea978033af522a0b4121d025703133a87ca2'
            '0246ac4698361ed36677c7e0831112975924a1b81125af3ffce7d72d2dfa028e'
            '038571a1df00b5ec63a20b442a7e6a0b382b805f4bb91fff1ed8186a9cf8d066'
            'db1d9f62899a1acf917394d807f10765f3cbeef63c42f1e8359239b806f42517'
            'da25ed7557ae7083d28819d88d2c5e89dc23845a1daa7000ee8035148e2d49d7'
            '0a148b0a15a63feb08ed79695a80d09ad39db7a3373b217cd499909218b94fda'
            '9465f89adc5b177050fd154b3be459f167fd3e157a1ebc0537b29070f0dbda5d'
            '5a4ec61000266fd623e0a3377210ed324ed62eeba6c61ecd95ffb49d4d20640f'
            '2ea208978965da5d85d508f06835c2b6f62fe2566341beb8e87958bb3187ea01'
            '8aa6928dfeec97b5a2c2b22e1abda42fd0e57b6c480356c12ca4726a59f12fa8'
            '2acda9e5de0efa71c8347eb490bcae7993ae28dceaba406a0dafb50110539ba2'
            '66ff55dce4ebefdf0030c5cccfbf1dc4e269c681ad9e23d7be5df17c0a884858'
            '3c9aa1b7151d7b8b617c52a0bc0b2f68e2fac7ca0a3f41be48a3ad6d3b5737b9'
            '216829c72f1cc378bc66fb4f62f047cccd31684d946ba9a406b6e7a8f1351677'
            'bc31df03dbddf8f1389ca482c5ba97dfc1a77834bdfbc952dc60cf4da73713a1'
            'f73e7e255432379d53613e7d53d4d176ef830dc34ef7743be294568aeea03a1c'
            '0ac16793634edde24c214eeffa9def755b9b76b256dfa3d9fd31de6002ff5dfa'
            'df1cb61901ad861ffe1335f2dd516d473a062507cd498e6b6afd93ad41ff03af'
            '9d4953a3dc73cb01d9d65ea297ab4b09d47b4daaa5f2291ef35d0784a2f18a4e'
            '74aceab75478b3c23aaa4253694fdca2b3b7eddc9bf2720c443b3216f5d662ad'
            'c81a1414b48fb57e7089f3ceb1e85f34090348f4d6d8c7d1c138afd98a7663d4'
            '73a73b6551595c7bbe4eff6ab8cb5cd110cb62675c855370fc2121ec2e127be3'
            '8d9ebc86511704bfd27d18e5e917ae6c0fc44c2e16520dfb98e14f18fe40a6ee'
            '721e07d904e3bcb643f9aac8e8faa7ff7beeebf66fe5a3813bbc0177452e2c5b'
            '559061ca2cebc75b27ed8a1545ec2d50f8abf9ae8b0a425a775c2a3e5c85c87d'
            '4e939a98d3da3e90b4403b2105ccb908cd6abd51ee27f42247fd1d38887d3e05'
            '9b1b9bbeff504689e780a42e92397967d90fc817e9172fc121417e3a70ab031f'
            '20aa259c9ca06d4040673b0164c171c047d4f463c1193ecfc045337480f6d9af'
            '65fdcaade1b6948594fac7c2f6af3a1bc43557937a8260003842845ea307c41a'
            '2c0c865c325db53da6066afe4c9f81c156b8add0428068c0725d8a84d738e1b5'
            '97aacef479160113f763217df130a72c7b467e27ae556866d2c039965e77bc71'
            '2c7a6274bfe2afcaa4186d421a0690ac2bc0015e8bc80e3a589f04b4931a030f'
            '0c78e8e15d0780dd096e0b72876e3816cf77155a8cb476a6db6fcdf06fe3a321'
            '54d4471bec9e4390e1d2c562a6a3278bf44deb65d01fe5fb8f1477e67e8a957a'
            '0848fe30322bfb6dd7c06110f5d8468f1ce68caf6cd6a184b531cc9653f21420'
            'cdc55ec692caffb02fba826308c6e39b0045674460098bda085237f2123798a0'
            '3c95bf62701f762b166e78c88e06752caf057a00fdaaae87de561fafc321b20b'
            '127747c5c692b0b0ef62f0e6ae79c894cd4798846bba53bf23b0b8bbe6974ba0'
            '065a69ca6547e89f84ded7b95e29a7fb3ac762eaac3aa940ab1ec5a3ecbe3a2f'
            'a31bfe021beb091a37252a443c452ba6f3bc50299f237f47880ae5163d014b28'
            'c367599e25bd9d408d52dd26ceec9f0048b0991cc74980c8c40d602e61a2a844'
            'b54a69d6eeb03bf56e5a6430cbc07fd8d12532709876d38828e4c455eca29e3b'
            '9c1b4b4bcda66739a9dfd0a5d7dd612e64c506b581c3a1dc7b8d43b6ff059285'
            'a0fc68d001dc6bad673997394184112eed59b74b8e6bbcd173db55402c95c121'
            'fb3abae54309adf69b98bd2435fbc23f17bc526dbf1d1e97907da87e7cf0aeed'
            'fb7c96ecf7f97fd6d356b8ca714efc518fc5bf40d92a23a5ff1ad8462d56b248'
            '541136a480187de769d7dfd9da6ac63b3bb65583a553b32615ad5a9e6331ea65'
            '7c526c9cd6bd1083c432bdb5545071915fd0fc794f75bb8eef730e2d20f3dff1'
            '6d3251fb5aa200725a8cdc977d203ef98aaf8ed1564d0a4fa3b67c29a56520a9'
            '46fd137c33585d3ab0bd84977189bb51d7b2100ae1900116393ccc83a5d090ed'
            '51a336bee649d77a623b5da536c3b77b81ea67dbc9c1c34f9539c739d420379e'
            'a72bfdbea4e1bf9c273a78ef9c186968b1e7dd3e993a4a381488d8b9c9613552'
            '502b4eca6edf10fe1d036ab2c65363b4300de91b381ce687e08bd96dc254c898'
            '717d8d042c8c8e64d01c173090c52172fab4f09e8857e8510fbdd5f7361e0e5e'
            '157489aa80f1a845e9a683d66552d64836b388c910724b32e496133538523ee1'
            'a5327677d62f34da26e7aa714d49e71f7ebfcdbcb16b37dd8fe34fdf0d92c438'
            'e660590ebc900879d059ea0b8f9cfbf66f45d0d43f04f1b11ce2d0daf781f265'
            '89929fdcacfed462b2893710f26334d3861b6401f182d790e62d204ec083faf5'
            '4705552f63a28314f3225ebc0cf9d82993466397de2eee3dc9b2c4a085c63f7d'
            'e3cbf8c407974cee82541f0c2395059e90d513e050c05f23975465595c23f0c5'
            '1bb54bd32e78bddc68986a5ddb93eff29ac6cfe2744a499f52071fa3420591f0'
            'd3a3451b002f122c4d96d239964eb8c511d4d16191848c4752eb18cb26a50581'
            '519d1c2787ae7a7cc3300a55292a3be1252775e9c40e19df24d5fcb93c48adb1'
            'c8225c0c14288c21f5cc448afc0f67fc4563517c39a8680af9e659f5b2d8f418'
            '70f49d5b69641669c24d0532fb723b5ef1313a56224f41bf35bf6bb07fc93974'
            'cd4c8fa8294f542a3fea1dd3df4a0a7370723f7139e5c59ec53f4ed639976d80'
            'a00a82e7c6e692c695971b2bf462442076975ebb42d9b66009d8e8489465c29e')





# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -rgA _system_libs=(
  #[ffmpeg]=ffmpeg           # https://crbug.com/731766
  [flac]=flac
  #[freetype]=freetype2      # https://crbug.com/pdfium/733
  #[harfbuzz-ng]=harfbuzz-icu
  #[icu]=icu
  [libdrm]=
  [libjpeg]=libjpeg
  #[libpng]=libpng           # https://crbug.com/752403#c10
  #[libvpx]=libvpx           # https://bugs.gentoo.org/611394
  [libwebp]=libwebp
  [libxml]=libxml2
  [libxslt]=libxslt
  [opus]=opus
  [re2]=re2
  [snappy]=snappy
  [yasm]=
  #[zlib]=minizip
)
depends+=(${_system_libs[@]})

# Google API keys (see https://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys.


prepare() {
  cd "$srcdir/$name-$pkgver"

  # https://crbug.com/710701
  local _chrome_build_hash=$(curl -s https://chromium.googlesource.com/chromium/src.git/+/$pkgver?format=TEXT |
    base64 -d | grep -Po '^parent \K[a-z0-9]{40}$')
  if [[ -z $_chrome_build_hash ]]; then
    error "Unable to fetch Chrome build hash."
    return 1
  fi
  echo "LASTCHANGE=$_chrome_build_hash-" >build/util/LASTCHANGE



patch -Np1 -i ../001.patch
patch -Np1 -i ../002.patch
patch -Np1 -i ../004.patch
patch -Np1 -i ../005.patch
patch -Np1 -i ../006.patch
patch -Np1 -i ../007.patch
patch -Np1 -i ../008.patch
patch -Np1 -i ../009.patch
patch -Np1 -i ../010.patch
patch -Np1 -i ../011.patch
patch -Np1 -i ../012.patch
patch -Np1 -i ../013.patch
patch -Np1 -i ../014.patch
patch -Np1 -i ../015.patch
patch -Np1 -i ../016.patch
patch -Np1 -i ../2kb.patch
patch -Np1 -i ../018.patch
patch -Np1 -i ../019.patch
patch -Np1 -i ../020.patch
patch -Np1 -i ../021.patch
patch -Np1 -i ../022.patch
patch -Np1 -i ../023.patch
patch -Np1 -i ../024.patch
patch -Np1 -i ../025.patch
patch -Np1 -i ../026.patch
patch -Np1 -i ../027.patch
patch -Np1 -i ../029.patch
patch -Np1 -i ../030.patch
patch -Np1 -i ../CP.patch
patch -Np1 -i ../032.patch
patch -Np1 -i ../034.patch
#patch -Np1 -i ../035.patch
patch -Np1 -i ../360.patch
patch -Np1 -i ../888.patch
patch -Np1 -i ../meme.patch

patch -Np1 -i ../037.patch
patch -Np1 -i ../038.patch
patch -Np1 -i ../pt.patch


msg2 'Cut media router'
patch -Np1 -i ../3992.patch
patch -Np1 -i ../2992.patch
patch -Np1 -i ../2ka.patch



patch -Np1 -i ../2kc.patch
patch -Np1 -i ../2kd.patch
patch -Np1 -i ../2ke.patch
#patch -Np1 -i ../2kf.patch
patch -Np1 -i ../2kg.patch
patch -Np1 -i ../2kh.patch
patch -Np1 -i ../2ki.patch


patch -Np1 -i ../na.patch
patch -Np1 -i ../nb.patch
patch -Np1 -i ../nc.patch
patch -Np1 -i ../nd.patch



patch -Np1 -i ../a.patch
patch -Np1 -i ../b.patch
patch -Np1 -i ../c.patch
patch -Np1 -i ../d.patch
patch -Np1 -i ../k.patch
patch -Np1 -i ../l.patch
patch -Np1 -i ../l2.patch
patch -Np1 -i ../l3.patch
patch -Np1 -i ../m.patch
patch -Np1 -i ../n.patch
patch -Np1 -i ../o.patch
patch -Np1 -i ../p1.patch
patch -Np1 -i ../p2.patch
patch -Np1 -i ../narnia1.patch



#patch -Np1 -Ri ../9k.patch
patch -Np1 -i ../048.patch

patch -Np1 -i ../12.patch
patch -Np1 -i ../16.patch



patch -Np1 -i ../k1.patch
patch -Np1 -i ../k2.patch

patch -Np1 -i ../edgy.patch
patch -Np1 -i ../r21.patch
  # Fix build with glibc 2.26

patch -Np1 -i ../gna.patch
  patch -Np1 -i ../gnb.patch
patch -Np1 -i ../desu.patch


  # Fix incorrect inclusion of <string_view> in modes other than >= C++17
  
  # Fixes from Gentoo

  # Use Python 2
  find . -name '*.py' -exec sed -i -r 's|/usr/bin/python$|&2|g' {} +

  # There are still a lot of relative calls which need a workaround
  mkdir "$srcdir/python2-path"
  ln -s /usr/bin/python2 "$srcdir/python2-path/python"

  mkdir -p third_party/node/linux/node-linux-x64/bin
  ln -s /usr/bin/node third_party/node/linux/node-linux-x64/bin/

  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries




  python2 build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"
python2 tools/clang/scripts/update.py

  cd "$srcdir/chromium-launcher-$_launcher_ver"
patch -Np1 -i ../20.patch


}

build() {
  make -C chromium-launcher-$_launcher_ver

  cd "$srcdir/$name-$pkgver"

  export PATH="$srcdir/python2-path:$PATH"
  export TMPDIR="$srcdir/temp"
  mkdir -p "$TMPDIR"

   local _flags=(
    "custom_toolchain=\"//build/toolchain/linux/unbundle:default\""
    "host_toolchain=\"//build/toolchain/linux/unbundle:default\""
    'symbol_level=0'
    'is_debug=false'
    'fatal_linker_warnings=false'
    'treat_warnings_as_errors=false'
    'fieldtrial_testing_like_official_build=true'
    'remove_webcore_debug_symbols=true'
    'ffmpeg_branding="Chrome"'
    'proprietary_codecs=true'
    'link_pulseaudio=true'
    'use_gnome_keyring=false'
    'use_sysroot=false'
    'linux_use_bundled_binutils=false'
    'use_custom_libcxx=false'
    'use_vaapi=false'
    'enable_hangout_services_extension=false'
    'enable_widevine=false'
    'enable_nacl=false'
    'enable_swiftshader=false'
    'enable_nacl_nonsfi=false'
    'enable_print_preview=true'
    'enable_remoting=false'
  )

      _clang_path="${srcdir}/chromium-${pkgver}/third_party/llvm-build/Release+Asserts/bin"
      _c_compiler="${_clang_path}/clang"
      _cpp_compiler="${_clang_path}/clang++"
      export CXXFLAGS="${CXXFLAGS//-fno-plt/}"
      export CFLAGS="${CFLAGS//-fno-plt/}"
      CFLAGS+=' -Wno-unknown-warning-option'
      CXXFLAGS+=' -Wno-unknown-warning-option'


  # Export compilers
  msg2 "Setup ${_compiler} compiler${_compiler_msg}"
  export AR=ar
  export NM=nm
  export CC="${_c_compiler}"
  export CXX="${_cpp_compiler}"

  sed 's|is_win \|\| (is_linux && use_x11 && !is_chromeos)|false|g' -i third_party/angle/gni/angle.gni


  gn gen out/Release --args="${_flags[*]}" \
    --script-executable=/usr/bin/python2

python2 build/util/lastchange.py -m GPU_LISTS_VERSION \
--revision-id-only --header gpu/config/gpu_lists_version.h




#its optimized for 16 ram, if you get segfaults or crashes read linuxfromscratch.org/blfs/view/svn/xsoft/chromium.html

  ninja -j8 -C out/Release  pdf chrome chrome_sandbox chromedriver
}

package() {
  cd chromium-launcher-$_launcher_ver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/bnox/LICENSE.launcher"

  cd "$srcdir/$name-$pkgver"

  install -D out/Release/chrome "$pkgdir/usr/lib/$pk/$pk"
  install -Dm644 "$srcdir/bnox.desktop" \
    "$pkgdir/usr/share/applications/bnox.desktop"

  install -Dm4755 out/Release/chrome_sandbox \
    "$pkgdir/usr/lib/bnox/chrome-sandbox"

  cp -a \
    out/Release/{chrome_{100,200}_percent,resources}.pak \
    out/Release/{*.bin,chromedriver} \
    out/Release/locales \
    "$pkgdir/usr/lib/bnox/"

  if [[ -z ${_system_libs[icu]+set} ]]; then
    cp out/Release/icudtl.dat "$pkgdir/usr/lib/bnox/"
  fi

  ln -s /usr/lib/$pk/bnoxdriver "$pkgdir/usr/bin/bnoxdriver"

  for size in 16 22 24 32 48 64 128 256; do
    install -Dm644 "$srcdir/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pk.png"
  done



  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/bnox/LICENSE"
}

# vim:set ts=2 sw=2 et:
