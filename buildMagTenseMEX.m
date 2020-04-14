function buildMagTenseMEX(USE_CUDA,DEBUG)

%use clear all as this also clears dependencies to the .mex files and thus
%they can be overwritten
clearvars -except USE_CUDA DEBUG
   
if ~exist('USE_CUDA','var')
    USE_CUDA = true;
end
if ~exist('DEBUG','var')
    DEBUG = false;
end

%% MagTenseLandauLifshitzSolver_mex
if DEBUG
    if USE_CUDA
        mex -g -Lsource\NumericalIntegration\NumericalIntegration\x64\debug\ -lNumericalIntegration ...
               -Isource\NumericalIntegration\NumericalIntegration\x64\debug\ ...   
               -Lsource\DemagField\DemagField\x64\debug\ -lDemagField...
               -Isource\DemagField\DemagField\x64\debug\ ...
               -Lsource\TileDemagTensor\TileDemagTensor\x64\debug\ -lTileDemagTensor ...
               -Isource\TileDemagTensor\TileDemagTensor\x64\debug\ ...           
               '-Lc:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.2\lib\x64\' -lcublas ...
               -lcudart -lcuda -lcusparse...
               '-Lc:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2019\windows\mkl\lib\intel64_win\' -lmkl_intel_lp64 -lmkl_blas95_lp64...       
               '-Ic:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2019\windows\mkl\include\' ...
               -Lsource\MagTenseMicroMag\x64\debug\ -lMagTenseMicroMag ...
               -Isource\MagTenseMicroMag\x64\debug\ ...            
            source\MagTenseMEX\MagTenseMEX\MagTenseLandauLifshitzSolver_mex.f90 COMPFLAGS="$COMPFLAGS /O3 /extend_source:132 /real_size:64 /fpe:0" -R2018a
    else
        %--- Currently NO_CUDA is only supported in release
    end
    movefile MagTenseLandauLifshitzSolver_mex.mexw64 matlab\MEX_files\MagTenseLandauLifshitzSolver_mex.mexw64
    movefile MagTenseLandauLifshitzSolver_mex.mexw64.pdb matlab\MEX_files\MagTenseLandauLifshitzSolver_mex.mexw64.pdb
else
    if USE_CUDA
        mex -Lsource\NumericalIntegration\NumericalIntegration\x64\release\ -lNumericalIntegration ...
               -Isource\NumericalIntegration\NumericalIntegration\x64\release\ ...   
               -Lsource\DemagField\DemagField\x64\release\ -lDemagField...
               -Isource\DemagField\DemagField\x64\release\ ...
               -Lsource\TileDemagTensor\TileDemagTensor\x64\release\ -lTileDemagTensor ...
               -Isource\TileDemagTensor\TileDemagTensor\x64\release\ ...           
               '-Lc:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.2\lib\x64\' -lcublas ...
               -lcudart -lcuda -lcusparse...
               '-Lc:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2019\windows\mkl\lib\intel64_win\' -lmkl_intel_lp64 -lmkl_blas95_lp64...       
               '-Ic:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2019\windows\mkl\include\' ...
               -Lsource\MagTenseMicroMag\x64\release\ -lMagTenseMicroMag ...
               -Isource\MagTenseMicroMag\x64\release\ ...            
            source\MagTenseMEX\MagTenseMEX\MagTenseLandauLifshitzSolver_mex.f90 COMPFLAGS="$COMPFLAGS /O3 /extend_source:132 /real_size:64 /fpe:0" -R2018a
    else
        mex -Lsource\NumericalIntegration\NumericalIntegration\x64\release\ -lNumericalIntegration ...
           -Isource\NumericalIntegration\NumericalIntegration\x64\release\ ...   
           -Lsource\DemagField\DemagField\x64\release\ -lDemagField...
           -Isource\DemagField\DemagField\x64\release\ ...
           -Lsource\TileDemagTensor\TileDemagTensor\x64\release\ -lTileDemagTensor ...
           -Isource\TileDemagTensor\TileDemagTensor\x64\release\ ...           
           -lcudart -lcuda -lcusparse...      
           '-Lc:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2019\windows\mkl\lib\intel64_win\' -lmkl_intel_lp64  -lmkl_blas95_lp64 ...       
           '-Ic:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2019\windows\mkl\include\' ...
           -Lsource\MagTenseMicroMag\x64\Release_no_CUDA\ -lMagTenseMicroMag ...
           -Isource\MagTenseMicroMag\x64\Release_no_CUDA\ ...            
        source\MagTenseMEX\MagTenseMEX\MagTenseLandauLifshitzSolver_mex.f90 COMPFLAGS="$COMPFLAGS /O3 /extend_source:132 /real_size:64 /fpe:0" -R2018a
    end
    movefile MagTenseLandauLifshitzSolver_mex.mexw64 matlab\MEX_files\MagTenseLandauLifshitzSolver_mex.mexw64
