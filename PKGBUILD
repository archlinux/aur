# Maintainer: SanskritFritz (gmail)

pkgname=("pzl_common" "pzl_akari" "pzl_boggle" "pzl_codeword" "pzl_futoshiki" "pzl_jigsaw" "pzl_kakuro" "pzl_minesweeper" "pzl_scrabbler" "pzl_sumpuzzle" "pzl_sudoku" "pzl_sokoban" "pzl_bridges" "pzl_shikaku" "pzl_suguru" "pzl_hidato" "pzl_fillomino" "pzl_wordwheel" "pzl_wordladder" "pzl_nurikabe")
pkgbase="pzl_games"
pkgver=13.0
_pkgver=13_0
pkgrel=1
pkgdesc="Small collection of puzzle games."
arch=('any')
url="http://pzl.org.uk/"
license=('GPL')
source=("http://pzl.org.uk/pzl3_$_pkgver.zip"
	"pzl_akari.desktop"
	"pzl_boggle.desktop"
	"pzl_codeword.desktop"
	"pzl_futoshiki.desktop"
	"pzl_jigsaw.desktop"
	"pzl_kakuro.desktop"
	"pzl_minesweeper.desktop"
	"pzl_scrabbler.desktop"
	"pzl_sumpuzzle.desktop"
	"pzl_sudoku.desktop"
	"pzl_sokoban.desktop"
	"pzl_bridges.desktop"
	"pzl_shikaku.desktop"
	"pzl_suguru.desktop"
	"pzl_hidato.desktop"
	"pzl_fillomino.desktop"
	"pzl_wordwheel.desktop"
	"pzl_wordladder.desktop"
	"pzl_nurikabe.desktop")

md5sums=('8184cbbc5a231119c37c919a9552e0d3'
         'b7d0a414fc22aa750b7e4d758a6e04cd'
         '898534ec921c3c165fc11a7b5ef9b8d2'
         '02df03e4c57e8b77062df51971f7c582'
         '744840240079721ae72b14b49589ef4b'
         '00333ad5a67aa529189cb8d5efce7ec2'
         '27c7b30bf6c9365397b35d4cca7044f8'
         '3938559de7b10ca25f86ccb59676547e'
         'bdcdc0250d61c33f85289e7e436546a6'
         '652ec7a6aa6a225f62579a315bd98421'
         '068873d936f6592065010b056da87cc7'
         'ea71834e6c8ab194e38738b599a3e351'
         'b62c538e5baba89f6fe1e195af8e39af'
         '38dc1f1869c03d4cc8e2724e6060fc65'
         '0c1b99051ab88c9aacf108a4d7d577e2'
         'a07ce126d031c9fbed8c1cbe2c6af1a1'
         '493fa819c6a145a873ec81bab55bf96a'
         'b7b52cd6e554eb01aa0537bb5526e297'
         'b0afcb5b6a3f2f05b8fd8e6d59d8e6ca'
         '08f441dcf7ec24f4148d9a952738d7f4')

package_pzl_common() {
	pkgdesc="Common files for pzl games."
	depends=('tk' 'python')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	install -m644 pzl3_download/pzl_lib.py "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/dawg.py "$pkgdir/usr/share/pzl_games"
}

package_pzl_akari() {
	pkgdesc="A binary-determination logic puzzle, also called Light Up."
	url="http://pzl.org.uk/akari.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	install -m644 pzl3_download/akari.pyw "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/akari_logo.png "$pkgdir/usr/share/pixmaps/pzl_games"
	install -m644 pzl_akari.desktop "$pkgdir/usr/share/applications"
}

package_pzl_boggle() {
	pkgdesc="Find as many words as possible in a grid of letters."
	url="http://pzl.org.uk/boggle.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	install -m644 pzl3_download/boggle.pyw "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/boggle_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	install -m644 pzl_boggle.desktop "$pkgdir/usr/share/applications"
}

package_pzl_codeword() {
	pkgdesc="Challenging crossword pattern recognition game."
	url="http://pzl.org.uk/codeword.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	install -m644 pzl3_download/codeword.pyw "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/codeword_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	install -m644 pzl_codeword.desktop "$pkgdir/usr/share/applications"
}

package_pzl_futoshiki() {
	pkgdesc="Logic game in which players solve a Latin square."
	url="http://pzl.org.uk/futoshiki.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	install -m644 pzl3_download/futoshiki.pyw "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/futoshiki_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	install -m644 pzl_futoshiki.desktop "$pkgdir/usr/share/applications"
}

