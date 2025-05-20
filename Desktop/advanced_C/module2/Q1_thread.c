#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<pthread.h>
int N;
 int is_prime(int num){
 if (num<2) return 0;
 for(int i=2;i*i<=num;i++){
 if(num%i==0) return 0;
 }
 return 1;
 }
 
 void * threadfuncA(void *arg){
 int count=0, sum=0,num=2;
 while(count<N){
 if(is_prime(num)){
 sum+=num;
 count++;
 }
 num++;
 }
 printf("the sum of first %d prime numbers is:%d\n",N,sum);
 return NULL;
 }
 void * threadfuncB(void *arg){
 int time=100,t=0;
 while(t<time){
 printf("thread 2 is running!\n");
 sleep(2);
 t+=2;
 }
 return NULL;
}
 void * threadfuncC(void *arg){
 int time=100,t=0;
 while(t<time){
 printf("thread 3 is running!\n");
 sleep(3);
 t+=3;
 } return NULL;
 
 }
 int main(){
 printf("enter the number ?");
 scanf("%d",&N);
 pthread_t ta,tb,tc;
 pthread_create(&ta,NULL,threadfuncA,NULL);
 pthread_create(&tb,NULL,threadfuncB,NULL);
 pthread_create(&tc,NULL,threadfuncC,NULL);
 
 pthread_join(ta,NULL);
 pthread_join(tb,NULL);
 pthread_join(tc,NULL);
 
 return 0;
 
 }
 
