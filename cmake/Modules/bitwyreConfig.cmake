INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_BITWYRE bitwyre)

FIND_PATH(
    BITWYRE_INCLUDE_DIRS
    NAMES bitwyre/api.h
    HINTS $ENV{BITWYRE_DIR}/include
        ${PC_BITWYRE_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    BITWYRE_LIBRARIES
    NAMES gnuradio-bitwyre
    HINTS $ENV{BITWYRE_DIR}/lib
        ${PC_BITWYRE_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(BITWYRE DEFAULT_MSG BITWYRE_LIBRARIES BITWYRE_INCLUDE_DIRS)
MARK_AS_ADVANCED(BITWYRE_LIBRARIES BITWYRE_INCLUDE_DIRS)

