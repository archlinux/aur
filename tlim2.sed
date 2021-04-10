s|^ICON = .*/\(.*\)$|ICON = \1|
s|^COMMIT_KEYS =|### &|
s|^SELECT_KEYS =|### &|
s|^PAGE_UP_KEYS =|### &|
s|^PAGE_DOWN_KEYS =|### &|
s|^SHOW_KEY_PROMPT =|### &|
s|^AUTO_SELECT =|### &|
s|^AUTO_WILDCARD =|### &|
s|^AUTO_COMMIT =|### &|
s|^AUTO_SPLIT =|### &|
s|^AUTO_FILL =|### &|
s|^DISCARD_INVALID_KEY =|### &|
s|^ALWAYS_SHOW_LOOKUP =|### &|
/^END_DEFINITION$/i\
SYMBOL = 閩\
PINYIN_MODE = FALSE\
COMMIT_KEYS = Return,KP_Enter\
SELECT_KEYS = F1,F2,F3,F4,F5,F6,F7,F8,F9,F10\
PAGE_UP_KEYS = Page_Up,KP_Page_Up\
PAGE_DOWN_KEYS = Page_Down,KP_Page_Down,space\
USER_CAN_DEFINE_PHRASE = TRUE
