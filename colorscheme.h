/* bg opacity # Have alpha problems
*/
float alpha = 0.9;


/* Terminal colors (16 first used in escape sequence) */
static const char *colorname[] = {

  "#2E3436",
  "#CC0000",
  "#4E9A06",
  "#C4A000",
  "#3465A4",
  "#75507B",
  "#06989A",
  "#D3D7CF",
  "#555753",
  "#EF2929",
  "#8AE234",
  "#FCE94F",
  "#729FCF",
  "#AD7FA8",
  "#34E2E2",
  "#EEEEEC",

  [255] = 0,

  /* more colors can be added after 255 to use with DefaultXX */
  "#C8C8C8",
  "#323232",
  "white",
  "#00FFFF",
};


/*
 * Default colors (colorname index)
 * foreground, background, cursor, reverse cursor
 */
unsigned int defaultfg = 256;
unsigned int defaultbg = 257;
static unsigned int defaultcs = 259;
static unsigned int defaultrcs = 2;
