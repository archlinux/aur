# sorry about the mess

pkgname=infocom
pkgver=1989
pkgrel=3
pkgdesc="Infocom interactive fiction"
url="http://gallery.guetech.org/greybox.html"
arch=('any')
license=('none')
depends=('frotz')
makedepends=('unzip')

optdepends=('infocom-docs: docs and feelies'
	    'zork: no pdp-10 should be without one!')

noextract=('infocom.6.gz')

options=('!strip')


_mirror=('http://mirrors.ibiblio.org/interactive-fiction')
source=('http://archive.org/download/Infocom_Z-Machine_TOSEC_2012_04_23/Infocom_Z-Machine_TOSEC_2012_04_23.zip'

	'http://eel.sdf.org/pit/infocom.6.gz'

	'http://brooknet.no-ip.org/~lex/public/amfvcodewheel/amfv.sh'

	"http://waxy.org/random/software/milliways/milliways_release"{15.z4,184.z6}

	"${_mirror}/infocom/info/infobugs.txt"

	"$_mirror/infocom/hints/invisiclues/"{AMFV,Ballyhoo,BeyondZork,Bureaucracy,Cutthroats,Deadline,Enchanter,HHGG,HollywoodHijinx,Infidel,LGOP,LurkingHorror,Moonmist,Planetfall,PlunderedHearts,Seastalker,Sorcerer,Spellbreaker,Starcross,Stationfall,Suspect,Suspended,Trinity,Wishbringer,Witness,ZorkI,ZorkII,ZorkIII}".inv"

	"http://infodoc.plover.net/screenread/"{amfv,beyondzo,bureaucr,planetfa,stationf,wishbrin,zork1,zork2,zork3}".txt"

	"${_mirror}/infocom/articles/NZT-"{advice,answers,Briggs,falcon,Fooblitzky,gamedev,GUEtech,horoscope,music,parser,Suspect,Zorkhistory}".txt"
	"${_mirror}/infocom/articles/NZT-"{atomic,InfoBets,name,Sasha,Sandusky,testing,Witness,ZQ}"-text")


md5sums=('2835beb6e8ba951dea652fe37dfdbe78'

	 'cc7ac5f1253e1c505b1de26e6e907a7b'

	 '1c9254d6bca44300c9b9f041408996a7'

	 # milliways
	 'c5d2843439321a03b9775db05f809719'
	 'a0af8516e821ce20c7e814303eec3dbc'

	 # infobugs
	 'b4fb869a60fd4395b0241cab929964e6'

	 # invisiclues
	 '97b9d62a3166371c74d3ead355d671dd'
	 '272182654dd4898692929a1869bf2cfc'
	 '01a39ea7ee1c8c1e67fae1b9ed14b80d'
	 '78a0b23f062978c994da1a298bb27aaa'
	 '4b3119fb7a34416fb297b4b75868fb55'
	 '7e3bf2cd4f7354f5d9737a25bc5adf22'
	 '06582d9b0fbbbe9e5b8de49c93616aa6'
	 '76150fb706e20a250e1c02c515c9bb84'
	 '5e22bd66189c43bf3916b45722dffe44'
	 'ab18fc978d24b597ca6b3a770c634f04'
	 '19c80b32c884b533fb3aa62af6a72c8e'
	 'e14707a6ca0a78965526abddcc06154e'
	 '78b66f635b9f3f4f10ce3cbc391961e0'
	 '6a7a26847128b82072d1eda1e5c33e78'
	 '41034d21c087bdbd07742cb7a1c198de'
	 '8250614a36542dfe543eb84aa1a28f8d'
	 'a02d66d64a2d3e77427bafd08037d23b'
	 '38cd0c6a0e649005166c089e4fb078a5'
	 'bc10bdd16613baea4fac86c25f28ac48'
	 '819dfd95d346066c646927066134a446'
	 '67a0a9414c69332ce99182baee050139'
	 '34bc52b353aa9cbec3b290bc1364374b'
	 'c7af32faaf634762844315c342f2204b'
	 '061e21d106ccb22c25b65315390a8d70'
	 'bcf1b4834a7b554609ec0fcaab9c2418'
	 'fe057b32ca6193f78b087874a2834a85'
	 '79f0829d5387858ec33569e84b3ff65b'
	 '86dafe47e5bf8745f9d07a63b4b867a4'

	 # manuals
	 '1018c3063acdd75cce47f03a6f9fcc0f'
	 'b4a8dab71bfd11609d5b455fc1902747'
	 '5db7b896da42445fc6b7468697b83f00'
	 '8d6a10696114250ad7f5d2812b5eb3e4'
	 '815d2694aee3a6a697051aa91eb7cd5b'
	 '42f1f53bb214e470080070b13e91680f'
	 'e14dfaaad922bd432ed15839ff137514'
	 'f15094d45ea799c36d5bcad0f7f913c4'
	 'b5ad33ec0b019fef1533937b1d3644be'

	 # new zork times
	 '5b399d593921293bdd46a1463a38ac10'
	 '33855a7ac9b78c11d1727c8e8779f9c0'
	 '51a27304aa1c3a25a3ee8f6a022be4ce'
	 'f0a77e232cb229208e6ce76136405998'
	 '8c2f6dc45e89d7ee392c56480877c0d5'
	 '94f9ccdc2d3e49a63160a2b7bb5e098e'
	 '37e719d33d7d65e449ea6ba5ed395b75'
	 '1ed607ee5a5d7840939212a06942c128'
	 '704a36d7586f9c5683b6cd364123ecb4'
	 '226e48a062ed5e3983d5b45c59d4476b'
	 '078cada576329d63044be2497e4d6cb8'
	 '32828c0babb0b8d36b83540e0cedbe0c'

	 '78125c3efc75dd1cdf7d75c5a142697e'
	 '3306d4a8ac65fe1538dbcb5e1ffc3212'
	 '59331822a0356982d245da0c6ec3403e'
	 '0063052bce2a3769f84d46ff22e6ee86'
	 'f54e6d3d97c1964ad9e9272a04577d9c'
	 '73a3516d353d2596a2930cf2dfea9c04'
	 'b89062cb8d47f1dda8db63ea90c60f76'
	 'e7a1d3926dd7c6d34794b5afa16c8f39')


