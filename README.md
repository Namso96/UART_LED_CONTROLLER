# UART_LED_CONTROLLER
UART controller with an command module. 

Block Diagram: 

![image](https://user-images.githubusercontent.com/81587483/112888373-2c8b8000-90cc-11eb-9f81-5eec9e253c78.png)


UART controller which has the following specs: 1 start bit, 8 data bits 1 stop bit and no parity. Baud rate can be set via a generic in UART top level 'baudrate_factor'.
The design also has a command module where it can be used to control FPGA peripherals such as LEDs, further commands can also be added. 




