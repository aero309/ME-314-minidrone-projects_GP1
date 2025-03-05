x0 = zeros(1,17);
u0 = zeros(nu,4);

Qpx = 80;
Qpy = 80;
Qpz = 800;
Qx = 60;
Qy = 60;
Qwx = .5;
Qwz = 0.1;
Qt = 3.;
Qv = 1.;
Qu = 1.;


nx = 17;
ny = 17;
nu = 4;


nlobj = nlmpc(nx,ny,nu);

nlobj.Model.StateFcn = "EOMStateFcn";
Ts = 1;
nlobj.Ts = Ts;
nlobj.PredictionHorizon = 20;
nlobj.ControlHorizon = 2;



for i = 1:nu
    nlobj.MV(i).Min = Vehicle.Motor.minLimit;   % Minimum thrust (N)
    nlobj.MV(i).Max = Vehicle.Motor.maxLimit;  % Maximum thrust (N)
end

nlobj.Optimization.CustomCostFcn = @(X,U,data) 10*sum(U(1:end-1,data.MVIndex(1)).^2);

validateFcns(nlobj,rand(nx,1),rand(nu,1));

