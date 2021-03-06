﻿toDoApp.controller('TodoController', function TodoController($scope, $resource, $http,  filterFilter)
{
    var todos = $scope.todos = [];
    var Task=$resource("/tasks/:id",{id:"@id"},{update:{method:"PUT"},remove:{method:"DELETE"}});
    todos = $scope.todos=Task.query();
    $scope.priorties=[
            {"priority":1,"text":"High"},
            {"priority":2,"text":"Medium"},
            {"priority":3,"text":"Low"}
        ];
    
    
    $scope.newTodo = '';

    $scope.priority=2;
    $scope.editedTodo = null;

    $scope.$watch('todos', function (newValue, oldValue)
    {
        $scope.pendingCount = filterFilter(todos, { completed: false }).length;
        $scope.completedCount = todos.length - $scope.pendingCount;
        $scope.allCompleted = !$scope.pendingCount;
        
    }, true);

    
    $scope.createTodo = function ()
    {
        var newTodo = $scope.newTodo.trim();
        if (!newTodo.length)
        {
            return;
        }
        var newTask= new Task({description: newTodo,
            priority:$scope.priority}
            );
        newTask.$save();
        todos.push(newTask);

        $scope.newTodo = '';
    };

    $scope.editTodo = function (todo)
    {
        $scope.editedTodo = todo;
        // Clone the original todo to restore it on demand.
        $scope.originalTodo = angular.extend({}, todo);
    };

    

    $scope.clearCompletedTodos = function ()
    {
        $scope.todos = todos = todos.filter(function (val)
        {
            return !val.completed;
        });
    };
    $scope.complete = function (todo)
    {
        todo.completed=!todo.completed;
        todo.$update();
    };
    $scope.delete = function (todo)
    {
        todo.completed=!todo.completed;
        todo.$remove();
        todos.splice(todos.indexOf(todo),1);

    };

    $scope.completeAll = function ()
    {
        todos.forEach(function (todo)
        {
          if(todo.completed === false){
            todo.completed = true;
            todo.$update();
          }
        });
        
    };
    $scope.isCompleted = function (todo)
    {
        
         return   todo.completed;
        
    };
     $scope.isPending = function (todo)
    {
        
         return   !todo.completed;
        
    };
});