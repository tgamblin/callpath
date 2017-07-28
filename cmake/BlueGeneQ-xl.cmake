# the name of the target operating system
set(CMAKE_SYSTEM_NAME BlueGeneQ-dynamic)

# Set search paths to prefer local, admin-installed wrappers for the BG backend compilers
set(BGQ_XL_COMPILER_SEARCH_PATHS
  /usr/local/bin
  /usr/bin
  /opt/ibmcmp/vac/bg/12.1/bin
  /opt/ibmcmp/vacpp/bg/12.1/bin
  /opt/ibmcmp/xlf/bg/14.1/bin)

# XL C Compilers
find_program(CMAKE_C_COMPILER       bgxlc      ${BGQ_XL_COMPILER_SEARCH_PATHS})
find_program(CMAKE_CXX_COMPILER     bgxlc      ${BGQ_XL_COMPILER_SEARCH_PATHS})
find_program(CMAKE_Fortran_COMPILER bgxlf90    ${BGQ_XL_COMPILER_SEARCH_PATHS})

# Make sure MPI_COMPILER wrapper matches the gnu compilers.
# Prefer local machine wrappers to driver wrappers here too.
find_program(MPI_COMPILER NAMES mpixlc mpxlc
  PATHS
  /usr/local/bin
  /usr/bin
  /bgsys/drivers/ppcfloor/comm/gcc/bin)