nx = 13;
ny = 9;
nu = 4;


nlobj = nlmpc(nx,ny,nu);

nlobj.Model.StateFcn = "EOMStateFcn";
nlobj.Model.OutputFcn = "NMPCOutputFcn";
TsMPC = 0.005;
nlobj.Ts = TsMPC;
nlobj.PredictionHorizon = 20;
nlobj.ControlHorizon = 2;



for i = 1:nu
    nlobj.MV(i).Min = Vehicle.Motor.minLimit/Vehicle.Motor.thrustToMotorCommand;   % Minimum thrust (N)
    nlobj.MV(i).Max = Vehicle.Motor.maxLimit/Vehicle.Motor.thrustToMotorCommand;  % Maximum thrust (N)
end

nlobj.Optimization.CustomCostFcn = "NMPC_FT_CostFcn";

validateFcns(nlobj,rand(nx,1),rand(nu,1));