package_pzl_jigsaw() {
	pkgdesc="Puzzle game to assemble segments of a picture into their positions."
	url="http://pzl.org.uk/jigsaw.html"
	depends=('python-pillow' 'pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	install -m644 pzl3_download/jigsaw.pyw "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/jigsaw_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	install -m644 pzl_jigsaw.desktop "$pkgdir/usr/share/applications"
}

package_pzl_kakuro() {
	pkgdesc="An absorbing logic game."
	url="http://pzl.org.uk/kakuro.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	install -m644 pzl3_download/kakuro.pyw "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/kakuro_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	install -m644 pzl_kakuro.desktop "$pkgdir/usr/share/applications"
}

package_pzl_minesweeper() {
	pkgdesc="Minesweeper game which will always produce puzzles that can be solved using logic."
	url="http://pzl.org.uk/minesweeper.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	install -m644 pzl3_download/minesweeper.pyw "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/minesweeper_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	install -m644 pzl_minesweeper.desktop "$pkgdir/usr/share/applications"
}

package_pzl_scrabbler() {
	pkgdesc="Make words on the board using randomly allotted letters."
	url="http://pzl.org.uk/scrabbler.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	install -m644 pzl3_download/scrabbler.pyw "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/scrabbler_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	install -m644 pzl_scrabbler.desktop "$pkgdir/usr/share/applications"
}

package_pzl_sumpuzzle() {
	pkgdesc="Test of logic and simple arithmetic in which the player positions numbers to satisfy six intersecting sums."
	url="http://pzl.org.uk/sumpuzzle.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	install -m644 pzl3_download/sumpuzzle.pyw "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/sumpuzzle_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	install -m644 pzl_sumpuzzle.desktop "$pkgdir/usr/share/applications"
}

package_pzl_sudoku() {
	pkgdesc="The popular logic game."
	url="http://pzl.org.uk/sudoku.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	install -m644 pzl3_download/sudoku.pyw "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/sudoku_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	install -m644 pzl_sudoku.desktop "$pkgdir/usr/share/applications"
}

package_pzl_sokoban() {
	pkgdesc="The warehouse keeper must push boxes to designated positions."
	url="http://pzl.org.uk/sokoban.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	install -m644 pzl3_download/sokoban.pyw "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/sokoban_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	install -m644 pzl_sokoban.desktop "$pkgdir/usr/share/applications"
}

package_pzl_bridges() {
	pkgdesc="Link a set of islands with bridges so that it is possible to reach any island from any other."
	url="http://pzl.org.uk/bridges.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	install -m644 pzl3_download/bridges.pyw "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/bridges_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	install -m644 pzl_bridges.desktop "$pkgdir/usr/share/applications"
}

package_pzl_shikaku() {
	pkgdesc="Draw non-overlapping rectangles around the clue cells to completely cover the grid by rectangles."
	url="http://pzl.org.uk/shikaku.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	install -m644 pzl3_download/shikaku.pyw "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/shikaku_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	install -m644 pzl_shikaku.desktop "$pkgdir/usr/share/applications"
}

package_pzl_suguru() {
	pkgdesc="Place the digits 1-N once in each polyomino in such a way that no digit touches another digit of the same value."
	url="http://pzl.org.uk/suguru.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	install -m644 pzl3_download/suguru.pyw "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/suguru_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	install -m644 pzl_suguru.desktop "$pkgdir/usr/share/applications"
}

package_pzl_hidato() {
	pkgdesc="Place a chain of consecutive numbers in touching cells so that there is a continuous path."
	url="http://pzl.org.uk/hidato.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	install -m644 pzl3_download/hidato.pyw "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/hidato_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	install -m644 pzl_hidato.desktop "$pkgdir/usr/share/applications"
}

package_pzl_fillomino() {
	pkgdesc="Fill in all empty cells with numbers by dividing all of the board into blocks."
	url="http://pzl.org.uk/fillomino.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	install -m644 pzl3_download/fillomino.pyw "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/fillomino_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	install -m644 pzl_fillomino.desktop "$pkgdir/usr/share/applications"
}

package_pzl_wordwheel() {
	pkgdesc="Puzzle of words scrambled in a circle."
	url="http://pzl.org.uk/wordwheel.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	install -m644 pzl3_download/wordwheel.pyw "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/wordwheel_data.py "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/wordwheel_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	install -m644 pzl_wordwheel.desktop "$pkgdir/usr/share/applications"
}

package_pzl_wordladder() {
	pkgdesc="Series of words, one above the other, each word differs by one letter."
	url="http://pzl.org.uk/wordladder.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	install -m644 pzl3_download/wordladder.pyw "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/wordladder_data.py "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/wordladder_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	install -m644 pzl_wordladder.desktop "$pkgdir/usr/share/applications"
}

package_pzl_nurikabe() {
	pkgdesc="Each clue cell of value N must be part of a cluster of white cells and all other cells must be black."
	url="http://pzl.org.uk/nurikabe.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	install -m644 pzl3_download/nurikabe.pyw "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/nurikabe_data.py "$pkgdir/usr/share/pzl_games"
	install -m644 pzl3_download/nurikabe_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	install -m644 pzl_nurikabe.desktop "$pkgdir/usr/share/applications"
}

# package_pzl_launcher() {
# 	pkgdesc="Launcher for pzl games."
# 	url="http://pzl.org.uk/"
# 	depends=('pzl_common')
# 	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
# 	install -m644 pzl3_download/pzl_launcher.pyw "$pkgdir/usr/share/pzl_games"
# 	install -m644 pzl3_download/pzl_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
# 	install -m644 pzl_launcher.desktop "$pkgdir/usr/share/applications"
# }
