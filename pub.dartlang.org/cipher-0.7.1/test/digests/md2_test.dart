// Copyright (c) 2013-present, Iván Zaera Avellón - izaera@gmail.com

// This library is dually licensed under LGPL 3 and MPL 2.0. See file LICENSE for more information.

// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of
// the MPL was not distributed with this file, you can obtain one at http://mozilla.org/MPL/2.0/.

library cipher.test.digests.md2_test;

import "package:cipher/cipher.dart";
import "package:cipher/impl/base.dart";

import "../test/digest_tests.dart";

/// NOTE: the expected results for these tests are computed using the Java version of Bouncy Castle.
void main() {

  initCipher();

  runDigestTests( new Digest("MD2"), [

    "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
    "70bdf19ce16c171706e9ef02219f35a8",

    "En un lugar de La Mancha, de cuyo nombre no quiero acordarme...",
    "2b6aa7a2fe344c9bd4844c73c306a26a",

  ]);

}

