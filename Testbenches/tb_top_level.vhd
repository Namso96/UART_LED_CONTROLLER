----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.02.2021 21:35:16
-- Design Name: 
-- Module Name: tb_top_level - Behavioral
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


entity tb_top_level is
--  Port ( );
end tb_top_level ;

architecture Behavioral of tb_top_level  is

component Top_level is 
port (
           LED : out STD_LOGIC_VECTOR (3 downto 0);
           clk: in STD_LOGIC;
           reset: in STD_LOGIC;  
           TX : out STD_LOGIC;
           RX : in STD_LOGIC

);

end component; 

signal LED: std_logic_vector(3 downto 0);
signal clk: std_logic; 
signal reset: std_logic;
signal tx: std_logic; 
signal rx: std_logic; 

-- testbench signals 
constant clk_period: time:= 83.333ns;
constant clk_tick_period: time:= 6.900us;
constant bit_period: time:=104us;
constant data_word: std_logic_vector(7 downto 0):= x"A1";

begin

uut: Top_level port map(

led => led,
clk => clk,
reset => reset,
tx => tx ,
rx => rx
);


clk_proc: process
begin
clk<='1'; 
wait for clk_period/2;
clk<= '0';
wait for clk_period/2; 
end process; 

reset<='0';

tx_stm_proc: process 
begin

rx<= '1'; 

wait for bit_period *4;

rx<= '0'; 

wait for bit_period; 

for i in 0 to 7 loop 

    rx<= data_word(i);
    wait for bit_period; 

end loop;
    
-- stop bit; 

rx<='1'; 
end process;









end Behavioral;


