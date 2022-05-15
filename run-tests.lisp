(require "asdf")

(push (uiop/os:getcwd) asdf:*central-registry*)

(asdf:load-system "iterate/tests")

(uiop:quit (if (asdf:test-system "iterate") 0 1))
