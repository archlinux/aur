/* bg opacity */
unsigned int alpha = 0xff; /* full opaque */

// gruvbox colorscheme
/* Terminal colors (16 first used in escape sequence) */
const char *colorname[] = {

  "#282828",
  "#cc241d",
  "#98971a",
  "#d79921",
  "#458588",
  "#b16286",
  "#689d6a",
  "#a89984",
  "#928374",
  "#fb4934",
  "#b8bb26",
  "#fabd2f",
  "#83a598",
  "#d3869b",
  "#8ec07c",
  "#ebdbb2",

  [255] = 0,

  /* more colors can be added after 255 to use with DefaultXX */
  "#cccccc",
  "#555555",
  "white",
  "#282828",
};


/*
 * Default colors (colorname index)
 * foreground, background, cursor, reverse cursor
 */
unsigned int defaultfg = 15;
unsigned int defaultbg = 0;
unsigned int defaultcs = 256;
unsigned int defaultrcs = 257;

// vim:ts=2 sw=2 et
