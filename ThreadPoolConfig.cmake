if(NOT TARGET threadpool::threadpool)
	add_library(threadpool::threadpool INTERFACE IMPORTED)
	set_target_properties(threadpool::threadpool PROPERTIES
		INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_LIST_DIR}/include")
endif()
