/*
 * Philip's Simple Namegen
 *
 * Copyright (c) 2018 Philip Pavlick
 *
 * I JUST DON'T CARE what you do with this code as long as the above copyright
 * notice, this message, and the below warranty and liability disclaimers are
 * retained in all source distributions.  Do not use my name in advertising or
 * otherwise to promote this code unless I have given you explicit prior
 * written authorization to do so.
 * 
 * THIS CODE IS PROVIDED "AS-IS," AND ALL WARRANTIES INCLUDING THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS TO A PARTICULAR PURPOSE ARE
 * HEREBY DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR(S) OR OTHER CONTRIBUTORS
 * BE HELD LIABLE FOR ANY CLAIM, DAMAGES, OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT, OR OTHERWISE, ARISING FROM, OUT OF, OR IN
 * CONNECTION WITH THIS CODE OR THE USE OR OTHER DEALINGS IN THIS CODE, EVEN
 * IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
 */

import std.stdio : write;
import std.random;
import core.stdc.time;

int main( string[] args )
{
  // An array of `con`sonants:
  char[] con = "nrlstmhzx".dup;
  // An array of `vow`els:  Note that a ' has also been included to sometimes
  // cause a glottal stop to be used in place of a vowel
  char[] vow = "aoeui\'y".dup;

  Random Lucky = Random( cast(int).core.stdc.time.time(null) );

  foreach( c; 0 .. uniform( 2, 4, Lucky ) )
  {
    uint cc = uniform( 0, con.length, Lucky );
    write( con[cc] );
    if( uniform( 0, 6 ) == 0 )
      write( con[cc] );
    write( vow[uniform( 0, vow.length, Lucky )] );
  }

  return 0;
}

/////////////////////////////////
// Instructions for compiling: //
/////////////////////////////////
// dmd namgen.d -of=namgen

///////////////////////////////
// Instructions for running: //
///////////////////////////////
// Run namgen from the command line by typing "namgen."  After running, it
// will print a hopefully memorable and catchy name anywhere from 4 to 8
// letters long.  There is no other output from this program.
