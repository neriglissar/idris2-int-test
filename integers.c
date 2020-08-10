#include <stdio.h>
#include <stdlib.h>

uint64_t     MAX_u64  = -1;
uint32_t     MAX_u32  = -1;
int64_t      MAX_64   = 9223372036854775807;
int32_t      MAX_32   = 2147483647;
unsigned int MAX_uint = -1;
int MAX_int           = 2147483647;

uint64_t get__MAX_u64(){
  printf("C:     %llu\n", MAX_u64);
  return MAX_u64;
}

uint32_t get__MAX_u32(){
  printf("C:     %u\n", MAX_u32);
  return MAX_u32;
}

int64_t get__MAX_64(){
  printf("C:     %lld\n", MAX_64);
  return MAX_u64;
}

int32_t get__MAX_32(){
  printf("C:     %d\n", MAX_32);
  return MAX_32;
}

unsigned int get__MAX_uint(){
  printf("C:     %u\n", MAX_uint);
  return MAX_uint;
}

int get__MAX_int(){
  printf("C:     %d\n", MAX_int);
  return MAX_int;
}

uint64_t read__uint64(uint64_t* ptr){
  uint64_t res = (*ptr);
  free(ptr);
  return res;
}

uint64_t* write__uint64(uint64_t i){
  printf("C:     %llu\n", i);
  uint64_t* res = malloc(sizeof(uint64_t));
  *res = i;
  return res;
}

int64_t read__int64(int64_t* ptr){
  int64_t res = (*ptr);
  free(ptr);
  return res;
}

int64_t* write__int64(int64_t i){
  printf("C:     %lld\n", i);
  int64_t* res = malloc(sizeof(int64_t));
  *res = i;
  return res;
}

uint32_t read__uint32(uint32_t* ptr){
  uint32_t res = (*ptr);
  free(ptr);
  return res;
}

uint32_t* write__uint32(uint32_t i){
  printf("C:     %u\n", i);
  uint32_t* res = malloc(sizeof(uint32_t));
  *res = i;
  return res;
}

int32_t read__int32(int32_t* ptr){
  int32_t res = (*ptr);
  free(ptr);
  return res;
}

int32_t* write__int32(int32_t i){
  printf("C:     %d\n", i);
  int32_t* res = malloc(sizeof(int32_t));
  *res = i;
  return res;
}

unsigned int read__uint(unsigned int* ptr){
  unsigned int res = (*ptr);
  free(ptr);
  return res;
}

unsigned int* write__uint(unsigned int i){
  printf("C:     %u\n", i);
  unsigned int* res = malloc(sizeof(unsigned int));
  *res = i;
  return res;
}

int read__int(int* ptr){
  int res = (*ptr);
  free(ptr);
  return res;
}

int* write__int(int i){
  printf("C:     %d\n", i);
  int* res = malloc(sizeof(int));
  *res = i;
  return res;
}