package() {


    _tmpzip() {

        cd "${srcdir}"/"Infocom Z-Machine [TOSEC]/Games"

        unzip "${1}" -d foo > /dev/null 2>&1
        mv foo/"${2}" "${srcdir}"/"${3}"
        rm -r foo && cd "${srcdir}"
        idest="${pkgdir}/${game_loc}/${3}"
        install -Dpm644 "${3}" "${idest}"
    }


    _lnkgen() {

        ln -s /"${game_loc}"/"${1}" "${pkgdir}"/"${sym_dest}"/"${2}"
        printf "frotz /${sym_dest}/${2}\n" > "${3}"
        install -Dpm755 "${3}" "${pkgdir}"/usr/bin/"${3}"
    }


    _inv644() {

        install -Dpm644 "${1}".inv "${pkgdir}"/"${clue_loc}"/"${2}".inv
    }


    _man644() {

        install -Dpm644 "${1}".txt "${pkgdir}"/"${man_loc}"/"${1}".txt
    }



    cd "${pkgdir}"

    base_dir="opt/xyz/infocom"
    game_loc="${base_dir}/games"
    sym_dest="usr/share/infocom"
    clue_loc="${base_dir}/invisiclues"
    feel_dir="${base_dir}/feelies"
    man_loc="${base_dir}/manuals"
    nzt_loc="${base_dir}/nzt"
    

    mkdir -p "${clue_loc}"
    mkdir -p "${feel_dir}"
    mkdir -p "${sym_dest}"



    # a mind forever voyaging #

    _tmpzip 'Mind Forever Voyaging, A v77 (1985)(Infocom).zip' 'AMFV.z4' '850814-077-amfv.z4'
    _lnkgen '850814-077-amfv.z4' 'amfv.z4' 'amfv'

    ln -s /usr/bin/amfv "${pkgdir}"/usr/bin/a-mind-forever-voyaging

    install -Dpm755 amfv.sh "${pkgdir}"/"${feel_dir}"/amfv-codewheel.sh
    ln -s /"${feel_dir}"/amfv-codewheel.sh "${pkgdir}"/usr/bin/codewheel

    _inv644 'AMFV' 'amfv'
    _man644 'amfv'



    # arthur #

    _tmpzip 'Arthur - The Quest for Excaliber v54 (1989)(Infocom).zip' 'arthur.z6' '890606-054-arthur.z6'
    _lnkgen '890606-054-arthur.z6' 'arthur.z6' 'arthur'



    # ballyhoo #

    _tmpzip 'Ballyhoo v97 (1986)(Infocom).zip' 'BALLYHOO.DAT' '851218-097-ballyhoo.z3'
    _lnkgen '851218-097-ballyhoo.z3' 'ballyhoo.z3' 'ballyhoo'

    _inv644 'Ballyhoo' 'ballyhoo'



    # beyond zork #

    _tmpzip 'Beyond Zork - The Coconut of Quendor v49 (1987)(Infocom).zip' 'BEYZORK.z5' '870917-049-beyondzo.z5'
    _tmpzip 'Beyond Zork - The Coconut of Quendor v57 (1987)(Infocom).zip' 'Beyondzo.dat' '871221-057-beyondzo.z5'

    _lnkgen '871221-057-beyondzo.z5' 'beyondzo.z5' 'beyondzork'

    _inv644 'BeyondZork' 'beyondzork'
    _man644 'beyondzo'



    # border zone #

    _tmpzip 'Border Zone - A Game of Intrigue v9 (1987)(Infocom).zip' 'DATA1.DAT' '871008-009-borderzo.z5'
    _lnkgen '871008-009-borderzo.z5' 'borderzo.z5' 'borderzone'



    # bureaucracy #

    _tmpzip 'Bureaucracy - A Paranoid Fantasy v116 (1987)(Infocom).zip' 'BUREAUCR.DAT' '870602-116-bureaucr.z4'

    _lnkgen '870602-116-bureaucr.z4' 'bureau.z4' 'bureaucracy'

    _inv644 'Bureaucracy' 'bureaucracy'
    _man644 'bureaucr' 'bureaucr'



    # cutthroats #

    _tmpzip 'Cutthroats v23 (1984)(Infocom).zip' 'cutthroa.dat' '840809-023-cutthroa.z3'
    _lnkgen '840809-023-cutthroa.z3' 'cutthroa.z3' 'cutthroats'

    _inv644 'Cutthroats' 'cutthroats'



    # deadline #

    _tmpzip 'Deadline v27 (1982)(Infocom).zip' 'DEADLINE.DAT' '831005-027-deadline.z3'
    _lnkgen '831005-027-deadline.z3' 'deadline.z3' 'deadline'

    _inv644 'Deadline' 'deadline'



    # enchanter #

    _tmpzip 'Enchanter v10 (1983)(Infocom).zip' 'ENCHANTR.z3' '830810-010-enchanter.z3'
    _tmpzip 'Enchanter v29 (1986)(Infocom).zip' 'ENCHANTE.DAT' '860820-029-enchanter.z3'

    _lnkgen '860820-029-enchanter.z3' 'enchante.z3' 'enchanter'

    _inv644 'Enchanter' 'enchanter'



    # hitchhiker's guide #

    _tmpzip "Hitchhiker's Guide to the Galaxy, The v47 (1984)(Infocom)[840914].zip" 'hhgttg.z3' '840914-047-hhgg.z3'
    _tmpzip "Hitchhiker's Guide to the Galaxy, The v58 (1984)(Infocom)[851002].zip" 'HITCHHIK.DAT' '851002-058-hhgg.z3'

    _lnkgen '851002-058-hhgg.z3' 'hhgg.z3' 'hhgg'
    ln -s /usr/bin/hhgg "${pkgdir}"/usr/bin/hitchhike

    _inv644 'HHGG' 'hhgg'



    # hollywood hijinx #

    _tmpzip 'Hollywood Hijinx v37 (1986)(Infocom)[861215].zip' 'HOLLYWOO.DAT' '861215-037-hollywood.z3'
    _lnkgen '861215-037-hollywood.z3' 'hollywood.z3' 'hollywood'

    _inv644 'HollywoodHijinx' 'hollywood'



    # infidel #

    _tmpzip 'Infidel v22 (1983)(Infocom)[830916].zip' 'INFIDEL.DAT' '830916-022-infidel.z3'
    _lnkgen '830916-022-infidel.z3' 'infidel.z3' 'infidel'

    _inv644 'Infidel' 'infidel'



    # journey #

    _tmpzip 'Journey - Golden Age Trilogy Part One v30 (1989)(Infocom)[890322].zip' 'Journey.z6' '890322-030-journey.z6'
    _lnkgen '890322-030-journey.z6' 'journey.z6' 'journey'



    # leather goddesses #

    _tmpzip 'Leather Goddesses of Phobos v59 (1986)(Infocom)[860730].zip' 'LEATHER.z3' '860730-059-lgop.z3'
    _lnkgen '860730-059-lgop.z3' 'lgop.z3' 'lgop'

    ln -s /usr/bin/lgop "${pkgdir}"/usr/bin/leather

    _inv644 'LGOP' 'lgop'



    # lurking horror #

    _tmpzip 'Lurking Horror, The v221 (1987)(Infocom).zip' 'LURKING.DAT' '870918-221-lurking.z3'
    _lnkgen '870918-221-lurking.z3' 'lurking.z3' 'lurking'

    _inv644 'LurkingHorror' 'lurking'



    # milliways #

    install -Dpm644 'milliways_release15.z4' "${pkgdir}"/"${game_loc}"/'880512-015-milliways.z4'
    install -Dpm644 'milliways_release184.z6' "${pkgdir}"/"${game_loc}"/'890412-184-milliways.z6'



    # mini zork #

    _tmpzip 'Mini-Zork I - The Great Underground Empire v34 (1988)(Infocom)[871124].zip' 'minizork.z3' '871124-034-minizork.z3'



    # moonmist #

    _tmpzip 'Moonmist v9 (1986)(Infocom)[861022].zip' 'MOONMIST.DAT' '861022-009-moonmist.z3'
    _lnkgen '861022-009-moonmist.z3' 'moonmist.z3' 'moonmist'

    _inv644 'Moonmist' 'moonmist'



    # nord and bert #

    _tmpzip "Nord and Bert Couldn't Make Head or Tail of It v19 (1987)(Infocom)[870722].zip" 'NORDANDB.z4' '870722-019-nordandb.z4'
    _lnkgen '870722-019-nordandb.z4' 'nordandb.z4' 'nordbert'



    # planetfall #

    _tmpzip 'Planetfall v20 (1983)(Infocom)[830708].zip' 'PLANFALL.z3' '830708-020-planetfall.z3'
    _tmpzip 'Planetfall v37 (1983)(Infocom)[851003].zip' 'Planetfa.dat' '851003-037-planetfall.z3'
    _lnkgen '830708-020-planetfall.z3' 'planetfall.z3' 'planetfall'

    _inv644 'Planetfall' 'planetfall'
    _man644 'planetfa'



    # plundered hearts #

    _tmpzip 'Plundered Hearts v26 (1987)(Infocom)[870730].zip' 'PLUNDERE.DAT' '870730-026-plundere.z3'
    _lnkgen '870730-026-plundere.z3' 'plundere.z3' 'plundere'

    _inv644 'PlunderedHearts' 'plundere'



    # seastalker #

    _tmpzip 'Seastalker v86 (1984)(Infocom)(beta)[840320].zip' 'SEASTALK.z3' '840320-86b-seastalk.z3'
    _tmpzip 'Seastalker v15 (1984)(Infocom)[840501].zip' 'SEAS.z3' '840501-015-seastalk.z3'

    _lnkgen '840501-015-seastalk.z3' 'seastalk.z3' 'seastalk'

    _inv644 'Seastalker' 'seastalker'



    # sherlock #

    _tmpzip 'Sherlock - The Riddle of the Crown Jewels v21 (1987)(Infocom)[871214].zip' 'SHER.z5' '871214-021-sherlock.z5'
    _lnkgen '871214-021-sherlock.z5' 'sherlock.z5' 'sherlock'



    # shogun #

    _tmpzip 'Shogun - A Story of Japan v322 (1988)(Infocom)[890706].zip' 'SHOGUN.ZIP' '890706-322-shogun.z6'
    _lnkgen '890706-322-shogun.z6' 'shogun.z6' 'shogun'



    # sorcerer #

    _tmpzip 'Sorcerer v4 (1984)(Infocom)[840131].zip' 'SORCERER.z3' '840131-004-sorcerer.z3'
    _lnkgen '840131-004-sorcerer.z3' 'sorcerer.z3' 'sorcerer'

    _inv644 'Sorcerer' 'sorcerer'



    # spellbreaker #

    _tmpzip 'Spellbreaker v63 (1985)(Infocom)[850916].zip' 'spelbrkr.z3' '850916-063-spelbrkr.z3'
    _tmpzip 'Spellbreaker v87 (1985)(Infocom)[860904].zip' '1.z3' '860904-087-spelbrkr.z3'

    _lnkgen '860904-087-spelbrkr.z3' 'spelbrkr.z3' 'spelbrkr'

    _inv644 'Spellbreaker' 'spelbrkr'



    # starcross #

    _tmpzip 'Starcross - Interlogic Science Fiction v15 (1982)(Infocom)[820901].zip' 'starcros.z3' '820901-015-starcros.z3'
    _tmpzip 'Starcross - Interlogic Science Fiction v17 (1982)(Infocom)[821021].zip' 'Starcros.dat' '821021-017-starcros.z3'

    _lnkgen '821021-017-starcros.z3' 'starcros.z3' 'starcros'

    _inv644 'Starcross' 'starcros'



    # stationfall #

    _tmpzip 'Stationfall v107 (1987)(Infocom)[870430].zip' 'Stationf.dat' '870430-107-stationf.z3'
    _lnkgen '870430-107-stationf.z3' 'stationf.z3' 'stationfall'

    _inv644 'Stationfall' 'stationf'
    _man644 'stationf'



    # suspect #

    _tmpzip 'Suspect - An Interactive Mystery v14 (1984)(Infocom)[841005].zip' 'SUSPECT.DAT' '841005-014-suspect.z3'
    _lnkgen '841005-014-suspect.z3' 'suspect.z3' 'suspect'

    _inv644 'Suspect' 'suspect'



    # suspended #

    _tmpzip 'Suspended - Interlogic Science Fiction v7 (1983)(Infocom)[830419].zip' 'SUZPEND.z3' '830419-007-suspend.z3'
    _tmpzip 'Suspended - Interlogic Science Fiction v8 (1983)(Infocom)[830521].zip' 'Suspended.z3' '830521-008-suspend.z3'

    _lnkgen '830521-008-suspend.z3' 'suspend.z3' 'suspended'

    _inv644 'Suspended' 'suspend'



    # trinity #

    _tmpzip 'Trinity v12 (1986)(Infocom)[860926].zip' 'TRINITY.z4' '860926-012-trinity.z4'
    _lnkgen '860926-012-trinity.z4' 'trinity.z4' 'trinity'

    _inv644 'Trinity' 'trinity'



    # wishbringer #

    _tmpzip 'Wishbringer - The Magick Stone of Dreams v68 (1985)(Infocom)[850501].zip' 'WISHBRIN.z3' '850501-068-wishbrin.z3'
    _tmpzip 'Wishbringer - The Magick Stone of Dreams v69 (1985)(Infocom)[850920].zip' 'WISHBRIN.DAT' '850920-069-wishbrin.z3'

    _lnkgen '850920-069-wishbrin.z3' 'wishbrin.z3' 'wishbringer'

    _inv644 'Wishbringer' 'wishbrin'



    # witness #

    _tmpzip 'Witness, The - An Interlogic Mystery v13 (1983)(Infocom)[830524].zip' 'witness.z3' '830524-013-witness.z3'
    _tmpzip 'Witness, The - An Interlogic Mystery v22 (1983)(Infocom)[840924].zip' 'WITNESS.DAT' '840924-022-witness.z3'

    _lnkgen '840924-022-witness.z3' 'witness.z3' 'witness'

    _inv644 'Witness' 'witness'



    # zork 0 #

    _tmpzip 'Zork Zero - The Revenge of Megaboz v393 (1988)(Infocom)[890714].zip' 'Zork0.dat' '890714-393-zork0.z6'



    # zork 1 #

    _tmpzip 'Zork I - The Great Underground Empire v15 (1980)(Infocom)[UG3AU5].zip' 'ZORK1.DAT' '801200-015-zork1.z2'
    _tmpzip 'Zork I - The Great Underground Empire v88 (1983)(Infocom)[840726].zip' 'Zork1.dat' '840726-088-zork1.z3'
    _tmpzip 'Zork I - Das Grosse Unterweltreich v3 (1986)(Infocom)(de)(beta)[h][880113].zip' 'zork1_3Ger.z5' '880113-003-de-zork1.z5'

    _inv644 'ZorkI' 'zork1'
    _man644 'zork1'



    # zork 2

    _tmpzip 'Zork II - The Wizard of Frobozz v7 (1981)(Infocom)[UG3AU5].zip' 'Z2.DAT' '811100-007-zork2.z2'
    _tmpzip 'Zork II - The Wizard of Frobozz v48 (1983)(Infocom)[840904].zip' 'zork2.z3' '840904-048-zork2.z3'

    _inv644 'ZorkII' 'zork2'
    _man644 'zork2'



    # zork 3

    _tmpzip 'Zork III - The Dungeon Master v10 (1982)(Infocom)[820818].zip' 'ZORKIII.z3' '820818-010-zork3.z3'
    _tmpzip 'Zork III - The Dungeon Master v17 (1982)(Infocom)[840727].zip' 'Zork3.z3' '840727-017-zork3.z3'

    _inv644 'ZorkIII' 'zork3'
    _man644 'zork3'



    # sampler #

    _tmpzip 'Four-In-One Sampler I v26 (1984)(Infocom)[840731].zip' 'SAMPR26.z3' '840731-026-sampler.z3'
    _lnkgen '840731-026-sampler.z3' 'sampler.z3' 'butterfly'



    # manpage #

    install -Dpm644 infocom.6.gz "${pkgdir}"/usr/share/man/man6/infocom.6.gz

    printf '#!/bin/sh\n' > infocom.hlp
    printf 'man infocom\n' >> infocom.hlp
    install -Dpm755 infocom.hlp "${pkgdir}"/usr/bin/infocom



    # infobugs #

    install -Dpm644 infobugs.txt "${pkgdir}/${base_dir}"


    # new zork times #

    install -Dpm644 NZT-advice.txt "${pkgdir}/${nzt_loc}"/advice.txt
    install -Dpm644 NZT-answers.txt "${pkgdir}/${nzt_loc}"/answers.txt
    install -Dpm644 NZT-atomic-text "${pkgdir}/${nzt_loc}"/atomic.txt
    install -Dpm644 NZT-Briggs.txt "${pkgdir}/${nzt_loc}"/briggs.txt
    install -Dpm644 NZT-falcon.txt "${pkgdir}/${nzt_loc}"/falcon.txt
    install -Dpm644 NZT-Fooblitzky.txt "${pkgdir}/${nzt_loc}"/fooblitzky.txt
    install -Dpm644 NZT-gamedev.txt "${pkgdir}/${nzt_loc}"/gamedev.txt
    install -Dpm644 NZT-GUEtech.txt "${pkgdir}/${nzt_loc}"/gue.txt
    install -Dpm644 NZT-horoscope.txt "${pkgdir}/${nzt_loc}"/horoscope.txt
    install -Dpm644 NZT-InfoBets-text "${pkgdir}/${nzt_loc}"/infobets.txt
    install -Dpm644 NZT-music.txt "${pkgdir}/${nzt_loc}"/music.txt
    install -Dpm644 NZT-name-text "${pkgdir}/${nzt_loc}"/name.txt
    install -Dpm644 NZT-parser.txt "${pkgdir}/${nzt_loc}"/parser.txt
    install -Dpm644 NZT-Sandusky-text "${pkgdir}/${nzt_loc}"/sandusky.txt
    install -Dpm644 NZT-Sasha-text "${pkgdir}/${nzt_loc}"/sasha.txt
    install -Dpm644 NZT-Suspect.txt "${pkgdir}/${nzt_loc}"/suspect.txt
    install -Dpm644 NZT-testing-text "${pkgdir}/${nzt_loc}"/testing.txt
    install -Dpm644 NZT-Witness-text "${pkgdir}/${nzt_loc}"/witness.txt
    install -Dpm644 NZT-Zorkhistory.txt "${pkgdir}/${nzt_loc}"/zorkhistory.txt


#   printf bG9yZWxlaSBsZWUKZWVsQHNkZi5vcmcKOGYzYiAgIDg2YTgK | base64 -d -

}
