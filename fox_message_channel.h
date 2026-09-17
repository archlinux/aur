#ifndef FOX_MESSAGE_CHANNEL_H
#define FOX_MESSAGE_CHANNEL_H

#include <fx.h>
#include <pthread.h>
#include <unistd.h>
#include <string.h>
#include <deque>

// Emulation of FOX 1.7's FXMessageChannel for FOX 1.6.
// Messages posted from worker threads are queued and delivered to the
// target in the GUI thread via a pipe registered with FXApp::addInput().
class FXMessageChannel : public FXObject {
private:
    enum { PIPE_ID = 40000 };  // arbitrary unique id for our selector

    struct Message {
        FXObject*   target;
        FXSelector  selector;
        void*       ptr;    // pointer actually delivered to the handler
        char*       data;   // heap copy of the payload (if len > 0)
    };

    // Member variables
    FXApp*          m_app;
    pthread_mutex_t m_mutex;
    int             m_pipe[2];
    std::deque<Message> m_queue;

public:
    FXMessageChannel(FXApp* app) : m_app(app), m_pipe{-1, -1} {
        pthread_mutex_init(&m_mutex, NULL);
#ifndef _WIN32
        if (pipe(m_pipe) == 0) {
            // Note: SEL_IO_READ (not SEL_IOREAD) - matches fxdefs.h
            m_app->addInput(m_pipe[0], INPUT_READ, this,
                            FXSEL(SEL_IO_READ, PIPE_ID));
        }
#else
        // No pipe on Windows: direct delivery only
#endif
    }

    ~FXMessageChannel() {
#ifndef _WIN32
        if (m_pipe[0] >= 0) {
            if (m_app) m_app->removeInput(m_pipe[0], INPUT_READ);
            close(m_pipe[0]);
            close(m_pipe[1]);
        }
#endif
        while (!m_queue.empty()) {
            delete[] m_queue.front().data;
            m_queue.pop_front();
        }
        pthread_mutex_destroy(&m_mutex);
    }

    // Post a message. If len > 0, len bytes are copied from ptr.
    void message(FXObject* target, FXSelector selector, void* ptr, FXint len) {
        if (m_pipe[1] < 0) {
            // Fallback: deliver immediately (should only be called from GUI thread)
            target->handle(target, selector, ptr);
            return;
        }

        Message msg;
        msg.target = target;
        msg.selector = selector;
        if (len > 0 && ptr != NULL) {
            msg.data = new char[len];
            memcpy(msg.data, ptr, len);
            msg.ptr = msg.data;
        } else {
            msg.data = NULL;
            msg.ptr = ptr;
        }

        pthread_mutex_lock(&m_mutex);
        m_queue.push_back(msg);
        pthread_mutex_unlock(&m_mutex);

        char c = 1;
        if (write(m_pipe[1], &c, 1) < 0) { /* ignore */ }
    }

    // Deliver all queued messages (runs in the GUI thread)
    void flush() {
        std::deque<Message> pending;
        pthread_mutex_lock(&m_mutex);
        pending.swap(m_queue);
        pthread_mutex_unlock(&m_mutex);

        while (!pending.empty()) {
            Message& msg = pending.front();
            msg.target->handle(msg.target, msg.selector, msg.ptr);
            delete[] msg.data;
            pending.pop_front();
        }
    }

    // Intercept the pipe-read notification from the event loop
    virtual long handle(FXObject* sender, FXSelector sel, void* ptr) {
        // Note: SEL_IO_READ (not SEL_IOREAD)
        if (FXSELTYPE(sel) == SEL_IO_READ && FXSELID(sel) == PIPE_ID) {
            char buf[512];
            if (read(m_pipe[0], buf, sizeof(buf)) > 0)
                flush();
            return 1;
        }
        return FXObject::handle(sender, sel, ptr);
    }
};

#endif
