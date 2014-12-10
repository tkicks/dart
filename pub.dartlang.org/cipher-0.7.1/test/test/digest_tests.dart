// Copyright (c) 2013-present, Iván Zaera Avellón - izaera@gmail.com

// This library is dually licensed under LGPL 3 and MPL 2.0. See file LICENSE for more information.

// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of
// the MPL was not distributed with this file, you can obtain one at http://mozilla.org/MPL/2.0/.

library cipher.test.test.digest_tests;

import "package:cipher/cipher.dart";
import "package:unittest/unittest.dart";

import "./src/helpers.dart";

void runDigestTests( Digest digest, List<String> plainDigestTextPairs ) {

  group( "${digest.algorithmName}:", () {

    group( "digest:", () {

      for( var i=0 ; i<plainDigestTextPairs.length ; i+=2 ) {

        var plainText = plainDigestTextPairs[i];
        var digestText = plainDigestTextPairs[i+1];

        test( "${formatAsTruncated(plainText)}", () =>
          _runDigestTest( digest, plainText, digestText )
        );

      }
    });

  });

}

void _runDigestTest( Digest digest, String plainTextString, String expectedHexDigestText ) {
  digest.reset();

  var plainText = createUint8ListFromString( plainTextString );
  var out = digest.process(plainText);
  var hexOut = formatBytesAsHexString(out);

  expect( hexOut, equals(expectedHexDigestText) );
}

