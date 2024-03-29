find_path(MBEDTLS_INCLUDE_DIR mbedtls/ssl.h)

find_library(MBEDTLS_LIBRARY mbedtls)
find_library(MBEDX509_LIBRARY mbedx509)
find_library(MBEDCRYPTO_LIBRARY mbedcrypto)

set(MBEDTLS_INCLUDE_DIRS ${MBEDTLS_INCLUDE_DIR})
set(MBEDTLS_LIBRARIES ${MBEDTLS_LIBRARY} ${MBEDX509_LIBRARY} ${MBEDCRYPTO_LIBRARY})

set(CMAKE_REQUIRED_INCLUDES ${MBEDTLS_INCLUDE_DIRS})
check_cxx_source_compiles("
	#include <mbedtls/version.h>
	#if MBEDTLS_VERSION_NUMBER < 0x02040000
	#error \"Your mbed TLS version is too old.\"
	#endif
	int main() {}"
	MBEDTLS_VERSION_OK)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(MBEDTLS DEFAULT_MSG
	MBEDTLS_INCLUDE_DIR MBEDTLS_LIBRARY MBEDX509_LIBRARY MBEDCRYPTO_LIBRARY MBEDTLS_VERSION_OK)

mark_as_advanced(MBEDTLS_INCLUDE_DIR MBEDTLS_LIBRARY MBEDX509_LIBRARY MBEDCRYPTO_LIBRARY)
