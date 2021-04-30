#define N 10

int x = 0
bool end = 0

proctype counter() {
    do
    :: (x > N) -> break
    :: x = x + 1
    od;
    end = 1
}

proctype printer() {
    do
    :: (end) -> break
    ::  if
            :: atomic { (x % 2) -> printf("x=%d\n", x) }
            :: skip
        fi
    od
}

init {
    run printer();
    run counter();
}
