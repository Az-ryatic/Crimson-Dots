const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#ED1E24", /* red     */
  [2] = "#C53539", /* green   */
  [3] = "#887F81", /* yellow  */
  [4] = "#8C8C8F", /* blue    */
  [5] = "#ABACAD", /* magenta */
  [6] = "#EEA4A6", /* cyan    */
  [7] = "#e3e0e0", /* white   */

  /* 8 bright colors */
  [8]  = "#9e9c9c",  /* black   */
  [9]  = "#ED1E24",  /* red     */
  [10] = "#C53539", /* green   */
  [11] = "#887F81", /* yellow  */
  [12] = "#8C8C8F", /* blue    */
  [13] = "#ABACAD", /* magenta */
  [14] = "#EEA4A6", /* cyan    */
  [15] = "#e3e0e0", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#e3e0e0", /* foreground */
  [258] = "#e3e0e0",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
