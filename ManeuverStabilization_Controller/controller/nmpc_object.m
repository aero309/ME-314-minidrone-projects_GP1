



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

nlobj.Optimization.CustomCostFcn = "NMPC_FT_CostFcn";

validateFcns(nlobj,rand(nx,1),rand(nu,1));

