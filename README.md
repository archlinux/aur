# pnghide
hide plain text in png file inside pixels (unvisible changes).

## How to use

Example: I want hide `data.txt` file inside `image.png` and store result in `result.png`:
```bash
pnghide image.png <data.txt >result.png
```

Example: I want hide some text inside `image.png` and store result in `result.png`:
```bash
pnghide image.png >result.png
```
Enter your text to program.
Press `Ctrl+D` for finish.
You can also use this:
```bash
pnghide image.png >result.png <<END
<some text>
END
```

Example: I want get back my `data.txt` from `result.png`:
```bash
pngunhide result.png >data.txt
```

Example: I want get back my some text from `result.png` (print to terminal):
```bash
pngunhide result.png
```

## How to build
```bash
cmake -Bbuild
cmake --build build --target all
```
