import "arduino"

const LED_PIN = 48  # GPIO2 is commonly used for the built-in LED on ESP32 DevKitC

setup:
  Serial.begin(9600)
  Serial.println("Starting serial....")
  pinMode(LED_PIN, OUTPUT)
  Serial.println("setup complete")

loop:
  digitalWrite(LED_PIN, HIGH)
  delay(1000)
  digitalWrite(LED_PIN, LOW)
  delay(1000)
  Serial.println("loop completed")