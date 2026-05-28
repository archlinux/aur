#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/* Include all your generated header files */
#include "asm.h"
#include "c.h"
#include "cpp.h"
#include "cs.h"
#include "css.h"
#include "d.h"
#include "el.h"
#include "go.h"
#include "hs.h"
#include "html.h"
#include "java.h"
#include "js.h"
#include "jsonc.h"
#include "lua.h"
#include "plist.h"
#include "py.h"
#include "r.h"
#include "rs.h"
#include "sh.h"
#include "swift.h"
#include "toml.h"
#include "ts.h"
#include "xml.h"
#include "yaml.h"

typedef struct {
    const char *name;
    unsigned char *data;
    unsigned int len;
} Language;

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: purpletue <language>\n");
        return 1;
    }

    Language langs[] = {
        {"asm", asm_txt, asm_txt_len}, {"c", c_txt, c_txt_len},
        {"cpp", cpp_txt, cpp_txt_len}, {"cs", cs_txt, cs_txt_len},
        {"css", css_txt, css_txt_len}, {"d", d_txt, d_txt_len},
        {"el", el_txt, el_txt_len}, {"go", go_txt, go_txt_len},
        {"hs", hs_txt, hs_txt_len}, {"html", html_txt, html_txt_len},
        {"java", java_txt, java_txt_len}, {"js", js_txt, js_txt_len},
        {"jsonc", jsonc_txt, jsonc_txt_len}, {"lua", lua_txt, lua_txt_len},
        {"plist", plist_txt, plist_txt_len}, {"py", py_txt, py_txt_len},
        {"r", r_txt, r_txt_len}, {"rs", rs_txt, rs_txt_len},
        {"sh", sh_txt, sh_txt_len}, {"swift", swift_txt, swift_txt_len},
        {"toml", toml_txt, toml_txt_len}, {"ts", ts_txt, ts_txt_len},
        {"xml", xml_txt, xml_txt_len}, {"yaml", yaml_txt, yaml_txt_len}
    };

    int num_langs = sizeof(langs) / sizeof(Language);

    for (int i = 0; i < num_langs; i++) {
        if (strcmp(argv[1], langs[i].name) == 0) {
            FILE *pager = popen("less -R", "w");
            if (pager) {
                fwrite(langs[i].data, 1, langs[i].len, pager);
                pclose(pager);
            }
            return 0;
        }
    }

    printf("Error: Language '%s' not found.\n", argv[1]);
    return 1;
}
