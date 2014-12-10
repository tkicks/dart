// Copyright (c) 2013-present, Iván Zaera Avellón - izaera@gmail.com

// This library is dually licensed under LGPL 3 and MPL 2.0. See file LICENSE for more information.

// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of
// the MPL was not distributed with this file, you can obtain one at http://mozilla.org/MPL/2.0/.

library cipher.test.digests.ripemd320_test;

import "package:cipher/cipher.dart";
import "package:cipher/impl/base.dart";

import "../test/digest_tests.dart";

/// NOTE: the expected results for these tests are computed using the Java version of Bouncy Castle
void main() {

  initCipher();

  runDigestTests( new Digest("RIPEMD-320"), [

    "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
    "64a765d4c54e5a7fab2f09d833eea3aed68b327c949f3b9b167be59e049bb2b23bb3c1613308a25b",

    "En un lugar de La Mancha, de cuyo nombre no quiero acordarme...",
    "45b72f4944bad47751ce6a80bfe68c7eb98e9e67edd91f3dad3f6dd470e04f61711766d3d24b9ebe",

  ]);

}

