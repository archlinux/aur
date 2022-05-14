(require "asdf")

(push (uiop/os:getcwd) asdf:*central-registry*)

(asdf:load-system "ieee-floats")

(uiop:quit (if (asdf:test-system :ieee-floats) 0 1))
