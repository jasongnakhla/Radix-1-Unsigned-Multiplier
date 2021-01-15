----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2019 12:15:51 PM
-- Design Name: 
-- Module Name: ca4_tb - Behavioral
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

entity ca4_tb is
--  Port ( );
end ca4_tb;

architecture Behavioral of ca4_tb is

component ca4 is
  Port (clk, rst, mult_en: in STD_LOGIC;
        x, y: in STD_LOGIC_VECTOR(15 downto 0);
        product: out STD_LOGIC_VECTOR(31 downto 0));
end component;

signal clk_int, rst_int, en_int: STD_LOGIC;
signal x_int, y_int: STD_LOGIC_VECTOR(15 downto 0);
signal product_int: STD_LOGIC_VECTOR(31 downto 0);
constant cp: time:= 10ns;

begin

uut: ca4 port map(clk => clk_int, rst => rst_int, mult_en => en_int, x => x_int, y => y_int, product => product_int);

-- clock
process
begin
clk_int <= '1';
wait for cp/2;
clk_int <= '0';
wait for cp/2;
end process;

-- reset
process
begin
rst_int <= '1';
wait for cp;
rst_int <= '0';
wait;
end process;

process
begin
wait for cp;
en_int <= '1';
wait for cp;
en_int <= '0';
--wait for 16*cp;
--en_int <= '1';
--wait for cp;
--en_int <= '0';
--wait for 16*cp;
--en_int <= '1';
--wait for cp;
--en_int <= '0';
--wait for 16*cp;
--en_int <= '1';
--wait for cp;
--en_int <= '0';
wait;
end process;


-- Multiplier
process
begin
--x_int <= "0000000000001101";
--wait for 16*cp;
--x_int <= "1111111111111111";
--wait for 16*cp;
--x_int <= "0000000001111111";
--wait for 16*cp;
x_int <= "0000000000010101";
wait;
end process;

-- Multiplicand
process
begin
--y_int <= "0000000000001101";
--wait for 16*cp;
--y_int <= "1111111111111111";
--wait for 16*cp;
--y_int <= "0000000000000011";
--wait for 16*cp;
y_int <= "1011000001000011";
wait;
end process;

end Behavioral;