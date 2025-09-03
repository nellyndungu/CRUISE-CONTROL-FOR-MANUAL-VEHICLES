within CruiseControlModel;

model Vehicle
  // Vehicle parameters
  parameter Real mass = 1000.0 "Vehicle mass in kg";
  parameter Real dragCoefficient = 0.3 "Drag coefficient";
  parameter Real rollingResistanceCoefficient = 0.01 "Rolling resistance coefficient";
  parameter Real frontalArea = 2.5 "Frontal area in m^2";
  parameter Real engineMaxForce = 2000.0;
  parameter Real airDensity = 1.225;
  
  // Vehicle states
  Real velocity "Vehicle velocity in m/s";
  
  // Throttle input from the controller
  input Real throttle "Throttle position (0 to 1)";
  
equation
  // Vehicle dynamics: Force balance equation
  mass * der(velocity) = throttle * engineMaxForce - 0.5 * airDensity * dragCoefficient * frontalArea * velocity^2 - rollingResistanceCoefficient * mass * 9.81;
  
  // Initialize the vehicle velocity
  initial equation
    velocity = 0.0;
  
end Vehicle;
