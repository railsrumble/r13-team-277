'use strict';
var toDoApp = angular.module('toDoApp', ['ngResource']);
toDoApp.config([
  "$httpProvider", function($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  }
]);