/* En este archivo escribirás tu solución.
 * Para ello deberás completar las rutinas en código
 * ensamblador.
 * Puedes usar los registros R0 a R12 pues ya está preservado
 * el valor de los registros que deben mantenerse.
 * Los registros R0 a R3 contienen los argumentos al entrar a
 * la rutina y contendrán el valor devuelto al salir.
 * Si realizas un llamado a subrutina, los registros R0 a R3 y el
 * registro R12 pueden cambiar su valor (y en particular, R0 contiene 
 * normalmente el valor devuelto), los registros R8 a R11 preservan
 * su valor.
 */
.syntax unified
.cpu cortex-m3
.fpu softvfp
.thumb

.macro defun nombre
    .section .text.\nombre
    .global \nombre
    .type \nombre, %function
\nombre:
.endm

.macro endfun nombre
    .size \nombre, . - \nombre
.endm


/**
 * Sumar dos enteros de 32 bit
 *  suma(2,3) => 5
 * Entrada
 *  a->R0, b->R1 : sumandos, enteros de 32 bit con signo 
 * Salida
 *  R0     : suma, entero de 32 bit con signo
 */
defun suma
    push {r4-r11,lr}
    // Insertar código a continuación

    ADD R0,R1

    // Retorno, antes R0 debe tener el valor correcto
    pop {r4-r11,pc}
endfun suma

/**
 * Sumar los números de un arreglo en memoria de enteros de
 * 32 bit con resultado de 64 bit.
 *
 * sumatoria(5,(uint32_t[]){1,2,3,4,5}) => 15
 *
 * Entrada 
 *  n->R0    : Cantidad de números en registro R0, entero de 32 bit
 *  b->R1    : Dirección en memoria del primer número, puntero a
 *             entero de 32 bit con signo.
 * Salida
 *  R1:R0 : Sumatoria, entero de 64 bit con signo 
 */
defun sumatoria
    push {r4-r11,lr}
    // Insertar código a continuación

// Declaro las variables contador y acumulador

    MOV R2,#0 //Acumulador parte baja= 0
    MOV R3,#0 //Acumulador parte alta= 0
    MOV R8,#0 //Indice = 0
    0: 
    CMP R8,R0 //Compara i con n
    BGE 1f //Si i es mayor o igual que n salta a la etiqueta 1

    LDR R7,[R1,R8,lsl #2] //Carga el elemento actual del vector en R7
    ASR R5,R7,#31
    ADDS R2,R7 //Parte baja
    ADC R3,R5  //Parte alta
    ADD R8,#1 // i=i+1
    B 0b // Retorno a la etiqueta 0
    1:
    MOV R1,R3 //Asigna el valor de la parte alta a R1
    MOV R0,R2 //Asigna el valor de la parte baja a R0

    pop {r4-r11,pc}
endfun sumatoria

/**
 * Encuentra la posicion del máximo elemento de un arreglo
 *
 * posicion_maximo(4,(uint32_t[]){1,4,2,3}) => 1
 *
 * Entrada:
 *  n->R0 : cantidad de números en el arreglo, entero de 32 bit
 *  b->R1 : posición en memoria del primer número, puntero
 *          a entero de 32 bit con signo.
 * Salida:
 *  R0 : posición del máximo elemento en el arreglo, entero
 *       de 32 bit.
 */
defun posicion_maximo
    push {r4-r11,lr}
    // Insertar código a continuación

    MOV R2,#0 //k = 0

    CMP R0,#1  // Comparo el valor de R0(n) con 1
    BLE 2f // Si R0(n) es menor o igual que 1, salto a la etiqueta 2

    LDR R3,[R1]        
    MOV R8,#1 // i=1

0:
    CMP R8,R0 //Comparo i con n
    BGE 2f // Si i es mayor o igual a 1, salto a la etiqueta 2

    LDR R7,[R1,#4]! //Carga en R7 el elemento en la posición R1+4, luego guarda en R1 el valor "R1+4"
    CMP R3,R7 //Comparo M con b[i]
    BGE 1f // Si M es mayor o igual que b[i], salto a la etiqueta 1

    MOV R3,R7 // M = b[i]
    MOV R2,R8 // k = i
1: 

    ADD R8,#1 //i = i+1
    B 0b //Retorno a la etiqueta 0 
2:
    //La etiqueta 2 representa la salida del bucle

    MOV R0,R2 //Copio en R0 la posición actual

    // Retorno, antes R0 debe tener el valor correcto
    pop {r4-r11,pc}
endfun posicion_maximo

/**
 * Ordenar de menor a mayor un arreglo de números en memoria.
 * La ordenación es en el lugar, sobreescribiendo el arreglo
 * original.
 *
 * uint32_t vals[]={4,1,3,5,2,6,7};
 * ordenar_en_sitio_menor_a_mayor(7,vals)
 * luego vals contendrá {1,2,3,4,5,6,7}
 *
 * Entrada:
 *  n->R0 : Cantidad de números en el arreglo, entero de 32 bit
 *  b->R1 : Dirección del primer número, puntero a entero de
 *          32 bit con signo.
 * Salida:
 *  Sin valor de salida. El arreglo dado debe haber sido ordenado
 *  sobreescribiendo los valores originales.
 */
defun ordenar_en_sitio_menor_a_mayor
    push {r4-r11,lr}
   MOV R6,R0 //cantidad de numeros n
   ADD R7,R6,#-1 // k=n-1
    MOV R8,R1 // b (dirección)
0:
    CMP R7,#0 // Comparo R7(k) con 0 
    BLE 1f // Si k es mayor o igual que 0, salto a la etiqueta 1 

    ADD R0,R7,#1 // R0 = k+1, cargo los parametros necesarios (k+1,b) antes del llamado a subrutina
    MOV R1,R8 // R1 = b
    BL posicion_maximo //Me retorna en R0 el índice donde está el máximo
    LDR R9,[R8,R7,LSL #2] // carga en R9 (x) el valor de b[k]
    LDR R5,[R8,R0,LSL #2] // carga en R5 el valor de b[j]
    STR R5,[R8,R7,LSL #2] // Guardo b[j] en la posición b[k]
    STR R9,[R8,R0,LSL #2] // Guardo R9 (x) en la posición  b[j]
    ADD R7,#-1             // k = k-1
    B 0b                  // Retorno a la etiqueta 0

1:
    pop {r4-r11,pc}

endfun ordenar_en_sitio_menor_a_mayor
    