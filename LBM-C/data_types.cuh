#ifndef DATA_TYPES_H
#define DATA_TYPES_H

#include "macros.cu"

// Define a struct which represents the D2Q9 lattice
typedef struct 
{
// Population distributions
	double *f_prev;
	double *f_curr;
	double *ux;
	double *uy;
	double *u;
	double *rho;
} Lattice;

typedef struct
{
	int *boundary_type;
	double *boundary_value;
	double *geometry;
	double *force;
} DomainArray;

typedef struct
{
	double tau;
	int2 length;
	bool forcing;
	int collision_type;
} DomainConstant;

typedef struct
{
	double f[Q];
	double rho;
	double ux;
	double uy;
	double F[DIM];
} Node;

// Boundary condition function pointers
typedef void (*boundary_condition) (Node *, double *);
typedef void (*collision) (Node *, int[9], int[9], int[9], double[9], double, double);

#endif