#include <stdint.h>

/**
 * @brief Sumar dos enteros de 32 bit
 * 
 * @param A registro R0
 * @param B registro R1
 * @return int32_t registro R0 
 */
int32_t suma(int32_t A,int32_t B);

/**
 * @brief Sumar los números de un arreglo en memoria
 * 
 * @param cuenta Cantidad de números en registro R0
 * @param numeros Dirección del primer número en registro R1
 * @return int64_t parte alta en R1, parte baja en R0 
 */
int64_t sumatoria(int32_t cuenta,int32_t *numeros);

/**
 * @brief Encuentra la posicion del máximo elemento de un arreglo
 * 
 * @param cuenta cantidad de números en el arreglo, registro R0
 * @param numeros dirección del primer número, registro R1
 * @return uint32_t Posición del mayor número, 0 : inicio del arreglo, 1: segundo número, etc.
 */
int32_t posicion_maximo(int32_t cuenta,int32_t *numeros);

/**
 * @brief Ordenar de menor a mayor un arreglo de números en memoria.
 *        La ordenación es en el lugar, sobreescribiendo el arreglo
 *        original.
 * 
 * @param cuenta Cantidad de números en el arreglo, registro R0
 * @param numeros Dirección del primer número, registro R1
 */
void ordenar_en_sitio_menor_a_mayor(int32_t cuenta,int32_t *numeros);
