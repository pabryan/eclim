" Author:  Eric Van Dewoestine
" Version: $Revision$
"
" Description: {{{
"   Test case for logging.vim
"
" License:
"
" Copyright (c) 2005 - 2006
"
" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at
"
"      http://www.apache.org/licenses/LICENSE-2.0
"
" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.
"
" }}}

" SetUp() {{{
function! SetUp ()
  exec 'cd ' . g:TestEclimWorkspace . 'eclim_unit_test_java'
endfunction " }}}

" TestLoggerDefine() {{{
function! TestLoggerDefine ()
  edit! src/org/eclim/test/logging/TestLoggingVUnit.java
  call PeekRedir()

  call cursor(5, 3)
  normal ologger.
  call PeekRedir()

  echom '|' . getline(1)
  echom '|' . getline(2)
  echom '|' . getline(3)
  call VUAssertTrue(search('^import .*Log;$'),
    \ 'Logger import not found.')
  call VUAssertTrue(search('^\s*private static final Log logger.*'),
    \ 'Logger declaration not found.')

  bdelete!
endfunction " }}}

" vim:ft=vim:fdm=marker
