function phiFaceAverage = arithmeticMean(phi)
% This function gets the value of the field variable phi defined
% over the MeshStructure and calculates the arithmetic average on 
% the cell faces, for a uniform mesh.
% 
% SYNOPSIS:
%   phiFaceAverage = arithmeticMean(phi)
% 
% PARAMETERS:
%   
% 
% RETURNS:
%   
% 
% EXAMPLE:
% 
% SEE ALSO:
%     

%{
Copyright (c) 2012, 2013, Ali Akbar Eftekhari
All rights reserved.

Redistribution and use in source and binary forms, with or 
without modification, are permitted provided that the following 
conditions are met:

    *   Redistributions of source code must retain the above copyright notice, 
        this list of conditions and the following disclaimer.
    *   Redistributions in binary form must reproduce the above 
        copyright notice, this list of conditions and the following 
        disclaimer in the documentation and/or other materials provided 
        with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, 
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR 
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, 
OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
%}



% extract data from the mesh structure

d = phi.domain.dimension;
if (d ==1) || (d==1.5)
    dx = phi.domain.cellsize.x;
    xvalue=(dx(1:end-1).*phi.value(1:end-1)+dx(2:end).*phi.value(2:end))./(dx(2:end)+dx(1:end-1));
    yvalue=[];
    zvalue=[];
	phiFaceAverage = arithmeticMean1D(MeshStructure, phi);
elseif (d == 2) || (d == 2.5) || (d == 2.8)
	phiFaceAverage = arithmeticMean2D(MeshStructure, phi);
elseif (d == 3) || (d==3.2)
    phiFaceAverage = arithmeticMean3D(MeshStructure, phi);
end
phiFaceAverage=FaceVariable(phi.domain, xvalue, yvalue, zvalue);
