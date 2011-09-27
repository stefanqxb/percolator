

FIND_PATH(XSD_INCLUDE_DIR xsd/cxx/parser/elements.hxx PATH_SUFFIXES libxsd PATHS
  "[HKEY_CURRENT_USER\\software\\xsd\\include]"
  "[HKEY_CURRENT_USER]\\xsd\\include]"
  /usr/local/include
  /usr/local/include/xsd
  /usr/include
  /usr/include/xsd
  "C:/Program Files/CodeSynthesis XSD 3.3/include"
  "D:/Program Files/CodeSynthesis XSD 3.3/include"
)

# the value of XSD_INCLUDE_DIR should be set by the FIND_PATH routine above
# IF(MINGW)
#   set (XSD_INCLUDE_DIR /mnt/VirtualBoxShare/xsd-3.3.0-x86_64-linux-gnu/libxsd)
# ENDIF()

FIND_PROGRAM(XSD_EXECUTABLE 
  NAMES 
    xsd xsdcxx
  PATHS
    "[HKEY_CURRENT_USER\\xsd\\bin]"
    /usr/local/bin
    /usr/bin
    "[HKEY_CURRENT_USER\\xsd\\bin]" $ENV{XSDDIR}/bin
    "C:/Program Files/CodeSynthesis XSD 3.3/bin"
    "D:/Program Files/CodeSynthesis XSD 3.3/bin"
)

# if the include and the program are found then we have it
IF(XSD_INCLUDE_DIR)
  IF(XSD_EXECUTABLE)
    SET( XSD_FOUND "YES" )
  ENDIF(XSD_EXECUTABLE)
ENDIF(XSD_INCLUDE_DIR)

# MESSAGE(STATUS "XSD_INCLUDE_DIR=${XSD_INCLUDE_DIR}")
# MESSAGE(STATUS "XSD_EXECUTABLE=${XSD_EXECUTABLE}")

MARK_AS_ADVANCED(
  XSD_INCLUDE_DIR
  XSD_EXECUTABLE
) 