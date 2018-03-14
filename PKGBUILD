# Maintainer: Michael Lass <bevan@bi-co.net>
# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: reflexing <reflexing@reflexing.ru>

# Instructions were copied from ttf-ms-win8 and slightly modified:
#
# BUILD INSTRUCTIONS:
# -------------------
#
# Please note, that usage of Microsoft fonts outside running Windows
# system is prohibited by EULA (although in certain countries EULA is invalid).
# Please consult Microsoft license before using fonts.
#
# You can acquire fonts either from an installed and up-to-date Windows 10
# system or the most recent install medium.
#
# On the installed Windows 10 system fonts are usually located in
#       C:\Windows\Fonts
# and license file is
#       C:\Windows\System32\Licenses\neutral\_Default\Core\license.rtf
#
# How to acquire fonts from Windows 10 install medium:
#
#    You can freely download the Windows 10 Enterprise 90-day evaluation from:
#
#       http://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise
#
#    Fonts are located in 'sources/install.wim' file on the ISO, which
#    is a 'Windows Imaging Format' (WIM) archive.
#
#    You can extract WIM using wimextract ('wimlib' package) or 7z ('p7zip').
#
#    Put the following script together with previously extracted
#    'install.wim' and execute:
#
#       wimextract install.wim 1 /Windows/{Fonts/"*".{ttf,ttc},System32/Licenses/neutral/"*"/"*"/license.rtf} --dest-dir fonts
#
#    Fonts and license will be located in the 'fonts' dir.
#
# You need all files listed in the _ttf_ms_win10[_*] arrays.Place them in the
# same directory as this PKGBUILD file, then run makepkg.

pkgbase=ttf-ms-win10
pkgname=($pkgbase{,-japanese,-korean,-sea,-thai,-zh_cn,-zh_tw,-other})
pkgver=10.0.16299.192
pkgrel=1
arch=(any)
url='http://www.microsoft.com/typography/fonts/product.aspx?PID=164'
license=(custom)
depends=(fontconfig xorg-fonts-encodings xorg-mkfontscale xorg-mkfontdir)
provides=(ttf-font)
conflicts=(ttf-vista-fonts)

_ttf_ms_win10=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
arial.ttf      arialbd.ttf    ariali.ttf     arialbi.ttf    # Arial
ariblk.ttf                                                  # Arial Black
bahnschrift.ttf                                             # Bahnschrift
calibri.ttf    calibrib.ttf   calibrii.ttf   calibriz.ttf   # Calibri
calibril.ttf                  calibrili.ttf                 # Calibri Light
cambria.ttc    cambriab.ttf   cambriai.ttf   cambriaz.ttf   # Cambria
Candara.ttf    Candarab.ttf   Candarai.ttf   Candaraz.ttf   # Candara
comic.ttf      comicbd.ttf    comici.ttf     comicz.ttf     # Comic Sans MS
consola.ttf    consolab.ttf   consolai.ttf   consolaz.ttf   # Consolas
constan.ttf    constanb.ttf   constani.ttf   constanz.ttf   # Constantia
cour.ttf       courbd.ttf     couri.ttf      courbi.ttf     # Courier New
corbel.ttf     corbelb.ttf    corbeli.ttf    corbelz.ttf    # Corbel
framd.ttf                     framdit.ttf                   # Franklin Gothic Medium
Gabriola.ttf                                                # Gabriola
georgia.ttf    georgiab.ttf   georgiai.ttf   georgiaz.ttf   # Georgia
holomdl2.ttf                                                # HoloLens MDL2 Assets
impact.ttf                                                  # Impact
lucon.ttf                                                   # Lucida Console
l_10646.ttf                                                 # Lucida Sans Unicode
marlett.ttf                                                 # Marlett
micross.ttf                                                 # Microsoft Sans Serifc
pala.ttf       palab.ttf      palai.ttf      palabi.ttf     # Palatino Linotype
segoepr.ttf    segoeprb.ttf                                 # Segoe Print
segoesc.ttf    segoescb.ttf                                 # Segoe Script
segmdl2.ttf                                                 # Segoe MDL2 Assets
segoeui.ttf    segoeuib.ttf   segoeuii.ttf   segoeuiz.ttf   # Segoe UI
seguibl.ttf                   seguibli.ttf                  # Segoe UI Black
seguiemj.ttf                                                # Segoe UI Emoji
seguihis.ttf                                                # Segoe UI Historic
segoeuil.ttf                  seguili.ttf                   # Segoe UI Light
seguisb.ttf                   seguisbi.ttf                  # Segoe UI Semibold
segoeuisl.ttf                 seguisli.ttf                  # Segoe UI Semilight
seguisym.ttf                                                # Segoe UI Symbol
Sitka.ttc      SitkaB.ttc     SitkaI.ttc     SitkaZ.ttc     # Sitka
sylfaen.ttf                                                 # Sylfaen
symbol.ttf                                                  # Symbol
tahoma.ttf     tahomabd.ttf                                 # Tahoma
times.ttf      timesbd.ttf    timesi.ttf     timesbi.ttf    # Times New Roman
trebuc.ttf     trebucbd.ttf   trebucit.ttf   trebucbi.ttf   # Trebuchet MS
verdana.ttf    verdanab.ttf   verdanai.ttf   verdanaz.ttf   # Verdana
webdings.ttf                                                # Webdings
wingding.ttf                                                # Wingdings
)

