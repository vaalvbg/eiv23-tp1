/* En este archivo escribirás tu solución.
 * Para ello deberás completar las rutinas en código
 * ensamblador.
 * Puedes usar los registros R0 a R12 pues ya está preservado
 * el valor de los registros que deben mantenerse.
 * Los registros R0 a R3 contienen los argumentos al entrar a
 * la rutina y contendrán el valor devuelto al salir.
 * Si realizas un llamado a subrutina, los registros R0 a R3 y el
 * registro R12 pueden cambiar su valor (y en particular, R0 contiene 
 * normalmente el valor devuelto), los registros R4 a R11 preservan
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
 * @brief Sumar dos enteros de 32 bit
 * 
 * @param A registro R0
 * @param B registro R1
 * @return int32_t registro R0 
 */
defun suma
    push {r4-r11,lr}
    // Insertar código a continuación

    // Retorno, antes R0 debe tener el valor correcto
    pop {r4-r11,pc}
endfun suma

/**
 * @brief Sumar los números de un arreglo en memoria
 * 
 * @param cuenta Cantidad de números en registro R0
 * @param numeros Dirección del primer número en registro R1
 * @return int64_t parte alta en R1, parte baja en R0 
 */
defun sumatoria
    push {r4-r11,lr}
    // Insertar código a continuación

    // Retorno, antes R0 debe tener el valor correcto
    pop {r4-r11,pc}
endfun sumatoria

/**
 * @brief Encuentra la posicion del máximo elemento de un arreglo
 * 
 * @param cuenta cantidad de números en el arreglo, registro R0
 * @param numeros dirección del primer número, registro R1
 * @return uint32_t Posición del mayor número, 0 : inicio del arreglo, 1: segundo número, etc.
 */
defun posicion_maximo
    push {r4-r11,lr}
    // Insertar código a continuación

    // Retorno, antes R0 debe tener el valor correcto
    pop {r4-r11,pc}
endfun posicion_maximo

/**
 * @brief Ordenar de menor a mayor un arreglo de números en memoria.
 *        La ordenación es en el lugar, sobreescribiendo el arreglo
 *        original.
 * 
 * @param cuenta Cantidad de números en el arreglo, registro R0
 * @param numeros Dirección del primer número, registro R1
 */
defun ordenar_en_sitio_menor_a_mayor
    push {r4-r11,lr}
    // Insertar código a continuación

    // Retorno
    pop {r4-r11,pc}
endfun ordenar_en_sitio_menor_a_mayor
