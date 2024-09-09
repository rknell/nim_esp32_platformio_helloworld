# This file maps the arduino.h file to something that can be digested by Nim

# Mostly translated with c2nim from Arduino.h and friends
import macros

{.push importc, header:"Arduino.h".}
# nim-1.4.0 or later
let LED_BUILTIN* {.nodecl.}: uint8
let INPUT* {.nodecl.}: uint8
let OUTPUT* {.nodecl.}: uint8
let INPUT_PULLUP* {.nodecl.}: uint8
let HIGH* {.nodecl.}: uint8
let LOW* {.nodecl.}: uint8
let LSBFIRST* {.nodecl.}: uint8
let MSBFIRST* {.nodecl.}: uint8
let F_CPU* {.nodecl.}: culong
{.pop.}

#proc F_CPU*(): culong {.importcpp: "F_CPU@".}
template interrupts*() = {.emit:"sei();".}
template nointerrupts*() = {.emit:"cli();".}

{.push header:"Arduino.h".}
proc pinMode*(pin: uint8; mode: uint8){.importcpp: "pinMode(@)".}
proc digitalWrite*(pin: uint8; val: uint8) {.importcpp: "digitalWrite(@)".}
proc digitalRead*(pin: uint8): cint {.importcpp: "digitalRead(@)".}
proc analogRead*(pin: uint8): cint {.importcpp: "analogRead(@)".}
proc analogReference*(mode: uint8) {.importcpp: "analogReference(@)".}
proc analogWrite*(pin: uint8; val: cint) {.importcpp: "analogWrite(@)".}
proc millis*(): culong {.importcpp: "millis(@)".}
proc micros*(): culong {.importcpp: "micros(@)".}
proc delay*(ms: culong) {.importcpp: "delay(@)".}
proc delayMicroseconds*(us: cuint) {.importcpp: "delayMicroseconds(@)".}
proc pulseIn*(pin: uint8; state: uint8; timeout: culong): culong {.importcpp: "pulseIn(@)".}
proc pulseInLong*(pin: uint8; state: uint8; timeout: culong): culong {.importcpp: "pulseInLong(@)".}
proc shiftOut*(dataPin: uint8; clockPin: uint8; bitOrder: uint8; val: uint8) {.importcpp: "shiftOut(@)".}
proc shiftIn*(dataPin: uint8; clockPin: uint8; bitOrder: uint8): uint8 {.importcpp: "shiftIn(@)".}
proc attachInterrupt*(interruptNum: uint8; userFunc: proc (); mode: cint) {.importcpp: "attachInterrupt(@)".}
proc detachInterrupt*(interruptNum: uint8) {.importcpp: "detachInterrupt(@)".}

type
  HardwareSerial* {.importcpp: "HardwareSerial", bycopy.} = object

var Serial* {.importcpp: "Serial".}: HardwareSerial
proc begin*(this: var HardwareSerial; baud: cint) {.importcpp: "begin".}
proc available*(this: var HardwareSerial): cint {.importcpp: "available".}
proc read*(this: var HardwareSerial): cint {.importcpp: "read".}
{.pop.}
#
proc write*(this: var HardwareSerial; n: uint8): csize_t {.discardable,importcpp: "write", header: "HardwareSerial.h".}

{.push importc, header:"Arduino.h".}
let DEC* {.nodecl.}: cint
let HEX* {.nodecl.}: cint
let OCT* {.nodecl.}: cint
let BIN* {.nodecl.}: cint
{.pop.}

{.push importcpp, header:"Arduino.h".}
proc print*(this:var HardwareSerial; s: cstring)
proc print*(this:var HardwareSerial; n:cchar)
proc print*(this:var HardwareSerial; n:char, m:cint = DEC)
proc print*(this:var HardwareSerial; n:cint,   m:cint = DEC)
proc print*(this:var HardwareSerial; n:cuint,  m:cint = DEC)
proc print*(this:var HardwareSerial; n:clong,  m:cint = DEC)
proc print*(this:var HardwareSerial; n:culong, m:cint = DEC)
proc print*(this:var HardwareSerial; n:cdouble,m:cint = 2)
#
proc println*(this:var HardwareSerial; s: cstring)
proc println*(this:var HardwareSerial; c: cchar)
proc println*(this:var HardwareSerial; c: char, m:cint = DEC)
proc println*(this:var HardwareSerial; n:cint,    m:cint = DEC)
proc println*(this:var HardwareSerial; n:cuint,   m:cint = DEC)
proc println*(this:var HardwareSerial; n:clong,   m:cint = DEC)
proc println*(this:var HardwareSerial; n:culong,  m:cint = DEC)
proc println*(this:var HardwareSerial; n:cdouble, m:cint = 2)
proc println*(this:var HardwareSerial)
#[
      size_t print(const __FlashStringHelper *);
    # size_t print(const String &);
    # size_t print(const char[]);
    # size_t print(char);
    # size_t print(unsigned char, int = DEC);
    # size_t print(int, int = DEC);
    # size_t print(unsigned int, int = DEC);
    # size_t print(long, int = DEC);
    # size_t print(unsigned long, int = DEC);
    # size_t print(double, int = 2);
      size_t print(const Printable&);

    size_t println(const __FlashStringHelper *);
    # size_t println(const String &s);
    # size_t println(const char[]);
    # size_t println(char);
    # size_t println(unsigned char, int = DEC);
    # size_t println(int, int = DEC);
    # size_t println(unsigned int, int = DEC);
    # size_t println(long, int = DEC);
    # size_t println(unsigned long, int = DEC);
    # size_t println(double, int = 2);
    size_t println(const Printable&);
    # size_t println(void);
]#
{.pop.}

proc pgmReadByte*(a: ptr uint8): uint8 {.importc:"pgm_read_byte", header:"avr/pgmspace.h" .}

proc myputchar*(c: char, f: FILE): cint {.exportc,cdecl.} =
  discard Serial.write(c.uint8).cint
  result = 0

# Convenience macros for the setup() and loop() functions

template setup*(code: untyped) =
  proc setup*() {.exportcpp.} =
    code

template loop*(code: untyped) =
  proc loop*() {.exportcpp.} =
    code