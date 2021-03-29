----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.09.2020 13:01:33
-- Design Name: 
-- Module Name: tb_uart_rx - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_uart_rx is
--  Port ( );
end tb_uart_rx;

architecture Behavioral of tb_uart_rx is


component UART_RX is port (
        clk, reset : in std_logic;
        rx: in std_logic;
        
        
        clk_ticks: in std_logic;
        
        
        rx_done: out std_logic;
        RX_LED: out std_logic;
        dout: out std_logic_vector(7 downto 0)
        
        );
        end component; 


component UART_TX is port (
         clk: in std_logic;
         reset: in std_logic;
         clk_ticks: in std_logic;
         din: in std_logic_vector(7 downto 0);
         tx_load: in std_logic; -- best to set it to rxdone
         
         TX_LED: out std_logic;
         tx_done: out std_logic;
         tx: out std_logic  
        
        );
        end component; 


signal  clk, reset :  std_logic;
signal  rx:  std_logic;


signal  clk_ticks:  std_logic;


signal rx_done:  std_logic;
SIGNAL RX_LED: std_logic;
signal dout:  std_logic_vector(7 downto 0);

signal o_clk_ticks_tb:  std_logic;

signal data_word: std_logic_vector(7 downto 0):= "11011101"; --  8 databits  --   C9h

--tx signals 
signal din: std_logic_vector(7 downto 0); 
signal tx_load: std_logic;
signal tx_led: std_logic; 
signal tx_done: std_logic;
signal tx: std_logic; 



-- testbench signals 
constant clk_period: time:= 83.333ns;
constant clk_tick_period: time:= 6.900us;
constant bit_period: time:=104us;



begin

uut: UART_RX PORT MAP (

clk=>clk,
reset=>reset,
rx=>rx,
clk_ticks=> clk_ticks,
 rx_done=> rx_done,
 RX_LED=>RX_LED,
 dout=>dout

);

uut_tx: UART_TX port map (

clk=> clk,
reset=> reset,
clk_ticks=>clk_ticks,
din=> data_word,
tx_load=> tx_load,
tx_led=>tx_led,
tx_done=> tx_done,
tx=> rx

);


clk_proc: process
begin
clk<='1'; 
wait for clk_period/2;
clk<= '0';
wait for clk_period/2; 
end process; 

clk_tick_proc: process
begin
clk_ticks<='1'; 
wait for clk_tick_period/2;
clk_ticks<= '0';
wait for clk_tick_period/2; 
end process;



stm_proc: process
begin 


reset<='0'; 
wait for 104us ;
tx_load<= '1';
wait for 1 us; 
tx_load<= '0'; 
wait for 10ms; 
--rx<='1'; 
--wait for 104us *3;
--rx<= '0'; 
--wait for 104us;  

--FOR i in 0 to 7 loop

--rx<= data_word(i); 
--wait for bit_period;

--end loop;

--rx<='1';

--wait for 104us * 3; 

end process;




end Behavioral;







