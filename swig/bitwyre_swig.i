/* -*- c++ -*- */

#define BITWYRE_API

%include "gnuradio.i"			// the common stuff

//load generated python docstrings
%include "bitwyre_swig_doc.i"

%{
#include "bitwyre/square_ff.h"
%}


%include "bitwyre/square_ff.h"
GR_SWIG_BLOCK_MAGIC2(bitwyre, square_ff);
