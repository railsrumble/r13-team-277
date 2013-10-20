toDoApp.controller('TodoController', function TodoController($scope, $resource, $http,  filterFilter)
{
    var todos = $scope.todos = [];
    var Task=$resource("/tasks");
    todos = $scope.todos=Task.query();
    
    
    $scope.newTodo = '';
    $scope.editedTodo = null;

    $scope.$watch('todos', function (newValue, oldValue)
    {
        console.log(todos)
        $scope.pendingCount = filterFilter(todos, { completed: false }).length;
        $scope.completedCount = todos.length - $scope.pendingCount;
        $scope.allCompleted = !$scope.pendingCount;
        if (newValue !== oldValue)
        { // This prevents unneeded calls to the local storage
            //todoStorage.put(todos);
        }
    }, true);

    
    $scope.createTodo = function ()
    {
        var newTodo = $scope.newTodo.trim();
        if (!newTodo.length)
        {
            return;
        }
        var newTask= new Task({description: newTodo,priority:Math.floor(Math.random() *5)+1,
            task_type: "Type"+Math.floor(Math.random() *500)+1}
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

    $scope.completeAll = function (completed)
    {
        todos.forEach(function (todo)
        {
            todo.completed = completed;
        });
    };
});