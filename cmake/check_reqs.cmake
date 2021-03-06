set(HAVE_LIBSODIUM FALSE)

get_property(nacl_required GLOBAL PROPERTY NACL_REQUIRED)
if(${nacl_required})
  if("${NACL_LIBRARIES}" STREQUAL "")
    if(ENABLE_LIBSODIUM)
      message(FATAL_ERROR "libsodium is not available, but a selected module needs it")
    else(ENABLE_LIBSODIUM)
      message(FATAL_ERROR "NaCl is not available, but a selected module needs it")
    endif(ENABLE_LIBSODIUM)
  endif()

  if(ENABLE_LIBSODIUM)
    set(HAVE_LIBSODIUM TRUE)
  endif(ENABLE_LIBSODIUM)
else(${nacl_required})
  set(NACL_INCLUDE_DIRS "")
  set(NACL_CFLAGS_OTHER "")
  set(NACL_LIBRARY_DIRS "")
  set(NACL_LIBRARIES "")
  set(NACL_LDFLAGS_OTHER "")
endif(${nacl_required})
