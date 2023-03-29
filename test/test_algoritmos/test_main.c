#include <practico.h>
#include <unity.h>

void setUp(void){}
void tearDown(void){}

static void test_suma_1(void)
{
    TEST_ASSERT_EQUAL_INT32(10,suma(10,0));
    TEST_ASSERT_EQUAL_INT32(10,suma(0,10));
} 
static void test_suma_2(void)
{
    TEST_ASSERT_EQUAL_INT32(15,suma(10,5));
    TEST_ASSERT_EQUAL_INT32(15,suma(20,-5));
}
static void test_suma_3(void)
{
    TEST_ASSERT_EQUAL_INT32(100000000,suma(400000000,-300000000));
    TEST_ASSERT_EQUAL_INT32(100000000,suma(50000000,50000000));
}

static void test_sumatoria_1(void)
{
    int32_t numeros[]={1,2,-3,5};
    const int32_t cantidad = 0;
    const int64_t esperado = 0;
    const int64_t obtenido = sumatoria(cantidad,numeros);
    TEST_ASSERT_EQUAL_INT32(esperado,obtenido);
} 

static void test_sumatoria_2(void)
{
    int32_t numeros[]={2,1,-3,5};
    const int32_t cantidad = 1;
    const int64_t esperado = 2;
    const int64_t obtenido = sumatoria(cantidad,numeros);
    TEST_ASSERT_EQUAL_INT32(esperado,obtenido);
} 
static void test_sumatoria_3(void)
{
    int32_t numeros[]={2,1,-3,5};
    const int32_t cantidad = 2;
    const int64_t esperado = 2+1;
    const int64_t obtenido = sumatoria(cantidad,numeros);
    TEST_ASSERT_EQUAL_INT32(esperado,obtenido);
} 

static void test_sumatoria_4(void)
{
    int32_t numeros[]={2,1,-3,5};
    const int32_t cantidad = 4;
    const int64_t esperado = 1+2-3+5;
    const int64_t obtenido = sumatoria(cantidad,numeros);
    TEST_ASSERT_EQUAL_INT32(esperado,obtenido);
} 

static void test_sumatoria_5(void)
{
    int32_t numeros[]={INT32_MAX,1};
    const int32_t cantidad = 2;
    const int64_t esperado = ((int64_t)INT32_MAX) + 1LL;
    const int64_t obtenido = sumatoria(cantidad,numeros);
    TEST_ASSERT_EQUAL_INT32(esperado,obtenido);
} 

static void test_sumatoria_6(void)
{
    int32_t numeros[]={INT32_MIN,-1};
    const int32_t cantidad = 2;
    const int64_t esperado = ((int64_t)INT32_MIN) - 1LL;
    const int64_t obtenido = sumatoria(cantidad,numeros);
    TEST_ASSERT_EQUAL_INT32(esperado,obtenido);
} 

static void test_posicion_maximo_1(void)
{
    int32_t numeros[]={1,2};
    const int32_t cantidad = 1; // solo el primer número vale
    const int32_t esperado = 0;
    const int32_t obtenido = posicion_maximo(cantidad,numeros);
    TEST_ASSERT_EQUAL_INT32(esperado,obtenido);
} 

static void test_posicion_maximo_2(void)
{
    int32_t numeros[]={1,2,3,16,-1,-2,-3};
    const int32_t cantidad = 7;
    const int32_t esperado = 3;
    const int32_t obtenido = posicion_maximo(cantidad,numeros);
    TEST_ASSERT_EQUAL_INT32(esperado,obtenido);
} 

static void test_posicion_maximo_3(void)
{
    int32_t numeros[]={-1,-2,-3,-16,1,2,3};
    const int32_t cantidad = 7;
    const int32_t esperado = 6;
    const int32_t obtenido = posicion_maximo(cantidad,numeros);
    TEST_ASSERT_EQUAL_INT32(esperado,obtenido);
} 

static void test_ordenar_1(void)
{
    int32_t numeros[]={2,1};
    const int32_t cantidad = 1;
    int32_t ordenado[]={2,1};
    ordenar_en_sitio_menor_a_mayor(cantidad,numeros);
    TEST_ASSERT_EQUAL_MEMORY(ordenado,numeros,sizeof(ordenado));
} 
static void test_ordenar_2(void)
{
    int32_t numeros[]={2,1};
    const int32_t cantidad = 2;
    int32_t ordenado[]={1,2};
    ordenar_en_sitio_menor_a_mayor(cantidad,numeros);
    TEST_ASSERT_EQUAL_MEMORY(ordenado,numeros,sizeof(ordenado));
} 
static void test_ordenar_3(void)
{
    int32_t numeros[]={1,4,3,2,5,6};
    const int32_t cantidad = 6;
    int32_t ordenado[]={1,2,3,4,5,6};
    ordenar_en_sitio_menor_a_mayor(cantidad,numeros);
    TEST_ASSERT_EQUAL_MEMORY(ordenado,numeros,sizeof(ordenado));
} 
static void test_ordenar_4(void)
{
    int32_t numeros[]={-1,-4,-3,-2,-5,-6};
    const int32_t cantidad = 6;
    int32_t ordenado[]={-6,-5,-4,-3,-2,-1};
    ordenar_en_sitio_menor_a_mayor(cantidad,numeros);
    TEST_ASSERT_EQUAL_MEMORY(ordenado,numeros,sizeof(ordenado));
} 

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_suma_1);
    RUN_TEST(test_suma_2);
    RUN_TEST(test_suma_3);
    RUN_TEST(test_sumatoria_1);
    RUN_TEST(test_sumatoria_2);
    RUN_TEST(test_sumatoria_3);
    RUN_TEST(test_sumatoria_4);
    RUN_TEST(test_sumatoria_5);
    RUN_TEST(test_sumatoria_6);
    RUN_TEST(test_posicion_maximo_1);
    RUN_TEST(test_posicion_maximo_2);
    RUN_TEST(test_posicion_maximo_3);
    RUN_TEST(test_ordenar_1);
    RUN_TEST(test_ordenar_2);
    RUN_TEST(test_ordenar_3);
    RUN_TEST(test_ordenar_4);
    UNITY_END();
    for(;;); // HALT
}