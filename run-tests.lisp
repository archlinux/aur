(require "asdf")

(push (uiop/os:getcwd) asdf:*central-registry*)

(asdf:load-system "local-time/test")

(uiop:quit (if (asdf:test-system "local-time") 0 1))
