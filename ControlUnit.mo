within CruiseControlModel;

model ControlUnit
// Cruise control controller parameters
  parameter Real kp = 0.1 "Proportional gain";
  parameter Real ki = 0.01 "Integral gain";
  Real maxSpeed = 100;
  
  // Inputs
  input Real acceleratorPedal "Driver's accelerator pedal position (0 to 1)";
  input Real speed "Actual vehicle speed" annotation (Output(quantity="Speed", unit="m/s")); // Connect to the SpeedSensor output
  // Output: Throttle position
  output Real throttle;
  
  // Internal variables
  Real speedError "Difference between set speed and actual speed";
  Real integralError "Integral of speed error";
  
equation
  // Calculate the speed error (difference between set speed and actual speed)
  speedError = acceleratorPedal * (maxSpeed - speed);
  
  // Calculate the integral error (simple integration using Euler method)
  der(integralError) = speedError;
  
  // Calculate the throttle using PID control
  throttle = kp * speedError + ki * integralError;

end ControlUnit;
