
FC = /opt/intel/bin/ifort


FFLAGS = -r8 -O3 -fpe0 -fp-model source -fpic -I../../../NumericalIntegrationLib/NumericalIntegration/NumericalIntegration/ \
	-I../../../SpecialFunctions/SpecialFunctions/


#FC = /usr/bin/gfortran

#FFLAGS = -O3 -fopenmp -fdefault-real-8 -ffixed-line-length-none -fPIC




.KEEP_STATE:
.SUFFIXES:
.SUFFIXES: .for .f90 .F90 .f .o
.f.o:
	$(FC) -c $(FFLAGS) $<
.f90.o:
	$(FC) -c $(FFLAGS) $<
.F90.o:
	$(FC) -c $(FFLAGS) $<
.for.o:
	$(FC) -c $(FFLAGS) $<

TileDemagTensorLib = $(FC) TileTensorHelperFunctions.o TileCircPieceTensor.o TileCylPieceTensor.o TileRectangularPrismTensor.o TilePlanarCoilTensor.o  TileNComponents.o

TileDemagTensorlib.a: $(TileDemagTensorLib)
	ar rc TileDemagTensorlib.a TileTensorHelperFunctions.o TileCircPieceTensor.o TileCylPieceTensor.o TileRectangularPrismTensor.o TilePlanarCoilTensor.o  TileNComponents.o


clean:
	rm -f *.o *.x *.mod *.a


TileTensorHelperFunctions.o	:TileTensorHelperFunctions.f90
TileCircPieceTensor.o	:TileCircPieceTensor.f90 TileTensorHelperFunctions.o
TileCylPieceTensor.o   :TileCylPieceTensor.f90 TileTensorHelperFunctions.o
TileRectangularPrismTensor.o   :TileRectangularPrismTensor.f90 TileTensorHelperFunctions.o
TilePlanarCoilTensor.o   :TilePlanarCoilTensor.f90 TileTensorHelperFunctions.o
TileNComponents.o	:TileNComponents.f90 TileTensorHelperFunctions.o TileCircPieceTensor.o TileCylPieceTensor.o TileRectangularPrismTensor.o TilePlanarCoilTensor.o




