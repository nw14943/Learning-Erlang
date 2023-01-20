% This header is required.
% This is how you access the functions defined in the program
% hello_world:FUNCTION_NAME(PARAMETERS)
-module(learningErlang).
% This is where you can decide which functions are available to the client.
% -compile(export_all). to export all (this is not recomended)
-export([test1/0]).

% io:format is used to diplay to the user.
hello_world() -> io:format("Hello World~n").

% Pattern matching with function parameters.
% If add is called with two parameters, this will be called.
add(Num1, Num2) -> Num1 + Num2. % Variables start with capital letters.
% If the user wants to call add with three parameters, this will be called.
add(Num1, Num2, Num3) -> Num1 + Num2 + Num3.

% Recursion (fibonacci sequence)
% These are the base cases to make sure that the recursion will end.
fib(0) -> 0; % If the value in the function is 0 we want to return 0
fib(1) -> 1; % If the value in the function is 1 we want to return 1
% This will call itself in order to calculate a fibonacci number.
fib(Num) -> fib(Num-1) + fib(Num-2).

% Guards
% Guards use the when keyword.
% The underscore is used for variables that are not used.
isPositive(_Num) when _Num > 0 -> true; %io:format("Yes"); % Chosen when Num > 0
isPositive(_Num) when _Num < 0 -> false; %io:format("No"); % Chosen when Num < 0
isPositive(_Num) -> false. %io:format("Zero"). % Otherwise it is 0

% Lists
% Creates a new list with the item at the front.
prepend(List, Item) -> [Item|List].
% List comprehensions are shown with || and <-
listDouble(List) -> [X * 2 || X <- List].
listComprehension(List, Function) -> [Function(X) || X <- List].

% Lambda Functions
% The map function exeucutes a function on each element of a list.
listIncrement(List) -> lists:map(fun(X) -> X + 1 end, List).
% The filter function returns a list of all the elements that satisfy an equation.
listBigger(List, Value) -> lists:filter(fun(X) -> X > Value end, List).
% The foldl function returns a value that represents the entire list based on an function and accumulator.
listSum(List) -> lists:foldl(fun(X, Acc) -> X + Acc end, 0, List).


% This function will allow me to run all the code without having to worry about each function.
test1() -> 
    hello_world(),
    9 = add(3, 6),
    13 = add(3, 6, 4),
    3 = fib(4),
    true = isPositive(1),
    false = isPositive(-3),
    false = isPositive(0),
    [0,1,2,3,4,5] = prepend([1,2,3,4,5], 0),
    [2,4,6,8,10] = listDouble([1,2,3,4,5]),
    % Using a lambda function.
    % fun(Parameters) -> FUNCTION end
    [2,4,6,8,10] = listComprehension([1,2,3,4,5], fun(X) -> 2 * X end),
    [2,3,4,5,6] = listIncrement([1,2,3,4,5]),
    [4,5] = listBigger([1,2,3,4,5], 3),
    15 = listSum([1,2,3,4,5]),
    ok.