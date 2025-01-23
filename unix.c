/* $Copyright: $
 * Copyright (c) 1996 - 2024 by Steve Baker (steve.baker.llc@gmail.com)
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
#include "tree.h"

extern FILE *outfile;
extern bool dflag, Fflag, duflag, metafirst, hflag, siflag, noindent;
extern bool colorize, linktargetcolor, hyperflag;
extern const struct linedraw *linedraw;
extern int *dirs;
extern char *scheme, *authority;
static char info[512] = {0};

extern char realbasepath[PATH_MAX], xpattern[PATH_MAX];
extern size_t dirpathoffset;

int unix_printinfo(char *dirname, struct _info *file, int level)
{
  UNUSED(dirname);

  fillinfo(info, file);
  if (metafirst) {
    if (info[0] == '[') fprintf(outfile, "%s  ",info);
    if (!noindent) indent(level);
  } else {
    if (!noindent) indent(level);
    if (info[0] == '[') fprintf(outfile, "%s  ",info);
  }
  return 0;
}

void open_hyperlink(char *dirname, char *filename)
{
  fprintf(outfile,"\033]8;;%s", scheme);
  url_encode(outfile, authority);
  url_encode(outfile, realbasepath);
  url_encode(outfile, dirname+dirpathoffset);
  fputc('/',outfile);
  url_encode(outfile, filename);
  fprintf(outfile,"\033\\");
}

void close_hyperlink(void)
{
  fprintf(outfile, "\033]8;;\033\\");
}

int unix_printfile(char *dirname, char *filename, struct _info *file, int descend)
{
  UNUSED(descend);

  bool colored = false;
  int c;

  if (hyperflag) open_hyperlink(dirname, file->name);

  if (file && colorize) {
    if (file->lnk && linktargetcolor) colored = color(file->lnkmode, file->name, file->orphan, false);
    else colored = color(file->mode, file->name, file->orphan, false);
  }

  printit(filename);

  if (colored) endcolor();

  if (hyperflag) close_hyperlink();

  if (file) {
    if (Fflag && !file->lnk) {
      if ((c = Ftype(file->mode))) fputc(c, outfile);
    }

    if (file->lnk) {
      fprintf(outfile," -> ");
      if (hyperflag) open_hyperlink(dirname, file->name);
      if (colorize) colored = color(file->lnkmode, file->lnk, file->orphan, true);
      printit(file->lnk);
      if (colored) endcolor();
      if (hyperflag) close_hyperlink();
      if (Fflag) {
	if ((c = Ftype(file->lnkmode))) fputc(c, outfile);
      }
    }
  }
  return 0;
}

int unix_error(char *error)
{
  fprintf(outfile, "  [%s]", error);
  return 0;
}

void unix_newline(struct _info *file, int level, int postdir, int needcomma)
{
  UNUSED(needcomma);

  if (postdir <= 0) fprintf(outfile, "\n");
  if (file && file->comment) {
    size_t infosize = 0, line, lines;
    if (metafirst) infosize = info[0] == '['? strlen(info)+2 : 0;

    for(lines = 0; file->comment[lines]; lines++);
    dirs[level+1] = 1;
    for(line = 0; line < lines; line++) {
      if (metafirst) {
	printf("%*s", (int)infosize, "");
      }
      indent(level);
      printcomment(line, lines, file->comment[line]);
    }
    dirs[level+1] = 0;
  }
}

void unix_report(struct totals tot)
{
  char buf[256];

  fputc('\n', outfile);
  if (duflag) {
    psize(buf, tot.size);
    fprintf(outfile,"%s%s usados em ", buf, hflag || siflag ? "" : " bytes");
  }
  if (dflag)
    fprintf(outfile,"%ld diretório%s\n", tot.dirs, (tot.dirs == 1 ? "" : "s"));
  else
    fprintf(outfile,"%ld diretório%s, %ld arquivo%s\n", tot.dirs, (tot.dirs == 1 ? "" : "s"), tot.files, (tot.files == 1 ? "" : "s"));
}