end


%% IterateMagnetization_mex
if DEBUG
    mex -g -Lsource\DemagField\DemagField\x64\debug\ -lDemagField...
           -Isource\DemagField\DemagField\x64\debug\ ...
           -Lsource\NumericalIntegration\NumericalIntegration\x64\debug\ -lNumericalIntegration ...
           -Isource\NumericalIntegration\NumericalIntegration\x64\debug\ ...
           -Lsource\TileDemagTensor\TileDemagTensor\x64\debug\ -lTileDemagTensor ...
           -Isource\TileDemagTensor\TileDemagTensor\x64\debug\ ...        
        source\MagTenseMEX\MagTenseMEX\IterateMagnetization_mex.f90 COMPFLAGS="$COMPFLAGS /O3 /extend_source:132 /real_size:64 /fpe:0" -R2018a

    movefile IterateMagnetization_mex.mexw64 matlab\MEX_files\IterateMagnetization_mex.mexw64
    movefile IterateMagnetization_mex.mexw64.pdb matlab\MEX_files\IterateMagnetization_mex.mexw64.pdb
else
    mex -Lsource\DemagField\DemagField\x64\release\ -lDemagField...
       -Isource\DemagField\DemagField\x64\release\ ...
       -Lsource\NumericalIntegration\NumericalIntegration\x64\release\ -lNumericalIntegration ...
       -Isource\NumericalIntegration\NumericalIntegration\x64\release\ ...
       -Lsource\TileDemagTensor\TileDemagTensor\x64\release\ -lTileDemagTensor ...
       -Isource\TileDemagTensor\TileDemagTensor\x64\release\ ...        
    source\MagTenseMEX\MagTenseMEX\IterateMagnetization_mex.f90 COMPFLAGS="$COMPFLAGS /O3 /extend_source:132 /real_size:64 /fpe:0" -R2018a

    movefile IterateMagnetization_mex.mexw64 matlab\MEX_files\IterateMagnetization_mex.mexw64
end
        
%% getHFromTiles_mex
if DEBUG
    mex -g -Lsource\DemagField\DemagField\x64\debug\ -lDemagField...
           -Isource\DemagField\DemagField\x64\debug\ ...
           -Lsource\NumericalIntegration\NumericalIntegration\x64\debug\ -lNumericalIntegration ...
           -Isource\NumericalIntegration\NumericalIntegration\x64\debug\ ...
           -Lsource\TileDemagTensor\TileDemagTensor\x64\debug\ -lTileDemagTensor ...
           -Isource\TileDemagTensor\TileDemagTensor\x64\debug\ ...        
        source\MagTenseMEX\MagTenseMEX\getHFromTiles_mex.f90 COMPFLAGS="$COMPFLAGS /O3 /extend_source:132 /real_size:64  /fpe:0" -R2018a

    movefile getHFromTiles_mex.mexw64 matlab\MEX_files\getHFromTiles_mex.mexw64
    movefile getHFromTiles_mex.mexw64.pdb matlab\MEX_files\getHFromTiles_mex.mexw64.pdb
else
    mex -Lsource\DemagField\DemagField\x64\release\ -lDemagField...
       -Isource\DemagField\DemagField\x64\release\ ...
       -Lsource\NumericalIntegration\NumericalIntegration\x64\release\ -lNumericalIntegration ...
       -Isource\NumericalIntegration\NumericalIntegration\x64\release\ ...
       -Lsource\TileDemagTensor\TileDemagTensor\x64\release\ -lTileDemagTensor ...
       -Isource\TileDemagTensor\TileDemagTensor\x64\release\ ...        
    source\MagTenseMEX\MagTenseMEX\getHFromTiles_mex.f90 COMPFLAGS="$COMPFLAGS /O3 /extend_source:132 /real_size:64  /fpe:0" -R2018a

    movefile getHFromTiles_mex.mexw64 matlab\MEX_files\getHFromTiles_mex.mexw64
