# THIS FONT WAS NOT MADE BY ME. I DO NOT TAKE CREDIT FOR ITS CREATION. THE ORIGINAL FONT AND ITS MODIFIED CAN BE FOUND HERE:
(Original): https://github.com/romeovs/creep
(Modified): https://github.com/raymond-w-ko/creep2

# A copy of the 'creep' font by romeovs but with a strict character bounding box

## Notes
* mintty, as of version of 2.7.6, requires `RowSpacing=-1` in the `.minttyrc` file for the box drawing glyphs not to be invisible.
  * This is found in `$HOME/.minttyrc` for `Cygwin` use, or
  * `%LOCALAPPDATA%\wsltty\home\%USERNAME%\.minttyrc` for `wsltty` use
  * Through Git bisect, I found that this commit causes the breakage, although I'm not sure if it is a bug or feature. https://github.com/mintty/mintty/commit/2cc746667595e08f57b12cfa0df0b67787762620 

## Introduction
I love romeovs's creep font, but I think you could only use it well in Apple's Terminal.app
because it has negative line and character width spacing, which the font requires to be spaced correctly.
The root cause of this appears to be because some glyphs are bigger than the 5px by 11px bounding box,
causing most terminals to think a much bigger box is necessary for the general ASCII glyphs.

In order to fix this issue, I manually hand painted all the glyphs from the 'creep' font in fontforge.
This was probably not the smartest way, but I did not feel like researching a way to import it by code.
On the plus side, I was watching a few movies while drawing these glyphs, so it wasn't too bad ;-)

After doing this I could understand why some characters extend past the bounding box, as 5x11 is ridiculously small
for the more complicated glyphs. However, to get it to work nicely on terminals and editors without negative spacing support,
I had to use my best judgement and truncate or modify certain glpyhs so they all fit without exceptions. This of course
is not as nice, and arguably makes certain glyphs much less recognizable, but I felt it was an acceptable compromise since
they do not appear often.

### Result

By maintaining the strict 5x11 bounding box, I was able to get the font working in all the programs I typically use that don't support fancy spacing adjustment:
* XTerm (BDF format)
* UXRvt (BDF format)
* X11 (BDF format)
* Windows GVim (TTF with embedded bitmaps)
* mintty (TTF with embedded bitmap, add "LineSpacing=-1" to config file to get 11px per row height, add "LineSpacing=0" for newer builds (Apr 8 2016)).
* Notepad.exe (TTF with embedded bitmaps)

Now I have crazy awesome code density :-)

## Original Here:
### https://github.com/romeovs/creep
