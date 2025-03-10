nx = 4;
ny = 4;
nu = 1;
nlobj = nlmpc(nx,ny,nu);

nlobj.Ts = 0.005;
nlobj.PredictionHorizon = 30;
nlobj.ControlHorizon = 2;

nlobj.Model.StateFcn = "StateFcn";
nlobj.Optimization.CustomCostFcn = "CostFcn";
nlobj.Model.IsContinuousTime = false;

nlobj.MV(1).Min = (Vehicle.Motor.minLimit/Vehicle.Motor.thrustToMotorCommand) * 4;
nlobj.MV(1).Max = 0.8;

validateFcns(nlobj,rand(nx,1),rand(nu,1));
