# Barebones Nim with PlatformIO and Arduino Framework running on an ESP32-S3

This project is a barebones example of using Nim with PlatformIO and the Arduino framework to build a simple example app to flash an ESP32. The purpose of it is to just get some documentation out there about what is actually required to do this and wire it up because frankly it was all a bit confusing.

I've tested this on a MacOS Intel running OSX 13.6, but hope it should just work on other platforms

## Requirements

- PlatformIO
- Nim
- ESP32-S3-DevKitC-1 (or some other esp or arduino compatible board)

## Setup

1. **Install PlatformIO:**
   Follow the instructions on the [PlatformIO installation page](https://docs.platformio.org/en/latest/core/installation.html).

2. **Install Nim:**
   Follow the instructions on the [Nim installation page](https://nim-lang.org/install.html).

3. **Clone the repository:**
   ```sh
   git clone https://github.com/rknell/nim_esp32_platformio_helloworld.git
   cd nim_esp32_platformio_helloworld
   ```

4. **Install dependencies:**
Probably not necessary but hey lets get everything up-to-date
   ```sh
   pio pkg install
   ```

5. **Finally setup the board.**
The last thing to do is edit your platformio.ini file and put the correct board details in. I'm using an ESP32-S3 devkit board in this example, but, fingers crossed you should be able to put in any valid board reference with PlatformIO and get it working. Do note though that at this time I can't work out which is the actual internal LED pin, but the serial communication is working for proof of life and upload.

## Building and Flashing

1. **Build the project:**
   ```sh
   pio run
   ```

2. **Flash the ESP32:**
   ```sh
   pio run --target upload
   ```

## Project Structure

- `platformio.ini`: PlatformIO Project Configuration File.
- `nim.cfg`: Nim configuration file.
- `src/arduino.nim`: Main Nim source file containing the example code.

## Example Code

The example code in `src/arduino.nim` demonstrates basic usage of the Arduino framework with Nim. It includes functions for printing to the serial console and setting up the main loop.
