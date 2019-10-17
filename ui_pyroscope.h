#ifndef UI_PYROSCOPE_H
#define UI_PYROSCOPE_H

#include <string>


namespace ps {

#define COL_SYS_BASE_CH 70
#define COL_SYS_BASE 90

enum AlertKind {
    ALERT_NORMAL,
    ALERT_NORMAL_CYCLING, // Tried all trackers
    ALERT_NORMAL_GHOST, // no data
    ALERT_GENERIC,
    ALERT_TIMEOUT,
    ALERT_CONNECT,
    ALERT_REQUEST,
    ALERT_GONE,
    ALERT_PERMS,
    ALERT_DOWN,
    ALERT_DNS,
    ALERT_MAX
};


enum ColorKind {
    COL_DEFAULT,
    COL_CUSTOM1,
    COL_CUSTOM2,
    COL_CUSTOM3,
    COL_CUSTOM4,
    COL_CUSTOM5,
    COL_CUSTOM6,
    COL_CUSTOM7,
    COL_CUSTOM8,
    COL_CUSTOM9,
    COL_PROGRESS0, // 10
    COL_PROGRESS20,
    COL_PROGRESS40,
    COL_PROGRESS60,
    COL_PROGRESS80,
    COL_PROGRESS100,
    COL_PROGRESS120,
    COL_TITLE,
    COL_FOOTER,
    COL_FOCUS,
    COL_LABEL, // 20
    COL_INFO,
    COL_ALARM,
    COL_COMPLETE,
    COL_SEEDING,
    COL_STOPPED,
    COL_QUEUED,
    COL_INCOMPLETE,
    COL_LEECHING,
    COL_ODD,
    COL_EVEN,
    COL_MAX,

    COL_ACTIVE_TIME = COL_SYS_BASE_CH,
    COL_UNSAFE_DATA,
    COL_THROTTLE_CH,
    COL_ETA_TIME,

    COL_DOWN_TIME = COL_SYS_BASE,
    COL_PRIO,
    COL_STATE,
    COL_RATIO,
    COL_PROGRESS,
    COL_ALERT,
    COL_UP_TIME,
    COL_SYS_MAX
};

} // namespace

// defined in command_pyroscope.cc (exported here so we only have to patch in one .h)
extern void add_capability(const char* name);
extern size_t u8_length(const std::string& text);
extern std::string u8_chop(const std::string& text, size_t glyphs);

#endif
