# Maintainer: Eugen Zagorodniy <https://github.com/ezag>

pkgname=noforth
pkgver=190519
pkgrel=2
pkgdesc='Interactive 16-bit stand-alone forth for MSP430'
arch=('any')
url=http://home.hccnet.nl/anij/nof/noforth.html
license=('GPL3')

source=(
    'https://home.hccnet.nl/anij/nof/ihxx/noforths%20149.zip'
    'https://home.hccnet.nl/anij/nof/ihxx/noforths%202433.zip'
    'https://home.hccnet.nl/anij/nof/ihxx/noforths%205739.zip'
    'https://home.hccnet.nl/anij/nof/ihxx/noforths%2059x9.zip'
    'https://home.hccnet.nl/anij/nof/ihxx/noforths%205994.zip'
    'https://home.hccnet.nl/anij/nof/ihxx/noforths%202553.zip'
    'https://home.hccnet.nl/anij/nof/ihxx/noforths%202955.zip'
    'https://home.hccnet.nl/anij/nof/ihxx/noforths%202x55.zip'

    'https://home.hccnet.nl/anij/nof/noforth%20tools.f'
    'https://home.hccnet.nl/anij/nof/noforth%20c%20more%20standard%20words.f'
    'https://home.hccnet.nl/anij/nof/noforth%20v%20more%20standard%20words.f'
    'https://home.hccnet.nl/anij/nof/noforth%20asm.f'
    'https://home.hccnet.nl/anij/nof/noforth%20das.f'
    'https://home.hccnet.nl/anij/nof/aux430asm.f'

    'https://home.hccnet.nl/anij/nof/boards/msp430f149%20minim%20core%20board.pdf'
    'https://home.hccnet.nl/anij/nof/boards/msp430f149%20dupont%20board.pdf'
    'https://home.hccnet.nl/anij/nof/boards/msp430f149%20mini-v3%20board.pdf'
    'https://home.hccnet.nl/anij/nof/boards/msp-exp430fr2433%20experimenter%20board.pdf'
    'https://home.hccnet.nl/anij/nof/boards/msp-exp430fr5739%20experimenter%20board.pdf'
    'https://home.hccnet.nl/anij/nof/boards/msp-exp430fr5969%20experimenter%20board.pdf'
    'https://home.hccnet.nl/anij/nof/boards/msp-exp430fr5994%20experimenter%20board.pdf'
    'https://home.hccnet.nl/anij/nof/boards/msp430g2553%20launchpad.pdf'
    'https://home.hccnet.nl/anij/nof/boards/msp430g2553%20egel%20kit.pdf'
    'https://home.hccnet.nl/anij/nof/boards/msp-exp430fr2355%20experimenter%20board.pdf'

    'https://home.hccnet.nl/anij/nof/howto/howto-fr2355.pdf'
    'https://home.hccnet.nl/anij/nof/howto/msp-exp430fr2355%20board%20as%20programmer.pdf'
    'https://home.hccnet.nl/anij/nof/howto/howto-fr59xx-linux.pdf'
    'https://home.hccnet.nl/anij/nof/howto/howto-linux.pdf'

    'https://home.hccnet.nl/anij/nof/noforth%20documentation.pdf'
    'https://home.hccnet.nl/anij/nof/noforth%20asm.pdf'
    'https://home.hccnet.nl/anij/nof/session1.pdf'
    'https://home.hccnet.nl/anij/nof/session2.pdf'
    'https://home.hccnet.nl/anij/nof/input%20stream.pdf'
    'https://home.hccnet.nl/anij/nof/commacode.pdf'
    'https://home.hccnet.nl/anij/nof/commacode%202.pdf'
    'https://home.hccnet.nl/anij/nof/how%20noforth%20is%20made.pdf'
    'https://home.hccnet.nl/anij/nof/hardware%20explorer.pdf'
    'https://home.hccnet.nl/anij/nof/launchpad%20experimenteerkit.pdf'
)
sha256sums=(
    'b90a3d962529fb81b37617579faca2a75683395732cd660730ebe25de2b22fa9'
    '64f3f4cd315d76b46578a8166542e707df26a7269724fb9be139a8f1c2789d66'
    '782ff18185465304dbbc2018d0c7572bc1e885644ce276a7014bca8187eb7970'
    '728c1318cccf669b8f88cb3bbafdf7ecba4a4b82fa4f6647f9a7c8963e0b0ee7'
    '4b2925e677535e56e09eb504bab240e3286d87a5eb16d88fcaf8b4a3b8759ee2'
    '4a06ffde951d5653d2571a10e6d7d40979beb1748a151ec102a86b6c4c3acc42'
    'a8d9d4d52a09cebccb981da103e64e8e0677cf04a3903d4358951a802a0b4655'
    '1af1f66991070379f592fb88655b3c68c47cb156c55f89453e1c4c671f465e74'

    'ee9ff459c2bdfb92935116fd71c399548836eaf25cf46dd9dc04156bfab0294a'
    'b54be668d56ea39a4f54a70ed2f0e8ed54ce79e7b13aea99f7e7b82c911c588c'
    '3816345e5122ad6abadb2c7e89a83c9d4935b794650e569c88ca5b055d6569cf'
    'dced05534c1e82355af10646d790e9a05d0a88a6037ee94b32d065e85767d938'
    'cff08165e3f1f12acd887965936a0237c8d790ca2e72cca26ff0fdb86239f490'
    '433acf3d5c9486b416f7ee02947de4cf97222cdb03f3cf8d22ad87b305e1a3e2'

    '87cda529587603eed15691c19c2af3dd088bb27dcff15f3a9e051e3f50341beb'
    'd7d655518842bafe8bd2c979a6faf3c321adfecfb71b92279ff3612841571e53'
    'b6ac38fef53a4852d7a9499e1727b3a739ffc8e74660c02b1bacf03adfb70fab'
    '73719aeaedb07c172ab5bc9f16eb6f456a0a23ff68e2e3a02a44e6fdba5b013c'
    '502712f59e7b6c596d7bd4499d4913023a61284d37f7259b3c3ab442eae6cc0f'
    '6625180b04e6ea97e69ef86fe5d7169e114fd47fa26cfa1437e8e54c75b65319'
    'bc6b5b4d1af917a077ae5ef592b28e5be247591241444437054741f64322c8cb'
    'e013cc12e831ad26be3a462da34e4766f1e0f5ec3d05f2c34a83051a48a512a5'
    '68e7493a18f4c0577b0eb9a0659232a014bf0aaa337043691b12a44c2065e9da'
    'd763e3213b869efcb34a0593bb0d32f774845b00b302e6527b0f5f63730177b5'

    'd85bcb373465157594a79c7fe92938b33320cc092f75e9001065edd0529c3cef'
    'e3f7637220b1af1c2316a0a942a3bc40ed2a075797de59d294d36d40179a3c43'
    'd3bdba398884e3b6b15d26b2d35a4a4f7ceca22a95616ee87549038f19779e6b'
    '278faf18867e0e8c0969660fdcfc0d0bba8f3c15d05274963d2edd31fe9a6db4'

    '9b320cd77fc96529ae9775f90f0714cb08f0f0c023d4bfcad80c1bed711904ae'
    '46ca9dff5989a4e8674963e556a0ba0b923ca7d7d7d7ddbd863fa584f8bbc575'
    '304f9b87a08ac1e212372c14b5130c0724674e9f995f7e2b2559cc93e669a169'
    'ee4f93d5a72a9e969a697b0e2db9025028ca798e6ea38e6579be19bc44c049a9'
    '93fc52b739fdb9fc6bc885967d32134ed3c147da1e5b772f5477e24a9ae728ff'
    '89c2fd87b19c09fc28fe74f3126011de71197ca9177813bed5b253bcc8c4f018'
    '2fdd8eb1a517f705ce9070b0e37b2bc9808caedd25cdba964c90d5b5854e81bf'
    'f93ab6c36330a222b4ff70436b5a99c4ba782ce9b5755956b5be58fe3a0f2afc'
    'b3b8b109bd2fe7b1a2eefbf43a5cf46432730ce0f604f9247850de44823501f8'
    '289b2716efd67a61d8a9a58a70f577852f3208ae8a0796481fe35bb7b7787940'
)

