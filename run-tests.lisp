(require "asdf")

(push (uiop/os:getcwd) asdf:*central-registry*)

(asdf:load-system "anaphora")

(uiop:quit (if (asdf:test-system :anaphora) 0 1))
