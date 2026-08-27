# mdview-mtx-git

Builds [mdview](https://github.com/step-/mdview) from git and applies
`mdview-inline-editor.patch`, which adds an inline Markdown editor and a
document export action to the GTK viewer. The package also ships a Russian
translation that upstream does not carry.

Read this file in Russian: [README.ru.md](README.ru.md).

Everything described below comes from this package. Upstream behaviour is
unchanged in every other respect, and neither `pkgver` nor the upstream commit
is altered to carry these additions.

## Inline Markdown editor

Press `F2` to split the window and edit the current page beside its rendered
preview. The preview follows what you type. Pages that have no writable file
behind them — the welcome page, search results, pages that failed to load —
refuse to open the editor and say so in the status bar.

The formatting row applies to the selection, or inserts a template when
nothing is selected:

| Button | Effect |
| --- | --- |
| `B` `I` `U` | bold, italic, underline (`<u>`) |
| `H1` `H2` `H3` | heading level |
| `»` | block quote |
| `•` | bullet list item |
| `` ` `` | code span |
| image, link | dialog asking for the target and the text |

### Saving

`Ctrl+S` writes the buffer back to the file. If the file changed on disk since
it was loaded, the save is refused rather than silently overwriting the newer
content.

Any action that would discard unsaved text — closing the editor, navigating
away, quitting — first asks what to do:

- **Cancel** — stay where you are.
- **Discard** — drop the edits. The preview returns to the content on disk,
  not merely the editor buffer.
- **Save As…** — write the buffer to a file you pick. On quit the application
  saves and then exits; otherwise it shows the file it just saved.
- **Save** — write to the current file.

### New pages

`Ctrl+N` asks for a name, creates the file, and opens it in the editor ready to
type. Creation refuses to follow a symlink and refuses to overwrite an existing
file.

## Exporting

The **Export** toolbar button converts the current page and writes it to a file
you choose. The dialog offers HTML, decorated text, plain text, text with ANSI
colours, and text with vt100 codes; the file name extension follows the format
you select.

This reuses the converter that mdview already exposes on the command line, so
the results match:

```sh
mdview --text . README.md
mdview --bare . README.md > README.txt
mdview --ansi . README.md | less -R
mdview --html --html5 --html-full --output=README.html . README.md
```

`mdview --help` documents these under **CONVERTING DOCUMENTS**.

## Other toolbar actions

| Key | Action |
| --- | --- |
| `Alt+P` | render the page and open it in the browser |
| `Ctrl+E` | open the page in the external editor from `$EDITOR` |
| `F2` | show or hide the inline editor |
| `Ctrl+N` | create a new page and edit it |

`Alt+P` resolves the page to its real path first, so it works no matter which
directory the viewer was started from, and it follows relative links and
`--auto-lang` translated siblings correctly.

## Generated preview files

Browser previews are written to `$TMPDIR/mdview-<uid>/<pid>/`, created with
mode `0700`. At start-up mdview deletes the directories of instances that are
no longer running, so previews do not pile up, while a second running instance
keeps the files its browser may still be reading.

## Russian translation

`ru.po` is added to the build and installed as a message catalogue. Run with a
Russian locale to use it:

```sh
LANGUAGE=ru mdview /path/to/directory
```

## Reporting problems

Problems with the editor, the export action or the translation belong to this
package. Everything else belongs
[upstream](https://github.com/step-/mdview/issues).