_ttf_ms_win10_japanese=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
msgothic.ttc                                                # MS Gothic
YuGothR.ttc   YuGothB.ttc                                   # Yu Gothic
YuGothM.ttc                                                 # Yu Gothic Medium
YuGothL.ttc                                                 # Yu Gothic Light
)

_ttf_ms_win10_korean=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
malgun.ttf     malgunbd.ttf                                 # Malgun Gothic
malgunsl.ttf                                                # Malgun Gothic Semilight
)

_ttf_ms_win10_sea=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
javatext.ttf                                                # Javanese Text
himalaya.ttf                                                # Microsoft Himalaya
ntailu.ttf     ntailub.ttf                                  # Microsoft New Tai Lue
phagspa.ttf    phagspab.ttf                                 # Microsoft PhagsPa
taile.ttf      taileb.ttf                                   # Microsoft Tai Le
msyi.ttf                                                    # Microsoft Yi Baiti
monbaiti.ttf                                                # Mongolian Baiti
mmrtext.ttf    mmrtextb.ttf                                 # Myanmar Text
Nirmala.ttf    NirmalaB.ttf                                 # Nirmala UI
NirmalaS.ttf                                                # Nirmala UI Semilight
)

_ttf_ms_win10_thai=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
LeelawUI.ttf   LeelaUIb.ttf                                 # Leelawadee UI
LeelUIsl.ttf                                                # Leelawadee UI Semilight
)

_ttf_ms_win10_zh_cn=( # Chinese (Simplified)
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
simsun.ttc                                                  # NSimSun
simsunb.ttf                                                 # SimSun-ExtB
msyh.ttc       msyhbd.ttc                                   # Microsoft YaHei
msyhl.ttc                                                   # Microsoft YaHei Light
)

_ttf_ms_win10_zh_tw=( # Chinese (Traditional)
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
msjh.ttc       msjhbd.ttc                                   # Microsoft JhengHei
msjhl.ttc                                                   # Microsoft JhengHei Light
mingliub.ttc                                                # MingLiU_HKSCS-ExtB
)

_ttf_ms_win10_other=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
ebrima.ttf     ebrimabd.ttf                                 # Ebrima
gadugi.ttf     gadugib.ttf                                  # Gadugi
mvboli.ttf                                                  # MV Boli
)

DLAGENTS+=("file::/usr/bin/echo ${BOLD}${RED} Unable to find %u, please read the PKGBUILD ${ALL_OFF}")

