// No-op stand-in for qBreakpad's handler: crash dumps are disabled in this build.
#pragma once
#include <QString>

class QBreakpadHandler {
public:
    static QBreakpadHandler &instance() { static QBreakpadHandler h; return h; }
    void setDumpPath(const QString &) {}
};

#define QBreakpadInstance QBreakpadHandler::instance()