package() {
mkdir -p "$pkgdir/usr/share/$pkgname"
cd "$_"

    install -m644 "$srcdir/noforths 149/noforth c149 190519.hex" 149-c.hex
    install -m644 "$srcdir/noforths 149/noforth v149 190519.hex" 149-v.hex
    install -m644 "$srcdir/noforths 149/noforth cc149 190519.hex" 149-cc.hex
    install -m644 "$srcdir/noforths 149/noforth vv149 190519.hex" 149-vv.hex

    install -m644 "$srcdir/noforths 2433/noforth c2433 190519.hex" 2433-c.hex
    install -m644 "$srcdir/noforths 2433/noforth v2433 190519.hex" 2433-v.hex
    install -m644 "$srcdir/noforths 2433/noforth cc2433 190519.hex" 2433-cc.hex
    install -m644 "$srcdir/noforths 2433/noforth vv2433 190519.hex" 2433-vv.hex

    install -m644 "$srcdir/noforths 5739/noforth c5739 190519.hex" 5739-c.hex
    install -m644 "$srcdir/noforths 5739/noforth v5739 190519.hex" 5739-v.hex
    install -m644 "$srcdir/noforths 5739/noforth cc5739 190519.hex" 5739-cc.hex
    install -m644 "$srcdir/noforths 5739/noforth vv5739 190519.hex" 5739-vv.hex

    install -m644 "$srcdir/noforths 59x9/noforth c59x9 190519.hex" 59x9-c.hex
    install -m644 "$srcdir/noforths 59x9/noforth v59x9 190519.hex" 59x9-v.hex
    install -m644 "$srcdir/noforths 59x9/noforth cc59x9 190519.hex" 59x9-cc.hex
    install -m644 "$srcdir/noforths 59x9/noforth vv59x9 190519.hex" 59x9-vv.hex

    install -m644 "$srcdir/noforths 5994/noforth c5994 190519.hex" 5994-c.hex
    install -m644 "$srcdir/noforths 5994/noforth v5994 190519.hex" 5994-v.hex
    install -m644 "$srcdir/noforths 5994/noforth cc5994 190519.hex" 5994-cc.hex
    install -m644 "$srcdir/noforths 5994/noforth vv5994 190519.hex" 5994-vv.hex

    install -m644 "$srcdir/noforths 2553/noforth c2553 190519.hex" 2553-c.hex
    install -m644 "$srcdir/noforths 2553/noforth v2553 190519.hex" 2553-v.hex
    install -m644 "$srcdir/noforths 2553/noforth cc2553 190519.hex" 2553-cc.hex
    install -m644 "$srcdir/noforths 2553/noforth vv2553 190519.hex" 2553-vv.hex
    install -m644 "$srcdir/noforths 2553/noforth c-2553 190519.hex" 2553-c-.hex
    install -m644 "$srcdir/noforths 2553/noforth v-2553 190519.hex" 2553-v-.hex
    install -m644 "$srcdir/noforths 2553/noforth cc-2553 190519.hex" 2553-cc-.hex
    install -m644 "$srcdir/noforths 2553/noforth vv-2553 190519.hex" 2553-vv-.hex

    install -m644 "$srcdir/noforths 2955/noforth c2955 190519.hex" 2955-c.hex
    install -m644 "$srcdir/noforths 2955/noforth v2955 190519.hex" 2955-v.hex
    install -m644 "$srcdir/noforths 2955/noforth cc2955 190519.hex" 2955-cc.hex
    install -m644 "$srcdir/noforths 2955/noforth vv2955 190519.hex" 2955-vv.hex
    install -m644 "$srcdir/noforths 2955/noforth c-2955 190519.hex" 2955-c-.hex
    install -m644 "$srcdir/noforths 2955/noforth v-2955 190519.hex" 2955-v-.hex
    install -m644 "$srcdir/noforths 2955/noforth cc-2955 190519.hex" 2955-cc-.hex
    install -m644 "$srcdir/noforths 2955/noforth vv-2955 190519.hex" 2955-vv-.hex

    install -m644 "$srcdir/noforths 2x55/noforth c2x55 190519.hex" 2x55-c.hex
    install -m644 "$srcdir/noforths 2x55/noforth v2x55 190519.hex" 2x55-v.hex
    install -m644 "$srcdir/noforths 2x55/noforth cc2x55 190519.hex" 2x55-cc.hex
    install -m644 "$srcdir/noforths 2x55/noforth vv2x55 190519.hex" 2x55-vv.hex

    install -m644 "$srcdir/noforth%20tools.f" tools.f
    install -m644 "$srcdir/noforth%20c%20more%20standard%20words.f" words-c.f
    install -m644 "$srcdir/noforth%20v%20more%20standard%20words.f" words-v.f
    install -m644 "$srcdir/noforth%20asm.f" asm.f
    install -m644 "$srcdir/noforth%20das.f" das.f
    install -m644 "$srcdir/aux430asm.f" aux430asm.f


    mkdir -p "$pkgdir/usr/share/doc/$pkgname"

    cd "$_"
    install -m644 "$srcdir/noforths 149/readme - noforth 149.pdf" readme-149.pdf
    install -m644 "$srcdir/noforths 2433/readme - noforth 2433.pdf" readme-2433.pdf
    install -m644 "$srcdir/noforths 5739/readme - noforth 5739.pdf" readme-5739.pdf
    install -m644 "$srcdir/noforths 59x9/readme - noforth 59x9.pdf" readme-59x9.pdf
    install -m644 "$srcdir/noforths 5994/readme - noforth 5994.pdf" readme-5994.pdf
    install -m644 "$srcdir/noforths 2553/readme - noforth 2553.pdf" readme-2553.pdf
    install -m644 "$srcdir/noforths 2955/readme - noforth 2955.pdf" readme-2955.pdf
    install -m644 "$srcdir/noforths 2x55/readme - noforth 2x55.pdf" readme-2x55.pdf

    install -m644 "$srcdir/msp430f149%20minim%20core%20board.pdf" msp430f149-minim-core.pdf
    install -m644 "$srcdir/msp430f149%20dupont%20board.pdf" msp430f149-dupont.pdf
    install -m644 "$srcdir/msp430f149%20mini-v3%20board.pdf" msp430f149-mini-v3.pdf
    install -m644 "$srcdir/msp-exp430fr2433%20experimenter%20board.pdf" msp-exp430fr2433.pdf
    install -m644 "$srcdir/msp-exp430fr5739%20experimenter%20board.pdf" msp-exp430fr5739.pdf
    install -m644 "$srcdir/msp-exp430fr5969%20experimenter%20board.pdf" msp-exp430fr5969.pdf
    install -m644 "$srcdir/msp-exp430fr5994%20experimenter%20board.pdf" msp-exp430fr5994.pdf
    install -m644 "$srcdir/msp430g2553%20launchpad.pdf" msp430g2553-launchpad.pdf
    install -m644 "$srcdir/msp430g2553%20egel%20kit.pdf" msp430g2553-egel-kit.pdf
    install -m644 "$srcdir/msp-exp430fr2355%20experimenter%20board.pdf" msp-exp430fr2355.pdf

    install -m644 "$srcdir/howto-fr2355.pdf" howto-fr2335-with-uniflash.pdf
    install -m644 "$srcdir/msp-exp430fr2355%20board%20as%20programmer.pdf" howto-msp-exp430fr2355-as-programmer.pdf
    install -m644 "$srcdir/howto-fr59xx-linux.pdf" howto-fr59xx-linux.pdf
    install -m644 "$srcdir/howto-linux.pdf" howto-msp430g2553-launchpad-linux.pdf

    install -m644 "$srcdir/noforth%20documentation.pdf" documentation.pdf
    install -m644 "$srcdir/noforth%20asm.pdf" asm.pdf
    install -m644 "$srcdir/session1.pdf" session1.pdf
    install -m644 "$srcdir/session2.pdf" session2.pdf
    install -m644 "$srcdir/commacode.pdf" commacode.pdf
    install -m644 "$srcdir/commacode%202.pdf" commacode-2.pdf
    install -m644 "$srcdir/how%20noforth%20is%20made.pdf" how-noforth-is-made.pdf
    install -m644 "$srcdir/hardware%20explorer.pdf" hardware-explorer.pdf
    install -m644 "$srcdir/launchpad%20experimenteerkit.pdf" launchpad-experimenteerkit.pdf
}
