within CruiseControlModel;

model SpeedSensor
  // Input: Vehicle velocity
  input Real velocity;
  
  // Output: Actual speed read by the sensor
  output Real speed;
  
equation
  // Actual speed read by the sensor is the same as the vehicle velocity
  speed = velocity;
  
end SpeedSensor;
