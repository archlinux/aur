# MarcwelArchive

**MarcwelArchive** is a **cursed archive utility** for packing and unpacking files into `.marcwel` format. It supports optional **random bloat injection**, where you can inflate archives with random JSON data (5KB to 500KB), making the archive unnecessarily large for fun. This is an archive tool that comes with a sense of humor—perfect for meme lovers and those who want to add a bit of extra weight to their files.

## Features

- **Pack** files and directories into a `.marcwel` archive.
- **Unpack** `.marcwel` archives back into original files/folders.
- Optionally **inflate** the archive with random JSON bloat (5KB to 500KB), making the archive "larger than life."
- **"Infinite compression ratio"** (∞:1) for maximum bloat.
- Written in **Node.js**, so it's platform-independent.

## Installation

### AUR Installation (Recommended)

You can install `marcwel-archive` from the AUR using an AUR helper like `yay` or `paru`.

1. **Using `yay`:**

   ```bash
   yay -S marcwel-archive
   ```

2. **Using `paru`:**

   ```bash
   paru -S marcwel-archive
   ```

After installing, the `marcwel` command will be available globally.

### Manual Installation

If you prefer to manually install the tool, you can clone this repository and run it locally.

```bash
git clone https://github.com/ShortWare/marcwel-archive.git
cd marcwel-archive
```

Then, you can run it using:

```bash
node marcwel.js <command> <args>
```

## Usage

### Pack a file or folder

To pack a file or directory into a `.marcwel` archive, run:

```bash
marcwel pack <input-path> <output-path> [--inflate]
```

- `input-path`: The file or directory to pack.
- `output-path`: The output `.marcwel` archive file (e.g., `myArchive.marcwel`).
- `--inflate`: Optionally inflate the archive with random JSON bloat (5KB to 500KB). This flag adds massive size to your archive for fun.

#### Example:

```bash
marcwel pack myFolder myArchive.marcwel --inflate
```

This will pack the `myFolder` directory into `myArchive.marcwel` and add random JSON bloat.

### Unpack a `.marcwel` archive

To unpack a `.marcwel` archive:

```bash
marcwel unpack <archive-path> <output-folder>
```

- `archive-path`: The `.marcwel` archive to unpack.
- `output-folder`: The destination folder to extract the files.

#### Example:

```bash
marcwel unpack myArchive.marcwel ./extracted-files
```

This will extract the contents of `myArchive.marcwel` into `./extracted-files`.

## License

This project is licensed under the **Beerware License**.

#### Beerware License

As long as you retain this notice, you can do whatever you want with this software.
If we meet some day, and you think this software is worth it, you can buy me a beer.