end

%% getNFromTile_mex
if DEBUG
    mex -g -Lsource\DemagField\DemagField\x64\debug\ -lDemagField...
           -Isource\DemagField\DemagField\x64\debug\ ...
           -Lsource\NumericalIntegration\NumericalIntegration\x64\debug\ -lNumericalIntegration ...
           -Isource\NumericalIntegration\NumericalIntegration\x64\debug\ ...
           -Lsource\TileDemagTensor\TileDemagTensor\x64\debug\ -lTileDemagTensor ...
           -Isource\TileDemagTensor\TileDemagTensor\x64\debug\ ...            
        source\MagTenseMEX\MagTenseMEX\getNFromTile_mex.f90 COMPFLAGS="$COMPFLAGS /O3 /extend_source:132 /real_size:64  /fpe:0" -R2018a

    movefile getNFromTile_mex.mexw64 matlab\MEX_files\getNFromTile_mex.mexw64
    movefile getNFromTile_mex.mexw64.pdb matlab\MEX_files\getNFromTile_mex.mexw64.pdb
else
    mex -Lsource\DemagField\DemagField\x64\release\ -lDemagField...
           -Isource\DemagField\DemagField\x64\release\ ...
           -Lsource\NumericalIntegration\NumericalIntegration\x64\release\ -lNumericalIntegration ...
           -Isource\NumericalIntegration\NumericalIntegration\x64\release\ ...
           -Lsource\TileDemagTensor\TileDemagTensor\x64\release\ -lTileDemagTensor ...
           -Isource\TileDemagTensor\TileDemagTensor\x64\release\ ...            
        source\MagTenseMEX\MagTenseMEX\getNFromTile_mex.f90 COMPFLAGS="$COMPFLAGS /O3 /extend_source:132 /real_size:64  /fpe:0" -R2018a

    movefile getNFromTile_mex.mexw64 matlab\MEX_files\getNFromTile_mex.mexw64
end

%% getMagForce_mex
if DEBUG
    mex -g -Lsource\MagneticForceIntegrator\MagneticForceIntegrator\x64\debug\ -lMagneticForceIntegrator...
           -Isource\MagneticForceIntegrator\MagneticForceIntegrator\x64\debug\ ...
           -Lsource\DemagField\DemagField\x64\debug\ -lDemagField...
           -Isource\DemagField\DemagField\x64\debug\ ...
           -Lsource\NumericalIntegration\NumericalIntegration\x64\debug\ -lNumericalIntegration ...
           -Isource\NumericalIntegration\NumericalIntegration\x64\debug\ ...
           -Lsource\TileDemagTensor\TileDemagTensor\x64\debug\ -lTileDemagTensor ...
           -Isource\TileDemagTensor\TileDemagTensor\x64\debug\ ...                
        source\MagTenseMEX\MagTenseMEX\getMagForce_mex.f90 COMPFLAGS="$COMPFLAGS /O2 /Qopenmp /extend_source:132 /real_size:64  /fpe:0" -R2018a

    movefile getMagForce_mex.mexw64 matlab\MEX_files\getMagForce_mex.mexw64
    movefile getMagForce_mex.mexw64.pdb matlab\MEX_files\getMagForce_mex.mexw64.pdb
else
    mex -Lsource\MagneticForceIntegrator\MagneticForceIntegrator\x64\release\ -lMagneticForceIntegrator...
           -Isource\MagneticForceIntegrator\MagneticForceIntegrator\x64\release\ ...
           -Lsource\DemagField\DemagField\x64\release\ -lDemagField...
           -Isource\DemagField\DemagField\x64\release\ ...
           -Lsource\NumericalIntegration\NumericalIntegration\x64\release\ -lNumericalIntegration ...
           -Isource\NumericalIntegration\NumericalIntegration\x64\release\ ...
           -Lsource\TileDemagTensor\TileDemagTensor\x64\release\ -lTileDemagTensor ...
           -Isource\TileDemagTensor\TileDemagTensor\x64\release\ ...                
        source\MagTenseMEX\MagTenseMEX\getMagForce_mex.f90 COMPFLAGS="$COMPFLAGS /O2 /Qopenmp /extend_source:132 /real_size:64  /fpe:0" -R2018a

    movefile getMagForce_mex.mexw64 matlab\MEX_files\getMagForce_mex.mexw64
end

end