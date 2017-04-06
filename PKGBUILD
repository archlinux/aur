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
#    You can extract WIM using wimextract ('wimlib' package from AUR) or
#    7z ('p7zip').
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
pkgver=10.0.15063
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

sha256sums=('a5b0e3e1e7e37358efa05491b085a4b26cf9c5a76b281bd0dbfc1e4bd41f3955'
            '83d90fa195e2e7a978534b7f0e93f3a25ddc05983b7eaa5da5b115386e4da277'
            '3bf89432db44e686ab80a87c6006f3745708c2bea3f66545a7e92ebca7adc0c0'
            'f019265ab366bedb288281332d38a87fced42f2c1b3aae74304b070b18f5b24d'
            'f0dfe57962ecbef8f6e8e6256b793787c43c17e1af132ba56560171c7df221da'
            '456a5ff14a37d517ef18635a4adf7edac5d2b8df3b01513f345311b15dcb8419'
            'b1ac8a165a61ac7ee9285d7949d719d0a6f21d50b15922c9cb3f7c4e6d49dfe9'
            'b16de8fbcbd2d2a1c8b0f83e6698c97aa2c30f7d30155c51bd4bef496ce8f7b3'
            'dd45ad6ef12a676690c94795b6fc72c811679bc3e207b46c8e3922a3a6df003e'
            'be5864b1d73485078255e43eeb43f4e0dd64bc9ee041e41fd52c313f826f75c3'
            '12cb52089c0c1fa547ca35329a77bb69a47267265e008ee0d7b8537f1b06ab5b'
            '219262a43b043266ca1978a13f90ac78ee36a5ecfe98be7bab5474dc66f4fbb8'
            '13dcdbed0a21f24f73eb83ba7fecbc8268705c6779b0d27debf4149204a918ab'
            '383fba51c9162a2c865b6c19567ac3b8e56566f2e64eacd06997cef86cd35a48'
            'df1c98cb4e58d0b6030203edce6f3e664664f27d9a7babac017eae6d1323afc3'
            '580e19413a2d77ce64232c33baac7f5a2a06592ec71bfdac76fa685dbe6ebc2e'
            'c6662a8c629868d95f85f734f7fa87ff0e02a9fdb4fe2d35b80db4b2d00e234d'
            '5e96404dd9edb2060f9af1902b06f40a452cf4560983f27f26364c9dbf4e23d2'
            '3b40e6e4b75b8cf543e747ec3b2716dadb977e46c3864e1377d58bc9b971b27f'
            'a04732289a531ba619ec9ababcc8dccde7e58f8dd21cd4b4a471a93986e84501'
            '11ef7e5dd75c2bdda2eb58191f3f2d5df4e16e6758133cb9d43320f276354a5c'
            '0a703ba7bbabab6a0a46f0bd6519f83842a2d15b376dbda6f24ba9c40dcddcd3'
            'b83494ea8d97e2e2102d1f125ebd1d50f82352dad147ff9bf68011437f3187ed'
            '4d628909d0f370ce948f60bdd2e6e0f6d74c7715050c9ccfbf6bdc03084e3d50'
            '147c4ed332f855dbbd976d9c5bb7324dde05f2d003d3d107263e83ec462af1a7'
            'eb118c73f2a880f695e6df4775e9995b360316688a08c59597ef04a1cbec55b4'
            'f092b9734c5a6009971d67374efae9c084f0fa461478dd9e2c1e79e8d7ac73a1'
            '4b458d796859141f4be26c9bd13f3fb7cf30eca1f4cbe681c639fdc63554ce05'
            '8114f8e7b58ab0e045dfcc231c5fdc2af7a555963989ab60a79fc587412ad239'
            '38d87c2c7bdf3c65e261b07d504caa29ff56ab03dcd71ce6722e89f47e4a6e5a'
            '6a15608afc8970355cb382c88084a1f7ba27a8ad142a855cf1c76620f1182fa2'
            '54e9da9608612e0a45019ae9193c3bf637104d3a6e389cdd4751788fde4e3974'
            'd9c7c2a129b946f05146bcd36d23df4fc50f39218d4bee1324512126064fe26c'
            'f84a644dd60c8dc2c5f420b10e420c31762a023bc5843f066a55054c4168ac05'
            'b40b2535c0c7d70be98a9b673d4e4cc8a4d2097e7dd112d4676f51cb9d366d31'
            'f0caadc6fa7ab406d822923b9200be08c20de9224707a646481036cc7d61bdee'
            '9b454ac84f06c6c2babf997293ec6ab500a5c539f77b67a79d5d189462958f80'
            '6b188debec1fa19e7a6391f7eafe524afb687aedc4179c2a2ae4917238b4b95c'
            '2c6e6b859e0b1509c2dc4cfb0535c24a105d15168bdbf893dea01a680dca85f4'
            'df0081f1f0ee04c06d5ff9540adf0801fe06ae5d25544632035150f983a702bd'
            '1ba83f3558732bed059ffd67482ff1015bfab16d04fcd9c3e0c806a17ae1d990'
            '7baa6bb75ff41723039c100a92f71a446a912d9a0c479f2a354a8a4eccce84b2'
            '85e8cea26eab4f2aa6e381ebf494a94f90be9b2d7309de82c752956590ef49be'
            'c9d69e4e496ea776edfcb4e6f6d770985dd87b2b64b84db733f57f6303f67f8c'
            '9f73a2514fc1b5600f20f2747c718ffd648e0f7f67b7b13934aa2976cf085e00'
            '57b79bb853762ffbe633ce8ecbcf8c0b71a596c38ce7fd273b6455b6ca5799b8'
            '46f37a3fad41732fad28a6428967f04d2c543427cb146263c2c333d12c8da1b8'
            '0191be2cd860ce2020ed86168c74c0896b74175b2c1a37f53522c7645d566d28'
            '54508069dacc0a407831cbcb8cc8d7dd7abf8f79aa1da5a0e55d7dc63e7220fd'
            '21afda303cef3154ff558b44d54897c0d4f73aaf0fb62d2f2e0bc4749e64b305'
            'a9985e9f10a56426282314a08717f9fecc2cca3fa4ab8b75116ee2745b77c99b'
            'c5d2704515a7b7654f508ab099798773e5fd1ec6153c910e3cd0903415749283'
            '8bf14396457a00a3147b3652234e242cda0a0de37c6ee7da2a58dce380d3cbd0'
            '27de74f4645a0d68578387ce453d38e863ba9a6024e6437df117078da7e4e293'
            'b8238b9e48f08b0bb39a9cf0539a2915372d35bf72595484ec546a768f666c70'
            '71833a71ee35e2c34580ef1b1f5798e3f2351208dc4885b11ce41e63695d89c6'
            'a71b7264ff118167a3ec5d57fff69a005e2edba26db03cdf6eba0a3e11bf4c2a'
            '1ac0a034e1bf2362630541a45d42a6d227201ff858fa3c033608700eae098423'
            '41e6d48d43641af96608626286fb583cbdc39ba52c3e73d46b4368567a917675'
            '5745f901ac56aac4134b476dff12a1f9e30901eceac66dc5940f2b02219579b1'
            '20576541e0cbaf7938014888f94fa432383f9efed93015908c2bcd5f6c0f393e'
            'fb8dcc0d484f3dc1b88fb0fa9f1d72110480d494b3d88b807708de7bae2a3d11'
            '5b59a4cb83d762ae21af40e2036ebf4753e8009642ad9ff5ccca102169e2da5f'
            '5b9a7eb4ef4564c56fd403aa86e61d024c46102425410947f7a3806b255d75db'
            '17f76e94f257253eb6fc45ded98a2771704914890139473c002d16f2faf576d8'
            'f7a61c4bf41450c49e8addb7c9b1694929f4dceecec363af5e17f37273690f25'
            'd67717a6fe84e21bc580443add16ec920e6988ca067041d0461c641f75074a8c'
            '7ec8ed603c90dce82de8c4bbd2e193978ca5a2d5ee873129093ef726cfc83617'
            'be47c600e10740eb7f7d86ce1979659f63742cf22f7478493fac1978d7af73f0'
            'dc0d47a551387908732e22836963f2f75004a4ef9d8c9ccbb5e92140de6f7670'
            'e52ecd76827eb67261a77e1012463884d1310204756460a823a20aebb0c0588e'
            '3b6ef63deb43c7cc0d5f688493183edd435adbeacfae4d4bee8916dcff6f32c1'
            '0c95691be503341786035fe13a43436e390b8d09705b59fc8cdda79573d2ee52'
            '2976bcc8aa81f0c52e6a6d359b352c7d686d8fb83ab6208666dff93cd9bae7b5'
            '062d076f213aa83fa8ca66d7e2df04084fe51149a30f0bc1f45d13bd2bc1bbe6'
            '73257101e87a5fc46c6713f9820a0f908aefcf5723f02edd5e6943a3f3a74d2a'
            'e9aa9011e0e5f5dea80f6f472e98885d709c26b5d97ba3367e3cdc5279c82692'
            '0d06bf8b0c06bdfc9bf12eabc6ec901bb7ad82d30b94666b21beca7dc68734de'
            '44f059d5e123ab29e68b2fafe7c13635cbbc2ada10a986e06cf9590b4af7422a'
            'a4a1c1e39156e36be0fa5acbd661c6803af1c4b174b4396ee6d5cc402690e937'
            'c061bb6fdc24c6d18540749c11b200c04f64c70fbfad82089845ea7da3737166'
            '93bcac45da2480121d9b4c16637213f70904db3de8c5de40688ad4da5c91adf8'
            'be914aa3ed107a565bc4c7f8cffe3ea654fb26dac629d7d5c7c8d2d5184c8f06'
            '5eba94a47b790275719ccddd55d8f2bed63e8aec3cecfa275de4f55f14b1da41'
            '428233facc936029343ba242431160388ea79f97827f705e7e5c3e416c7569e7'
            '227b33bbd931be79496e17167ac5bb77666566ae54f353495ace661397f08e05'
            '502a3e4f2306e70d1b564fe176001b4887d3d880927b4cffd99bb0905f41ad13'
            '23734de4b5b1a2055250d89de273d82c80481ba82d5fbd8b73fd49d76d22dc7f'
            'c8925aac996692c572eb2e99779b6e300d54d335b784c72d5d95525763588874'
            '043339809dc45ad79dea485272876ede61e7b8e99168ae36c8d6a674b6bee7bd'
            'a18618e0c3ba928b8676820a30ae08367353901ee4592bfc4a12038bd538c9dc'
            '7596be2753f0f07db0facdc65d0ff69d7e4e35d78414f609249158b2ba984ce6'
            '3960ec38cfc8601b0226765cce929d5da6158000bef4af471e530ec082a4cdb1'
            'bbb45632caf8a524a56a198bfe43970a2d8ab647920748085e6e18d05c255f7d'
            '25e9b258c881453ecad9f6bcf46131552824823d74db0fad0bc106b74eca606f'
            'dd735bcd83484e3ce4f4ecbb2ced911b69001f611a3f997e5f6dc8dde07c3c98'
            '16a448e3d6ff7970a1834fa894a2d12608e5ba711c2e1ac3fa2b02afcdbacf51'
            'b909f54e19c1183ecc00f6a9bc0d53c8963af75dde7a3cd4499eca0949c61e74'
            '4d4486623e4ed1c8d6f8a53601681515debe424170635e3434e736a0a4b50b24'
            '5938c3f1961434d506f5918c11ddffa7898d3690008db67f506f29c17092ef04'
            '8226072a7c1039bd86fece79137bceccfa17cb67c8ce7e09a84c2a1bb4898338'
            '5e711e62b76db4ee39209dc7171ccb0d664f46d10e0ebd7a08af952c5eb6f9c3'
            'a476b34af18296df7d6e61b786affa451b845d7c9c05aadd9423569330251e66'
            'da467ca42c4ccd032c5c96d159391ce69df36eeff3a1153ecb6bf590cbb5111c'
            '8ea245744db3d107dfa877cc0b80627f17e557179ecce49fe5017870e78aee37'
            '811a4fd7d47b253a5d4177bfbe10ed91ab829b1637e65a98f75fe444a75297f3'
            '0c2a967164bd08402b4c34681382b10893bf2db60a5536d0aa412ae15bd23b15'
            '64502ba02a5111b8196738798c82c27cc50413e2a430c9ed55f7472c1782113e'
            'c975ea00e96f19965d765943d05a989d7b0f77f505d82c631495856ed65f1fdd'
            '9bad0297e838eee957dee53cef0c5e7afe82729bdd7d2c20ebbdf305d2809b7e'
            '3e9d1a0d92061dea66ae19b98a5024ae791b3f4cb0d55e73d215fa262e0bb7e2'
            '9a18b9169963146986d0eff98517293c19526b291fee5057cbe6cb2ba5beb283'
            'ca295f4cfe9f2d9b1da78bab36e0ffb34fc04b156c6fe1e5bcce9bb0fe774f86'
            '812ea1191474003958be3f6d20a2fc0a26a9376606eaa5844b265080de49ea0a'
            'e6096b025b3569a51346c01a9123f3ab21bd5de0e465abc17bdad3e028d6767e'
            'd0c44f01ae4768a6366508514c3e21a3a8c78989d97d8eeb558f06f74b73350e'
            'd56dc697a5de20ebcdd45c52d90e443c1220db0ab240bf74701f9af1f7c41e24'
            'd55d01bb4ad834d8552c28e1b4bf72ccf62287aec665c26c46fd2f3d1d30951e'
            '5cf483af16d0228524bf4050532e5d3ac455fd11d74b3f82f53734964c197093'
            '889f7af2e6e5f7a14ed27dce5d9f6c79688aa10d6ef37c762d0a836e67a726af'
            '796dc7e97b357f9c2ad10044d01a86d3fb49cf80e3693011eb055c466c995de0'
            '16d0c83e99ca3cd56a85966c4ff2c5f0c0f8a5a7140a7594b2ec3e404c8e96a0'
            '2e2fabd71aa30f0d7039b879ee58441a791e095a6656064eb9d4a84a071e5e8f'
            'ca2a6662eb28f02e80bcde33f3dfdd8dbf7369feae36f326b3661e2d9f84f865'
            'ae2051f7559be3cbb0c49d934d032fa69e782decda073293ae0b910ce0b9208a'
            'd6a1a92bfd1249eccdd18a657189ed1f66704db429053b6d6c93b296eb9ef074'
            '0887451fa52c4685137a6df87720e607098ba81f14e7dd6f3d9c5319a558d59b'
            '24c59b2dfc21a33ba764e9f01f451c70ad5357c7a8fe063858c6aee9717dcdd9'
            '7a28f44c05216ebc8060a751a9009689f0d1f17c0b26831c491987468bf4424f'
            '7d441a4c7275bcb6f1582b8014416a131d67d36fee395ed2ac75343ad3ba4ec9'
            '78d8d6efd67e592f17374aa0035f09f5a3c27f64874786f96409c18f5969e963'
            '9cfe9ef1cfd79b04810f57581bba7026e71437f4a21ac26a42f34b70a5b0bc32'
            'b277b647c2833c83310e8e23a471b13a9d85975f90f271c35277173784b50960'
            '10c5d214d0b2c516a3b024ff2d950b758b07c7b8a47cf31f99b0db810dbd98d3'
            '6c434b78048c1224834737c1ffad15c86337520eb2431c1d7a0ca86138179445'
            '98512de489c64bc0b2b224713c8925fb7e89a8bed70271fb182279cbe46b36a0'
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
