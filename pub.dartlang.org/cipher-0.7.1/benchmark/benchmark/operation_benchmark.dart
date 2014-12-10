// Copyright (c) 2013-present, Iván Zaera Avellón - izaera@gmail.com

// This library is dually licensed under LGPL 3 and MPL 2.0. See file LICENSE for more information.

// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of
// the MPL was not distributed with this file, you can obtain one at http://mozilla.org/MPL/2.0/.

library cipher.benchmark.benchmark.rate_benchmark;

import 'package:benchmark_harness/benchmark_harness.dart';


typedef void Operation();

class OperationBenchmark extends BenchmarkBase {

  static const _RUN_LENGTH_MILLIS = 6000;

  final Operation _operation;
  final int _runLengthMillis;

  int _iterations;

  OperationBenchmark(String name, this._operation, [this._runLengthMillis=_RUN_LENGTH_MILLIS]) :
    super(name, emitter: new OperationEmitter()) {
    emitter.benchmark = this;
  }

  OperationEmitter get emitter => super.emitter;

  void run() {
    _operation();
  }

  void exercise() {
    _iterations = 0;

    var watch = new Stopwatch()..start();
    while (watch.elapsedMilliseconds < _runLengthMillis) {
      run();
      _iterations++;
    }
  }

}

class OperationEmitter implements ScoreEmitter {

  OperationBenchmark benchmark;

  int get iterations => benchmark._iterations;

  void emit(String testName, double value) {
    var ms = value/1000;
    var s = ms/1000;
    print("| ${testName} | "
          "${_formatOperations(iterations/s)}/s | "
          "${iterations} iterations | "
          "${ms.toInt()} ms |");
  }

  String _formatOperations(num opsPerSec) {
    if (opsPerSec < 1000) {
      return "${opsPerSec.toStringAsFixed(2)} Ops";
    } else if (opsPerSec < (1000*1000)) {
      return "${(opsPerSec/1000).toStringAsFixed(2)} KOps";
    } else if (opsPerSec < (1000*1000*1000)) {
      return "${(opsPerSec/(1000*1000)).toStringAsFixed(2)} MOps";
    } else {
      return "${(opsPerSec/(1000*1000*1000)).toStringAsFixed(2)} GOPs";
    }
  }

}
