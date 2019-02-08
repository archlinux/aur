#
# FindTGBOT
#
# Try to find TgBot : Telegram Bot API
# This module defines
# - TGBOT_INCLUDE_DIRS
# - TGBOT_LIBRARIES
# - TGBOT_FOUND
#
# If TGBOT_AUTO_DEPS is set to ON this will also resolve
# the following libraries:
#
# Threads (required):
#  - CMAKE_THREAD_LIBS_INIT
#
# OpenSSL (required):
#  - OPENSSL_INCLUDE_DIR
#  - OPENSSL_LIBRARIES
#  - OPENSSL_FOUND
#
# Boost (required):
#  - Boost_INCLUDE_DIR
#  - Boost_LIBRARIES
#  - Boost_FOUND
#
# CURL (optional):
#  - CURL_INCLUDE_DIRS
#  - CURL_LIBRARIES
#  - CURL_FOUND
#

include(FindPackageHandleStandardArgs)


find_path(
	TGBOT_INCLUDE_DIRS
	DOC "The directory where tgbot/Bot.h resides"
	NAMES tgbot/Bot.h
	PATHS
		/usr/include
		/usr/local/include
		/sw/include
		/opt/local/include
)

find_library(
	TGBOT_LIBRARIES
	DOC "The directory where libTgBot.so resides"
	NAMES TgBot
	PATHS
		/usr/lib64
		/usr/lib
		/usr/local/lib64
		/usr/local/lib
		/sw/lib
		/opt/local/lib
)

find_package_handle_standard_args(TGBOT DEFAULT_MSG TGBOT_INCLUDE_DIRS TGBOT_LIBRARIES)

if (TGBOT_AUTO_DEPS)
	find_package(Threads REQUIRED)
	list(APPEND TGBOT_LIBRARIES ${CMAKE_THREAD_LIBS_INIT})

	find_package(OpenSSL REQUIRED)
	list(APPEND TGBOT_INCLUDE_DIRS ${OPENSSL_INCLUDE_DIR})
	list(APPEND TGBOT_LIBRARIES ${OPENSSL_LIBRARIES})

	find_package(Boost COMPONENTS system REQUIRED)
	list(APPEND TGBOT_INCLUDE_DIRS ${Boost_INCLUDE_DIR})
	list(APPEND TGBOT_LIBRARIES ${Boost_LIBRARIES})

	find_package(CURL)
	if (CURL_FOUND)
		list(APPEND TGBOT_INCLUDE_DIRS ${CURL_INCLUDE_DIRS})
		list(APPEND TGBOT_LIBRARIES ${CURL_LIBRARIES})
	endif ()
endif ()

mark_as_advanced(TGBOT_INCLUDE_DIRS TGBOT_LIBRARIES)

