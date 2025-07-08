# Force case-sensitive search
string(COMPARE EQUAL "mavlink" "${CMAKE_FIND_PACKAGE_NAME}" case_sensitive_match)
if (NOT case_sensitive_match)
  if (NOT ${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
    message(AUTHOR_WARNING "got '${CMAKE_FIND_PACKAGE_NAME}', use case-sensitive find_package(mavlink) instead")
  endif()
  set(${CMAKE_FIND_PACKAGE_NAME}_FOUND false)
  return()
endif()

if (mavlink_CONFIG_INCLUDED)
  return()
endif()
set(mavlink_CONFIG_INCLUDED TRUE)

get_filename_component(include "${mavlink_DIR}/../../../include" ABSOLUTE)
set(mavlink_INCLUDE_DIRS ${include})
set(mavlink_DIALECTS ASLUAV;AVSSUAS;all;ardupilotmega;common;csAirLink;cubepilot;development;icarous;loweheiser;matrixpilot;standard;storm32;uAvionix;ualberta)
set(mavlink2_DIALECTS ASLUAV;AVSSUAS;all;ardupilotmega;common;csAirLink;cubepilot;development;icarous;loweheiser;matrixpilot;standard;storm32;uAvionix;ualberta)