source=(${_ttf_ms_win10[@]/#/file://}
        ${_ttf_ms_win10_japanese[@]/#/file://}
        ${_ttf_ms_win10_korean[@]/#/file://}
        ${_ttf_ms_win10_sea[@]/#/file://}
        ${_ttf_ms_win10_thai[@]/#/file://}
        ${_ttf_ms_win10_zh_cn[@]/#/file://}
        ${_ttf_ms_win10_zh_tw[@]/#/file://}
        ${_ttf_ms_win10_other[@]/#/file://}
        file://license.rtf)

sha256sums=('699e722e3ebe98cdfd83ca93840751e082043902d3f41258404f7a2443e76a8e'
            '34f9b96739f9ad993cf9a322598bcb6dae89d5863358b592d6e2eb69c442f128'
            '3200d79d0162028621f2ad3cde873ace47ce3491de9ae30a16e9f93f10cfd8cd'
            '504952b96656833451d044e5ff13995f5501c757b738a2cd0251aeff324e610b'
            'f0dfe57962ecbef8f6e8e6256b793787c43c17e1af132ba56560171c7df221da'
            'c223be8f60aed07ff6d4c0ffa2d8759d8bdc7ca8ebb4cbf3ecb8c7416c555a3c'
            '750ecf8069701b6adc70f7cab6209f0ddcdbecc31b4039f535c29de85d691392'
            '19a7c6027d67a112c2b33a7bdf3b4f72f2450dd108707c95375ba56093b68691'
            '30c813e59d22d17be1250395707567041954ffb4079997f99470f8445a320795'
            'a77d51a2f88ff251569cb79265c49342d7bd466ca25fa5e95ee8ec41382971a3'
            'ec1d7db709d0c6dd8aeffb7b81cb493fb94018f391b76d6e514eecbe48d2ab5a'
            'f3a02faaf865caa727ff865450f26c624220ef5dfa8d438ee441eed36298c3af'
            'efeaede5a01ae967fde8b28ebffa03f1cafd26cdeeadad054ed0ad55c6a2e4cf'
            '77b4432b1d007642a89a9317cf9704cebc4909f9d7faa5f658ba101b51b45e5d'
            '5ded247ec78d3898585ff7ac3c6245a5e09c255408f491a7b87a0211c5926078'
            'af7b03af33c5b69417e9028b9e4c1d0913333e32faffee4d41db8a23e21248cd'
            '580e19413a2d77ce64232c33baac7f5a2a06592ec71bfdac76fa685dbe6ebc2e'
            'c6662a8c629868d95f85f734f7fa87ff0e02a9fdb4fe2d35b80db4b2d00e234d'
            '5e96404dd9edb2060f9af1902b06f40a452cf4560983f27f26364c9dbf4e23d2'
            '3b40e6e4b75b8cf543e747ec3b2716dadb977e46c3864e1377d58bc9b971b27f'
            'a04732289a531ba619ec9ababcc8dccde7e58f8dd21cd4b4a471a93986e84501'
            '11ef7e5dd75c2bdda2eb58191f3f2d5df4e16e6758133cb9d43320f276354a5c'
            '0a703ba7bbabab6a0a46f0bd6519f83842a2d15b376dbda6f24ba9c40dcddcd3'
            'b83494ea8d97e2e2102d1f125ebd1d50f82352dad147ff9bf68011437f3187ed'
            'e3f24f013ed28c29483b92f38a016861f71c200208da4866ce11451701023ed6'
            '42f671df8863afe7ca060c1583a2ad2830a8143f9ab923f0815d19f30e163cc7'
            'be08de9c7ca12178729a84c9a1eb4e20c2cdbaafab097f0804d03949e6c617bc'
            '1c13d542ae4b2d3f9f1ddf75ae67f9e446a2df670c923708365c4404775111e9'
            '4b458d796859141f4be26c9bd13f3fb7cf30eca1f4cbe681c639fdc63554ce05'
            '8114f8e7b58ab0e045dfcc231c5fdc2af7a555963989ab60a79fc587412ad239'
            '38d87c2c7bdf3c65e261b07d504caa29ff56ab03dcd71ce6722e89f47e4a6e5a'
            '6a15608afc8970355cb382c88084a1f7ba27a8ad142a855cf1c76620f1182fa2'
            '8da71b5c11b17bade23095559fb0905741c15ee2f8800b1fa0ceb100e3fd6f45'
            '0160b83ba3024ea2a1d6024cabb4eb6a1f6503beb7938181e4f2a22272e7ead1'
            '954bb6900af4f7caf87122d890900329dd34869ac14c77431347a8b1b9f8728d'
            '34eb08ebff2fecf802bce87977a97330177b885af206ebd5896f5b56270b22fe'
            'a4c132ad9d9deb72f6a89b278917aad802b97e605ded5813a1132c97d928178a'
            'c665aeda6bd8a98731e311963c9f78fc16d98fda6b61190588223034f2602c7d'
            '639d26aed4a703c68f0e5856152d2f667415db47d632292f8bcb0a1cbfc77ddd'
            '41fbf89f314e934860eed47237543a24f904645e3165528d0e2748b4b055ae1c'
            'bac844bd41f847cf138737026d41c983387a1065535c32e78aa22c48708b52ad'
            'df59f9ea915957b22a389d68580bf40dc5bd05822cc65b5fdcc188c706a694e7'
            '7baa6bb75ff41723039c100a92f71a446a912d9a0c479f2a354a8a4eccce84b2'
            '85e8cea26eab4f2aa6e381ebf494a94f90be9b2d7309de82c752956590ef49be'
            'c9d69e4e496ea776edfcb4e6f6d770985dd87b2b64b84db733f57f6303f67f8c'
            '9f73a2514fc1b5600f20f2747c718ffd648e0f7f67b7b13934aa2976cf085e00'
            '57b79bb853762ffbe633ce8ecbcf8c0b71a596c38ce7fd273b6455b6ca5799b8'
            'c2c3a4146ac080945670eb6b0c4961b26467c797e8497367ac8611cbc3955559'
            'd8bbdb72e3f930157824b2e59677d3a912d4512c14a948e6656a2e3fb0c935ad'
            '2ca2cfde263fa420e8d39420f075ee9ac80bc0794272c53ac4571a88f8a075a6'
            '97226e81f19eff8c8fb191745748bab920472c005d3ec4e23d9a50a12c471d92'
            '21afda303cef3154ff558b44d54897c0d4f73aaf0fb62d2f2e0bc4749e64b305'
            '61e08f051b2c47a59366c545e48e3975f56f72e5a9ee3701efbc5346b694984a'
            'c5d2704515a7b7654f508ab099798773e5fd1ec6153c910e3cd0903415749283'
            '8bf14396457a00a3147b3652234e242cda0a0de37c6ee7da2a58dce380d3cbd0'
            '27de74f4645a0d68578387ce453d38e863ba9a6024e6437df117078da7e4e293'
            'b8238b9e48f08b0bb39a9cf0539a2915372d35bf72595484ec546a768f666c70'
            'b909115713421a7ab27dc1511b988e9762c4bb9edbfa5edfc2d23e2c08dbc1e4'
            '9b196e864e23481f10fbb7db5ac1d69ed48c55f55339799cfe92d99d1f6008f3'
            '1ac0a034e1bf2362630541a45d42a6d227201ff858fa3c033608700eae098423'
            '41e6d48d43641af96608626286fb583cbdc39ba52c3e73d46b4368567a917675'
            'b1b0398f6535f4b10a7a5f756f9e70dcdce68935052b1998849d6a455ab48749'
            '20576541e0cbaf7938014888f94fa432383f9efed93015908c2bcd5f6c0f393e'
            'fb8dcc0d484f3dc1b88fb0fa9f1d72110480d494b3d88b807708de7bae2a3d11'
            '5b59a4cb83d762ae21af40e2036ebf4753e8009642ad9ff5ccca102169e2da5f'
            '5b9a7eb4ef4564c56fd403aa86e61d024c46102425410947f7a3806b255d75db'
            '17f76e94f257253eb6fc45ded98a2771704914890139473c002d16f2faf576d8'
            'f7a61c4bf41450c49e8addb7c9b1694929f4dceecec363af5e17f37273690f25'
            '004c9828a2289cf197500c6f011d16619ed03f7d0f3b59568077cf1acec2891b'
            '7ec8ed603c90dce82de8c4bbd2e193978ca5a2d5ee873129093ef726cfc83617'
            'be47c600e10740eb7f7d86ce1979659f63742cf22f7478493fac1978d7af73f0'
            'dc0d47a551387908732e22836963f2f75004a4ef9d8c9ccbb5e92140de6f7670'
            'e52ecd76827eb67261a77e1012463884d1310204756460a823a20aebb0c0588e'
            '3b6ef63deb43c7cc0d5f688493183edd435adbeacfae4d4bee8916dcff6f32c1'
            '0c95691be503341786035fe13a43436e390b8d09705b59fc8cdda79573d2ee52'
            '2976bcc8aa81f0c52e6a6d359b352c7d686d8fb83ab6208666dff93cd9bae7b5'
            '062d076f213aa83fa8ca66d7e2df04084fe51149a30f0bc1f45d13bd2bc1bbe6'
            'c2659c03a9edb3799ec71505dfb93bcf31def9d9e2ed3597bfce92c22aedb839'
            '3e199e341b55ec3656a265682461bc9a35997127027ecf87f826218c67f2a945'
            '3ea7f8ff29ff550faa1ac138187e2dbfbc9223959bcbf15df175afc4906da934'
            '82ee78170491a602664c1610c0428c3383e333ffee38be958d802e2d78b8ae65'
            'a4a1c1e39156e36be0fa5acbd661c6803af1c4b174b4396ee6d5cc402690e937'
            'bbf1192965e5266fbf23370416337d2861fc1e8bd349def93f2994ba67382fc3'
            '0f75c4e04e60375bbcf6b5726747e14badcceedbde67cf0ea3d71d16d145942c'
            '70f483a97519dfee4da4734c3e148f2c5e5d6b56a706c06bc916cc487f4a6436'
            'e920b413cf7ca9d1129fbdc77ab4f2e8210b3fe2be5517a9acc71b84987f146d'
            'e169eff9fd83c74dc7b01b1ba6e7079f480854fa35ea6b267851d6cbc64cd50a'
            'b43f42eddc029291596424a2fc6726e46d7c429c5d36ac7917cf353761a7579f'
            '0e7429de7b26d13a43d505e0506d4efee27bab14188c8f8ba4bda34838b98927'
            '23734de4b5b1a2055250d89de273d82c80481ba82d5fbd8b73fd49d76d22dc7f'
            'c8925aac996692c572eb2e99779b6e300d54d335b784c72d5d95525763588874'
            '043339809dc45ad79dea485272876ede61e7b8e99168ae36c8d6a674b6bee7bd'
            'a18618e0c3ba928b8676820a30ae08367353901ee4592bfc4a12038bd538c9dc'
            '7596be2753f0f07db0facdc65d0ff69d7e4e35d78414f609249158b2ba984ce6'
            '3960ec38cfc8601b0226765cce929d5da6158000bef4af471e530ec082a4cdb1'
            'bbb45632caf8a524a56a198bfe43970a2d8ab647920748085e6e18d05c255f7d'
            '25e9b258c881453ecad9f6bcf46131552824823d74db0fad0bc106b74eca606f'
            '67461fabd8329d0d8ad62689cac642b34fac81c754ff9077ad211160ec62282d'
            '9bcd6064e3b52fa30a347edd6e82506e2ec8b1602930b423c629a82c10468a5b'
            '029766fa6d75ffba352daa361627c2d9597ba273b160aec1164640fde3418bc9'
            '75664a0a29d477657003452fb8ac7afeb4ac7380600c601d459c5bbbc12bdac1'
            '95ff0c570ba8caa2244c1738e681e38305b497e280977c8b9834050ce1678675'
            '0ccdbce341fc674a0c3eec8ed438a2d07799b8f396c55519c8b91b0a19f196eb'
            '5b2d130e77c61537f1b82488cd19e3e1bddeedd4091a96a1ed546c27e3796439'
            'a476b34af18296df7d6e61b786affa451b845d7c9c05aadd9423569330251e66'
            'da467ca42c4ccd032c5c96d159391ce69df36eeff3a1153ecb6bf590cbb5111c'
            '8ea245744db3d107dfa877cc0b80627f17e557179ecce49fe5017870e78aee37'
            '811a4fd7d47b253a5d4177bfbe10ed91ab829b1637e65a98f75fe444a75297f3'
            '0c2a967164bd08402b4c34681382b10893bf2db60a5536d0aa412ae15bd23b15'
            '64502ba02a5111b8196738798c82c27cc50413e2a430c9ed55f7472c1782113e'
            'c975ea00e96f19965d765943d05a989d7b0f77f505d82c631495856ed65f1fdd'
            '9bad0297e838eee957dee53cef0c5e7afe82729bdd7d2c20ebbdf305d2809b7e'
            '3e9d1a0d92061dea66ae19b98a5024ae791b3f4cb0d55e73d215fa262e0bb7e2'
            'eea2df61a17b3661b6456c8c456cb90e7559ce40a6dfba4a34df7247a398b270'
            '90a98abed01d41a34f6c7cd7379545f83e65246aa2c948fe0bc277eb12935ef3'
            '812ea1191474003958be3f6d20a2fc0a26a9376606eaa5844b265080de49ea0a'
            'e6096b025b3569a51346c01a9123f3ab21bd5de0e465abc17bdad3e028d6767e'
            'd0c44f01ae4768a6366508514c3e21a3a8c78989d97d8eeb558f06f74b73350e'
            'd56dc697a5de20ebcdd45c52d90e443c1220db0ab240bf74701f9af1f7c41e24'
            '50a7b4ad5e4b5fcb2ba270ebda416509c71856d0e3f512d61b9360c29e9b83be'
            '05861c6db10532cac0eab8297fbb65a3f130246afb1764816230bf8061572483'
            'aee5be20e6da19787c6c685e9b62f7c58a611b9167563122077f0d6d21c692ef'
            '796dc7e97b357f9c2ad10044d01a86d3fb49cf80e3693011eb055c466c995de0'
            '16d0c83e99ca3cd56a85966c4ff2c5f0c0f8a5a7140a7594b2ec3e404c8e96a0'
            '2e2fabd71aa30f0d7039b879ee58441a791e095a6656064eb9d4a84a071e5e8f'
            'ca2a6662eb28f02e80bcde33f3dfdd8dbf7369feae36f326b3661e2d9f84f865'
            'ae2051f7559be3cbb0c49d934d032fa69e782decda073293ae0b910ce0b9208a'
            'e4b3b9d058750fb80899c24f68e35beda606ca92694eff0e9f7f91eec7a846aa'
            '06e1a30f687ab7d39f533447b21e84d51e0cecdaa6bfa060c87136b168811bdc'
            '2db3f3100589c5795f7917ebc25779d23b69dd19047a963190d9357a5e0dc34c'
            '7a28f44c05216ebc8060a751a9009689f0d1f17c0b26831c491987468bf4424f'
            '7d441a4c7275bcb6f1582b8014416a131d67d36fee395ed2ac75343ad3ba4ec9'
            '78d8d6efd67e592f17374aa0035f09f5a3c27f64874786f96409c18f5969e963'
            '9cfe9ef1cfd79b04810f57581bba7026e71437f4a21ac26a42f34b70a5b0bc32'
            'b277b647c2833c83310e8e23a471b13a9d85975f90f271c35277173784b50960'
            '10c5d214d0b2c516a3b024ff2d950b758b07c7b8a47cf31f99b0db810dbd98d3'
            '64c1b475aeae734eeaac0b2d5f2d28009cb17c1ee52cb64eb61c6f0d33658546'
            'ea32ee99a75f01ff5624d4e42ec7884e91505bcb5befc3071160b3c061ed1cc5'
            'a5b742323c8da0fe29b0003fb0073969b757865fbf91789d32206397593c4d6a'
            'SKIP')

_package() {
    conflicts+=(${pkgname/10/8} ttf-win7-fonts${pkgname##*10})

    install -Dm644 $@ -t "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 license.rtf -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-ms-win10() {
    pkgdesc='Microsoft Windows 10 TrueType fonts'
    provides+=(ttf-tahoma ttf-ms-fonts)
    conflicts+=(ttf-tahoma ttf-ms-fonts)
    _package ${_ttf_ms_win10[@]}
}

package_ttf-ms-win10-japanese() {
    pkgdesc='Microsoft Windows 10 Japanese TrueType fonts'
    _package ${_ttf_ms_win10_japanese[@]}
}

package_ttf-ms-win10-korean() {
    pkgdesc='Microsoft Windows 10 Korean TrueType fonts'
    _package ${_ttf_ms_win10_korean[@]}
}

package_ttf-ms-win10-sea() {
    pkgdesc='Microsoft Windows 10 Southeast Asian TrueType fonts'
    _package ${_ttf_ms_win10_sea[@]}
}

package_ttf-ms-win10-thai() {
    pkgdesc='Microsoft Windows 10 Thai TrueType fonts'
    _package ${_ttf_ms_win10_thai[@]}
}

package_ttf-ms-win10-zh_cn() {
    pkgdesc='Microsoft Windows 10 Simplified Chinese TrueType fonts'
    _package ${_ttf_ms_win10_zh_cn[@]}
}

package_ttf-ms-win10-zh_tw() {
    pkgdesc='Microsoft Windows 10 Traditional Chinese TrueType fonts'
    _package ${_ttf_ms_win10_zh_tw[@]}
}

package_ttf-ms-win10-other() {
    pkgdesc='Microsoft Windows 10 Other TrueType fonts'
    _package ${_ttf_ms_win10_other[@]}
}

# vim: ts=4 sw=4 et
