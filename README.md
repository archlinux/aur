# mdink

**mdink** is a compact **native Rust** Markdown to PDF converter with six coordinated themes and custom colors. PDFs are generated directly: **no browser or external runtime is required**. Fonts are embedded in the executable.

> This file mirrors the upstream README of the tagged release:
> <https://github.com/davide-leva/mdink/blob/v1.0.0/README.md>
> The canonical copy is the one in the upstream repository.

## Installation

The package is built from source on the AUR. With an AUR helper:

```sh
yay -S mdink
```

or, manually:

```sh
git clone https://aur.archlinux.org/mdink.git
cd mdink
makepkg -si
```

## Build and distribution

The supplied executable in `dist/mdink` is a **static Linux x86_64 build**, including musl. It does not require an installed libc, graphics libraries or a rendering engine. The executable is approximately **7.2 MiB**; use the commands below to check the exact size on your target.

To build a release for your current platform, install **Rust 1.92 or later** and run:

```sh
make build
./dist/mdink tests/fixtures/document.md
```

Alternatively, without Make:

```sh
cargo build --release --locked
./target/release/mdink document.md
```

This standard build uses the host's basic system libraries, such as libc on Linux. Only build tools need Cargo and access to the package registry; the compiled executable does not.

For the static Linux x86_64 version used in the distribution:

```sh
rustup target add x86_64-unknown-linux-musl
make package-static
```

This command needs GCC on Linux x86_64 for the cryptographic dependency's C code. It writes `dist/mdink` and an archive containing the executable, README and font license. `make package` produces the equivalent archive for the standard host build. Windows and macOS builds have not been tested in this session.

## Performance: use the release build

`cargo run -- ...` uses the **debug** profile with optimizations disabled. For conversion, use the executable in `dist/` or:

```sh
cargo run --release -- tests/fixtures/document.md --output sample.pdf
```

For one sample document, this machine took approximately **2.66 seconds in debug** and **0.15 seconds in release**, excluding compilation (about 17 times faster). These are indicative measurements, not a guarantee for every document. Initial release compilation takes longer because of LTO and size optimization; subsequent conversions reuse the compiled executable. Large images and remote downloads also affect conversion time.

## Usage

```sh
./dist/mdink document.md
./dist/mdink document.md -o output/document.pdf
./dist/mdink document.md --title "Quarterly report" --landscape
./dist/mdink document.md --theme forest
./dist/mdink document.md --color '#c05621'
./dist/mdink --list-themes
```

| Option | Effect |
|---|---|
| `-o, --output <file.pdf>` | Output path; missing directories are created |
| `--title <title>` | PDF metadata title; defaults to the input filename without its extension |
| `--landscape` | Landscape A4 pages |
| `--theme <name>` | Color theme; defaults to `ocean` |
| `--color <#RRGGBB>` | Custom primary color; overrides the selected theme's primary color |
| `--list-themes` | List themes and their primary colors |
| `-h, --help` | Show usage instructions |
| `-v, --version` | Show the program version |
| `--` | End options, allowing filenames starting with `-` |

Without `--output`, the PDF is saved next to the input with the same basename. An existing PDF is replaced only after successful conversion. Errors are printed to stderr with exit code 1. All CLI messages are in English; Markdown content is preserved in its original language.

## Six coordinated themes

| Theme | Primary color |
|---|---|
| `ocean` | `#173d66` — blue |
| `teal` | `#087e8b` — teal |
| `forest` | `#256348` — green |
| `plum` | `#743c78` — purple |
| `terracotta` | `#a34f35` — earthy orange |
| `graphite` | `#374151` — gray |

Headings, accents, borders, alternating table rows, code and quote backgrounds, and body text colors are derived from the primary color. Table headers automatically use white or black text according to contrast. Heading colors are darkened when necessary for readability against white. Very light and very dark custom colors are supported.

Use a six-digit hexadecimal color, with or without `#`. Quote values containing `#` in the shell. If both `--theme` and `--color` are provided, the custom color determines the entire palette.

## Supported Markdown

- H1–H6 headings, paragraphs, bold, italic and combined emphasis.
- Strikethrough, clickable external links, autolinks, nested blockquotes and horizontal rules.
- Ordered, unordered and nested lists, and task checkboxes.
- Tables with column alignment, wrapped text and repeated headers across pages. Oversized cells are split without losing text.
- Local images, HTTP/HTTPS images, `file:///` URLs and embedded data URIs.
- Inline code, fenced code blocks and indented code blocks.
- Explicit line breaks using `<br>`, `<br/>` or `<br />`, including inside tables.
- Footnotes using `[^note]`, collected at the end of the document.

**Code blocks do not have syntax highlighting.** They use a monospace font and a theme-colored background. A language after the opening fence is accepted but does not color the code. Long lines wrap to fit the page. `<br />` inside code remains literal text.

Image paths are resolved relative to the Markdown file's directory. For filenames containing spaces, use `![description](<image with spaces.png>)`. Supported formats: **PNG, JPEG, GIF, WebP, BMP and SVG**. Animations are rendered as static images. Images are scaled proportionally to fit the page. Missing or invalid images stop conversion. Remote image requests have a 30-second timeout and a 64 MiB size limit per image. AVIF is not included in the native version.

Noto Sans (regular, bold, italic and bold italic), Noto Sans Mono, and Noto Sans Symbols fonts are compressed inside the executable. PDF font embedding includes only the glyphs actually used. Latin, Greek, Cyrillic and numerous symbols are covered; CJK and all emoji are not guaranteed. Missing glyphs produce an explicit English error instead of silently rendering empty squares. The [font license](native/fonts/LICENSE) is included in the repository and distribution archive.

Raw HTML is rendered as text, except for `<br>` tags. LaTeX formulas, Mermaid diagrams, CSS and custom HTML are not interpreted. The native layout keeps the project's visual style; it is not a browser layout engine. PDFs contain selectable text, external links and page numbers. PDF/UA compliance is not claimed.

## Keeping the executable small

The release profile uses size optimization (`opt-level = "z"`), LTO, one code generation unit, stripped symbols and `panic = "abort"`. Fonts are losslessly compressed. Syntax highlighting, a JavaScript runtime, a browser and AVIF codecs are excluded. Measure the resulting artifacts with:

```sh
wc -c dist/mdink
ls -lh dist/mdink*
```

The `target/` directory contains build artifacts and may be much larger. Distribute **only the executable**, or the archive generated by `make package-static` / `make package`.

## Development and testing

The implementation separates Markdown parsing, fonts and image loading, layout, and color palettes. Edit [`native/theme.rs`](native/theme.rs) for colors and [`native/layout.rs`](native/layout.rs) for spacing and pagination.

```sh
# Build the optimized executable and run all Rust tests:
make test
# Or run Cargo directly (uses the slower debug executable for integration tests):
cargo test --locked
# Test the distributed static executable explicitly:
MDINK_BIN=dist/mdink cargo test --locked
```

Integration tests inspect actual PDFs: embedded fonts, formatting, links, local and HTTP images, line breaks, six themes, custom colors, multipage tables, oversized rows and image codecs. A test runs the executable with an empty environment and a temporary working directory to verify that it does not rely on external programs or system fonts. Test documents and images live in `tests/fixtures/`, independently of user documents. The PDF inspection library is a development dependency and is not included in the distributed executable.

All development and test commands use Cargo and Make; no JavaScript toolchain is needed.

Markdown parsing uses [Comrak](https://github.com/kivikakk/comrak), PDF generation uses [Krilla](https://github.com/LaurenzV/krilla), and SVG support uses [usvg](https://github.com/linebender/resvg).
