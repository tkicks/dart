// Copyright (c) 2014, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

import 'package:presentation/nav_menu.dart';
import 'package:route_hierarchical/client.dart';

void main() {
  initNavMenu();

  // Webapps need routing to listen for changes to the URL.
  var router = new Router();
  router.root
    ..addRoute(name: 'background', path: '/background', enter: showBackground)
    ..addRoute(name: 'home', defaultRoute: true, path: '/', enter: showHome);
  router.listen();
}

void showBackground(RouteEvent e) {
  // Extremely simple and non-scalable way to show different views.
  querySelector('#home').style.display = 'none';
  querySelector('#background').style.display = '';
}

void showHome(RouteEvent e) {
  querySelector('#home').style.display = '';
  querySelector('#background').style.display = 'none';
}
