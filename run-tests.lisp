(require "asdf")

(push (uiop/os:getcwd) asdf:*central-registry*)

(pushnew :md5-testing cl:*features*)

(asdf:load-system "md5")

(unless (md5::test-rfc1321)
  (uiop:quit 1))

(uiop:quit (if (md5::test-other) 0 1))
