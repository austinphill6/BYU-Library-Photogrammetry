#!/usr/bin/env python

# import the drivers
import I2C_LCD_driver
import time
import RPi.GPIO as GPIO

# call the lcd mylcd
mylcd = I2C_LCD_driver.lcd()

# clear the display
mylcd.lcd_clear()

# some variables
cursor_line = 2

# print out random nonsense
mylcd.lcd_display_string(">", cursor_line)

mylcd.lcd_display_string("option 1", 1, 2)
mylcd.lcd_display_string("option 2", 2, 2)
mylcd.lcd_display_string("option 3", 3, 2)
mylcd.lcd_display_string("option 4", 4, 2)

# test moving the cursor
while True:
    time.sleep(1)
    mylcd.lcd_display_string(" ", cursor_line)
    if cursor_line >= 4:
        cursor_line = 1
    else:
        cursor_line += 1
    mylcd.lcd_display_string(">", cursor_line)
