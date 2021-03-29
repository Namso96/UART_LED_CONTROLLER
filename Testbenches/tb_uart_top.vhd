----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.01.2021 20:20:32
-- Design Name: 
-- Module Name: tb_uart_top - Behavioral
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

entity tb_uart_top is
--  Port ( );
end tb_uart_top;

architecture Behavioral of tb_uart_top is

component UART_TOP is 
port (
           LED : out STD_LOGIC_VECTOR (2 downto 0);
           clk: in STD_LOGIC;
           reset: in STD_LOGIC;  
           TX : out STD_LOGIC;
           RX : in STD_LOGIC

);

end component; 

signal LED: std_logic_vector(2 downto 0);
signal clk: std_logic; 
signal reset: std_logic;
signal tx: std_logic; 
signal rx: std_logic; 


begin

uut: UART_TOP port map(

led,
clk,
reset,
tx,
rx
);

tx_stm_proc: process 
begin





end process;





end Behavioral;












