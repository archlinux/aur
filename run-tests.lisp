(require "asdf")

(push (uiop/os:getcwd) asdf:*central-registry*)

(asdf:load-system "esrap/tests")
(asdf:load-system "fiveam")

(uiop:quit (if (asdf:test-system "esrap") 0 1))
