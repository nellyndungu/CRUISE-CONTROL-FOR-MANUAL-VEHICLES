within CruiseControlModel;

model CruiseControlSystem
  // Vehicle dynamics
  Vehicle vehicle;
  
  // Cruise control controller
  ControlUnit controller;
  
  // Speed sensor to read actual speed
  SpeedSensor speedSensor;
  
  // Inputs
  input Real acceleratorPedal "Driver's accelerator pedal position (0 to 1)";
  input Real speed "Actual vehicle speed" annotation (Output(quantity="Speed", unit="m/s"));
  
  // Output: Actual vehicle speed
  output Real vehicleSpeed = speed;
  
  
equation
  // Connect the driver's accelerator pedal input to the controller
  controller.acceleratorPedal = acceleratorPedal;
  
  // Connect the speed sensor output (speed) to the speed input in the system
  speed = speedSensor.speed;
  
  // Connect the speed input to the vehicle
  vehicle.velocity = speed;
  
  // Connect the controller output (throttle) to the vehicle
  vehicle.throttle = controller.throttle;
  
end CruiseControlSystem;
