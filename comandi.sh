alias compila='aarch64-linux-gnu-gcc -static'


compilaesegui(){
    aarch64-linux-gnu-gcc -static "$1" &&
qemu-aarch64 a.out

}