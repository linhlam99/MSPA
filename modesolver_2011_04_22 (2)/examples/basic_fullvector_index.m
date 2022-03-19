% This example shows how to calculate and plot both the
% fundamental TE and TM eigenmodes of an example 3-layer ridge
% waveguide using the full-vector eigenmode solver.  

% Refractive indices:
n1 = 3.34;          % Lower cladding
n2 = linspace(3.305,3.44,10);    %change the ridge index
n3 = 1.00;          % Upper cladding (air)

% Layer heights:
h1 = 2.0;           % Lower cladding
h2 = 1.3;           % Core thickness
h3 = 0.5;           % Upper cladding

% Horizontal dimensions:
rh = 1.1;           % Ridge height
rw = 1 ; % Ridge half-width changing
side = 1.5;         % Space on side

% Grid size:
dx = 8*0.0125;        % grid size (horizontal)
dy = 8*0.0125;        % grid size (vertical)

lambda = 1.55;      % vacuum wavelength
nmodes = 1;         % number of modes to compute
i= 10;
for iter = 1:i

[x,y,xc,yc,nx,ny,eps,edges] = waveguidemesh([n1,n2,n3],[h1,h2,h3], ...
                                            rh,rw,side,dx,dy); 

% First consider the fundamental TE mode:

[Hx,Hy,neff] = wgmodes(lambda,n2(iter),nmodes,dx,dy,eps,'000A');

fprintf(1,'neff = %.6f\n',neff);

%going 1 to 10

for nodes = 1:nmodes
    figure(iter);
    subplot(121);
    contourmode(x,y,Hx(:,:,nodes));
     title('Hy (TE mode)'); xlabel('x'); ylabel('y');
    for v = edges, line(v{:}); end

    subplot(122);
    contourmode(x,y,Hy(:,:,nodes));
    title('Hy (TE mode)'); xlabel('x'); ylabel('y');
    for v = edges, line(v{:}); end
end

end 
