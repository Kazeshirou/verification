#define N 6

proctype fibonacci(chan p; byte n){
    int f1 = 0;
    int f2 = 1;
    int result = 0;
    byte current_n = 1;
    do
    :: (n == 0) -> break
    :: (n == 1) ->
        result = f2;
        break 
    :: (current_n < n) ->
        result = f1 + f2;
        f1 = f2;
        f2 = result;
        current_n = current_n + 1
    :: (current_n == n) -> break
    od;
    p!result
}


init {
    chan child = [1] of {int}
    int result;

    run fibonacci(child, N);
    child?result;
    printf("result: %d\n", result)
}
